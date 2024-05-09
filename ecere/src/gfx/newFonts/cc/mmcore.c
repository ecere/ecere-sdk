/* *****************************************************************************
 * Copyright (c) 2007-2023 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#ifndef _GNU_SOURCE
 #define _GNU_SOURCE
#endif

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <float.h>
#include <time.h>
#include <stdarg.h>
#include <errno.h>
#include <assert.h>

#include "mm.h"

#if MM_UNIX
 #include <dlfcn.h>
 #include <fcntl.h>
 #include <dirent.h>
 #include <unistd.h>
 #include <sys/types.h>
 #include <sys/stat.h>
#elif MM_WINDOWS
 #include <windows.h>
#endif

#if MM_LINUX
 #include <sys/sysinfo.h>
 #include <sched.h>
#endif

#include "mm.h"


////


mmCore mmcore = { 0 };


#if MM_NUMA_DEBUG

#undef mmNumaAlloc
#undef mmNumaFree

#endif


////


#if MM_LINUX


static void *mmNumaLib;

static int (*mm_numa_available)(void);
static void (*mm_numa_set_bind_policy)(int strict);
static void (*mm_numa_set_strict)(int strict);
static int (*mm_numa_num_configured_cpus)();
static int (*mm_numa_num_configured_nodes)();
static long long (*mm_numa_node_size64)(int node, long long *freep);
static int (*mm_numa_node_of_cpu)(int cpu);
static int (*mm_numa_run_on_node)(int node);
static void *(*mm_numa_alloc_onnode)(size_t size, int node);
static void (*mm_numa_free)(void *mem, size_t size);
static void (*mm_numa_tonode_memory)(void *start, size_t size, int node);
static long (*mm_mbind)(void *addr, unsigned long len, int mode, const unsigned long *nodemask, unsigned long maxnode, unsigned flags);
#define MPOL_BIND        2
#define MPOL_MF_MOVE (1<<1)  /* Move pages owned by this process to conform to mapping */

static inline void mmNumaLoad()
{
  mmNumaLib = 0;
  mmNumaLib = dlopen( "libnuma.so", RTLD_LAZY );
  if( !mmNumaLib )
    mmNumaLib = dlopen( "/usr/lib/libnuma.so", RTLD_LAZY );
  if( mmNumaLib )
  {
    mm_numa_available = dlsym( mmNumaLib, "numa_available" );
    mm_numa_set_bind_policy = dlsym( mmNumaLib, "numa_set_bind_policy" );
    mm_numa_set_strict = dlsym( mmNumaLib, "numa_set_strict" );
    mm_numa_num_configured_cpus = dlsym( mmNumaLib, "numa_num_configured_cpus" );
    mm_numa_num_configured_nodes = dlsym( mmNumaLib, "numa_num_configured_nodes" );
    mm_numa_node_size64 = dlsym( mmNumaLib, "numa_node_size64" );
    mm_numa_node_of_cpu = dlsym( mmNumaLib, "numa_node_of_cpu" );
    mm_numa_run_on_node = dlsym( mmNumaLib, "numa_run_on_node" );
    mm_numa_alloc_onnode = dlsym( mmNumaLib, "numa_alloc_onnode" );
    mm_numa_free = dlsym( mmNumaLib, "numa_free" );
    mm_numa_tonode_memory = dlsym( mmNumaLib, "numa_tonode_memory" );
    mm_mbind = dlsym( mmNumaLib, "mbind" );
  }
  if( ( mm_numa_alloc_onnode ) && ( mm_numa_free ) )
    mmcore.numa.capable = 1;
  else
  {
    mmcore.numa.capable = 0;
    mm_numa_alloc_onnode = 0;
    mm_numa_free = 0;
  }
  return;
}

static inline void mmNumaUnload()
{
  if( mmNumaLib )
  {
    dlclose( mmNumaLib );
    mmNumaLib = 0;
  }
  return;
}

/* Prevent libnuma warning messages on stderr */
void numa_warn( int num, char *fmt, ... )
{
  return;
}


#elif MM_WINDOWS


HMODULE mmKernelHandle;
HANDLE *mmCurrentProcess;

typedef struct mm__PROCESSOR_NUMBER
{
  WORD Group;
  BYTE Number;
  BYTE Reserved;
} mm_PROCESSOR_NUMBER, *mm_PPROCESSOR_NUMBER;

typedef struct mm__GROUP_AFFINITY
{
  KAFFINITY Mask;
  WORD      Group;
  WORD      Reserved[3];
} mm_GROUP_AFFINITY, *mm_PGROUP_AFFINITY;

static WORD (*mm_GetActiveProcessorGroupCount)();
static DWORD (*mm_GetActiveProcessorCount)( WORD GroupNumber );
static BOOL (*mm_GetNumaProcessorNodeEx)( mm_PPROCESSOR_NUMBER Processor, PUSHORT NodeNumber );
static BOOL (*mm_SetThreadGroupAffinity)( _In_ HANDLE hThread, _In_ const mm_GROUP_AFFINITY *GroupAffinity, _Out_opt_ mm_PGROUP_AFFINITY PreviousGroupAffinity );
static BOOL (*mm_GetNumaAvailableMemoryNodeEx)( USHORT Node, PULONGLONG AvailableBytes );
static BOOL (*mm_GlobalMemoryStatusEx)( LPMEMORYSTATUSEX lpBuffer );
static LPVOID (*mm_VirtualAllocExNuma)( HANDLE hProcess, LPVOID lpAddress, SIZE_T dwSize, DWORD flAllocationType, DWORD flProtect, DWORD nndPreferred );


static inline void mmNumaLoad()
{
  mmKernelHandle = GetModuleHandleA( "kernel32.dll" );
  mmCurrentProcess = GetCurrentProcess();
  mmcore.numa.capable = 1;

  mm_GetActiveProcessorGroupCount = (void *)GetProcAddress( mmKernelHandle, "GetActiveProcessorGroupCount" );
  mm_GetActiveProcessorCount = (void *)GetProcAddress( mmKernelHandle, "GetActiveProcessorCount" );
  mm_GetNumaProcessorNodeEx = (void *)GetProcAddress( mmKernelHandle, "GetNumaProcessorNodeEx" );
  mm_SetThreadGroupAffinity = (void *)GetProcAddress( mmKernelHandle, "SetThreadGroupAffinity" );
  mm_GetNumaAvailableMemoryNodeEx = (void *)GetProcAddress( mmKernelHandle, "GetNumaAvailableMemoryNodeEx" );
  mm_GlobalMemoryStatusEx = (void *)GetProcAddress( mmKernelHandle, "GlobalMemoryStatusEx" );
  mm_VirtualAllocExNuma = (void *)GetProcAddress( mmKernelHandle, "VirtualAllocExNuma" );

  return;
}

static inline void mmNumaUnload()
{
  return;
}


#else


static inline void mmNumaLoad()
{
  return;
}

static inline void mmNumaUnload()
{
  return;
}


#endif


////


#if MM_LINUX && !MM_ANDROID

static void mmNumaInit()
{
  int nodeindex, cpuindex, cpuconfcount, cpunodeindex;

  if( ( mm_numa_available ) && ( mm_numa_available() != -1 ) )
  {
    mm_numa_set_bind_policy( 0 );
    mm_numa_set_strict( 0 );
    cpuconfcount = mm_numa_num_configured_cpus();
    if( cpuconfcount > MM_CPU_COUNT_MAXIMUM )
      cpuconfcount = MM_CPU_COUNT_MAXIMUM;
    mmcore.numa.nodecount = mm_numa_num_configured_nodes();
    if( mmcore.numa.nodecount > MM_NODE_COUNT_MAXIMUM )
      mmcore.numa.nodecount = MM_NODE_COUNT_MAXIMUM;
    mmcore.sysmemory = 0;
    for( nodeindex = 0 ; nodeindex < mmcore.numa.nodecount ; nodeindex++ )
    {
      mmcore.numa.nodesize[nodeindex] = mm_numa_node_size64( nodeindex, 0 );
      mmcore.sysmemory += mmcore.numa.nodesize[nodeindex];
      mmcore.numa.nodecpucount[nodeindex] = 0;
    }
    for( cpuindex = 0 ; cpuindex < mmcore.cpucount ; cpuindex++ )
    {
      cpunodeindex = mm_numa_node_of_cpu( cpuindex );
      mmcore.numa.cpunode[ cpuindex ] = cpunodeindex;
      if( (unsigned)cpunodeindex < mmcore.numa.nodecount )
        mmcore.numa.nodecpucount[cpunodeindex]++;
    }
  }
  return;
}

#elif MM_WINDOWS

static void mmNumaInit()
{
  int nodecount, nodeindex, cpuindex, groupcount, groupindex, groupcpucount, cpucount, cpunodeindex;
  unsigned long long nodememory;
  unsigned short cpunodeindex16;
  unsigned char cpunodeindex8;
  mm_PROCESSOR_NUMBER procnumber;
  ULONG HighestNodeNumber;

  SYSTEM_INFO sysinfo;
  nodecount = 0;
  if( GetNumaHighestNodeNumber( &HighestNodeNumber ) )
    nodecount = HighestNodeNumber + 1;
  if( nodecount > 1 )
  {
    if( mm_GetActiveProcessorCount && mm_GetActiveProcessorCount )
    {
      cpucount = 0;
      groupcount = mm_GetActiveProcessorGroupCount();
      for( groupindex = 0 ; groupindex < groupcount ; groupindex++ )
      {
        groupcpucount = mm_GetActiveProcessorCount( groupindex );
        for( cpuindex = 0 ; cpuindex < groupcpucount ; cpuindex++ )
        {
          mmcore.numa.cputable[ cpucount ] = ( groupindex << 8 ) | cpuindex;
          if( ++cpucount == MM_CPU_COUNT_MAXIMUM )
            goto done;
        }
      }
      done:
      mmcore.cpucount = cpucount;
    }
    else
    {
      /* This is only the count of processor in the current group, due to Windows non-sense crap */
      GetSystemInfo( &sysinfo );
      mmcore.cpucount = sysinfo.dwNumberOfProcessors;
      if( mmcore.cpucount > MM_CPU_COUNT_MAXIMUM )
        mmcore.cpucount = MM_CPU_COUNT_MAXIMUM;
      for( cpuindex = 0 ; cpuindex < mmcore.cpucount ; cpuindex++ )
        mmcore.numa.cputable[cpuindex] = cpuindex;
    }

    mmcore.numa.nodecount = nodecount;
    if( mmcore.numa.nodecount > MM_NODE_COUNT_MAXIMUM )
      mmcore.numa.nodecount = MM_NODE_COUNT_MAXIMUM;
    for( nodeindex = 0 ; nodeindex < mmcore.numa.nodecount ; nodeindex++ )
    {
      nodememory = 0;
      if( mm_GetNumaAvailableMemoryNodeEx )
        mm_GetNumaAvailableMemoryNodeEx( nodeindex, &nodememory );
      else
        GetNumaAvailableMemoryNode( nodeindex, &nodememory );
      mmcore.numa.nodesize[nodeindex] = nodememory;
      mmcore.numa.nodecpucount[nodeindex] = 0;
    }
    for( cpuindex = 0 ; cpuindex < mmcore.cpucount ; cpuindex++ )
    {
      if( mm_GetNumaProcessorNodeEx )
      {
        procnumber.Group = mmcore.numa.cputable[cpuindex] >> 8;
        procnumber.Number = mmcore.numa.cputable[cpuindex] & 0xff;
        mm_GetNumaProcessorNodeEx( &procnumber, &cpunodeindex16 );
        cpunodeindex = cpunodeindex16;
      }
      else
      {
        GetNumaProcessorNode( cpuindex, &cpunodeindex8 );
        cpunodeindex = cpunodeindex8;
      }
      mmcore.numa.cpunode[ cpuindex ] = cpunodeindex;
      if( (unsigned)cpunodeindex < mmcore.numa.nodecount )
        mmcore.numa.nodecpucount[cpunodeindex]++;
    }
  }
  return;
}

#elif MM_UNIX

static void mmNumaInit()
{
  return;
}

#else

static void mmNumaInit()
{
  return;
}

#endif


////


static volatile int mmInitialized = 0;


#if MM_LINUX && !MM_ANDROID

static void mmCoreInit()
{
  int64_t sysmemory;
  mmcore.cpucount = get_nprocs_conf();
  if( mmcore.cpucount > MM_CPU_COUNT_MAXIMUM )
    mmcore.cpucount = MM_CPU_COUNT_MAXIMUM;
  mmcore.cpuallcount = get_nprocs();
  mmcore.pagesize = sysconf( _SC_PAGESIZE );
  sysmemory = sysconf( _SC_PHYS_PAGES );
  if( sysmemory > 0 )
    sysmemory *= mmcore.pagesize;
  mmcore.sysmemory = sysmemory;
  mmcore.numa.nodecount = 1;
  mmcore.numa.nodecpucount[0] = mmcore.cpucount;
  return;
}

#elif MM_WINDOWS

static void mmCoreInit()
{
  SYSTEM_INFO sysinfo;
  MEMORYSTATUSEX memorystatusex;
  MEMORYSTATUS memorystatus;

  GetSystemInfo( &sysinfo );
  /* This is only the count of processor in the current group, due to Windows non-sense crap */
  mmcore.cpuallcount = sysinfo.dwNumberOfProcessors;
  /* We could check dwActiveProcessorMask for active/online processors... */
  mmcore.cpucount = sysinfo.dwNumberOfProcessors;
  if( mmcore.cpucount > MM_CPU_COUNT_MAXIMUM )
    mmcore.cpucount = MM_CPU_COUNT_MAXIMUM;
  mmcore.pagesize = sysinfo.dwPageSize;
  if( mm_GlobalMemoryStatusEx )
  {
    memorystatusex.dwLength = sizeof(MEMORYSTATUSEX);
    mm_GlobalMemoryStatusEx( &memorystatusex );
    mmcore.sysmemory = memorystatusex.ullTotalPhys;
  }
  else
  {
    memorystatus.dwLength = sizeof(MEMORYSTATUS);
    GlobalMemoryStatus( &memorystatus );
    mmcore.sysmemory = memorystatus.dwTotalPhys;
  }
  mmcore.numa.nodecount = 1;
  mmcore.numa.nodecpucount[0] = mmcore.cpucount;
  return;
}

#elif MM_UNIX

static void mmCoreInit()
{
  int64_t sysmemory;
  mmcore.cpucount = sysconf( _SC_NPROCESSORS_CONF );
  if( mmcore.cpucount > MM_CPU_COUNT_MAXIMUM )
    mmcore.cpucount = MM_CPU_COUNT_MAXIMUM;
  mmcore.cpuallcount = sysconf( _SC_NPROCESSORS_ONLN );
  mmcore.pagesize = sysconf( _SC_PAGESIZE );
  sysmemory = 0;
 #if defined(_SC_PHYS_PAGES)
  sysmemory = sysconf( _SC_PHYS_PAGES );
  if( sysmemory > 0 )
    sysmemory *= mmcore.pagesize;
 #endif
  mmcore.sysmemory = sysmemory;
  mmcore.numa.nodecount = 1;
  mmcore.numa.nodecpucount[0] = mmcore.cpucount;
  return;
}

#else

static void mmCoreInit()
{
  mmcore.cpucount = 1;
  mmcore.cpuallcount = 1;
  mmcore.sysmemory = -1;
  mmcore.numa.nodecount = 1;
  mmcore.numa.nodecpucount[0] = mmcore.cpucount;
  return;
}

#endif


////


static int mmGetCpuid( uint32_t level, uint32_t index, uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx )
{
#if defined(__GNUC__)
 #if MM_ARCH_AMD64
  asm("cpuid"
    : "=a" (*eax),
      "=b" (*ebx),
      "=c" (*ecx),
      "=d" (*edx)
    : "0" (level), "c"(index) );
 #endif
 #if MM_ARCH_IA32
  asm("movl %%ebx, %%esi\n\t"
      "cpuid\n\t"
      "movl %3, %%edi\n\t"
      "movl %%ebx, (%%edi)\n\t"
      "movl %%esi, %%ebx\n\t"
    : "=a" (*eax), "=c" (*ecx), "=d" (*edx)
    : "m" (ebx), "a" (level), "c"(index) : "edi", "esi", "memory" );
 #endif
  return 1;
#elif defined(_MSC_VER)
  int regs[4];
  __cpuidex( regs, level, index );
  *eax = regs[0];
  *ebx = regs[1];
  *ecx = regs[2];
  *edx = regs[3];
  return 1;
#else
  *eax = 0;
  *ebx = 0;
  *ecx = 0;
  *edx = 0;
  return 0;
#endif
}


static void cpuGetCores( int intellevel, int amdlevel )
{
  uint32_t eax, ebx, ecx, edx;

  if( ( intellevel >= 0x00000001 ) && ( intellevel <= 0x0000ffff ) )
  {
    mmGetCpuid( 0x00000001, 0, &eax, &ebx, &ecx, &edx );
    /* This is the maximum addressable APIC IDs in the package, the count of actual cores may be lower! */
    mmcore.cpuid.socketlogicalcores = ( ebx >> 16 ) & 0xff;
    /* This is NOT reliable if the maximum addressable APIC IDs is > active cores, and we have multiple sockets */
    if( mmcore.cpuid.socketlogicalcores > mmcore.cpucount )
      mmcore.cpuid.socketlogicalcores = mmcore.cpucount;
  }
  if( intellevel >= 0x00000004 )
  {
    mmGetCpuid( 0x00000004, 0, &eax, &ebx, &ecx, &edx );
    if( eax & 0x1f )
      mmcore.cpuid.socketphysicalcores = ( ( eax >> 26 ) & 0x3f ) + 1;
  }
  if( mmcore.cpuid.vendor == MM_CPUID_VENDOR_AMD )
  {
    if( amdlevel >= 0x80000008 )
    {
      mmGetCpuid( 0x80000008, 0, &eax, &ebx, &ecx, &edx );
      mmcore.cpuid.socketphysicalcores = ( ecx & 0xff ) + 1;
    }
  }
  if( !mmcore.cpuid.socketlogicalcores )
    mmcore.cpuid.socketlogicalcores = mmcore.cpuid.socketphysicalcores;
  if( mmcore.cpuid.socketlogicalcores )
    mmcore.cpuid.socketcount = mmcore.cpucount / mmcore.cpuid.socketlogicalcores;
  return;
}


static void cpuGetCacheOld( int intellevel, int amdlevel )
{
  uint32_t eax, ebx, ecx, edx;
  static const int cacheways[0x10] =
  {
    [0x0] = 0,
    [0x1] = 1,
    [0x2] = 2,
    [0x3] = 3, /* ??? */
    [0x4] = 4,
    [0x5] = 6, /* ??? */
    [0x6] = 8,
    [0x7] = 12, /* ??? */
    [0x8] = 16,
    [0x9] = 24, /* ??? */
    [0xa] = 32,
    [0xb] = 48,
    [0xc] = 64,
    [0xd] = 96,
    [0xe] = 128,
    [0xf] = 256
  };

  if( amdlevel >= 0x80000005 )
  {
    mmGetCpuid( 0x80000005, 0, &eax, &ebx, &ecx, &edx );
    if( ( ecx | edx ) )
    {
      mmcore.cache.sizeL1code = edx >> 24;
      mmcore.cache.lineL1code = edx & 0xff;
      mmcore.cache.associativityL1code = ( edx >> 8 ) & 0xff;
      mmcore.cache.sizeL1data = ecx >> 24;
      mmcore.cache.lineL1data = ecx & 0xff;
      mmcore.cache.associativityL1data = ( ecx >> 8 ) & 0xff;
    }
  }
  if( amdlevel >= 0x80000006 )
  {
    mmGetCpuid( 0x80000006, 0, &eax, &ebx, &ecx, &edx );
    if( ( ecx | edx ) )
    {
      mmcore.cache.sizeL2 = ecx >> 16;
      mmcore.cache.lineL2 = ecx & 0xff;
      mmcore.cache.associativityL2 = cacheways[ ( ecx >> 12 ) & 0xf ];
      mmcore.cache.sizeL3 = ( edx >> 18 ) * 512;
      mmcore.cache.lineL3 = edx & 0xff;
      mmcore.cache.associativityL3 = cacheways[ ( edx >> 12 ) & 0xf ];
    }
  }

  return;
}


static void cpuGetCacheNew( int intellevel, int amdlevel )
{
  uint32_t cpuidindex;
  uint32_t eax, ebx, ecx, edx, queryindex;
  uint32_t cachetype, cachelevel, cacheline, cacheassociativity, cachepartitions, cachesets, cachesize, cacheshared;

  cpuidindex = 0;
  if( mmcore.cpuid.vendor == MM_CPUID_VENDOR_INTEL )
  {
    if( intellevel >= 4 )
      cpuidindex = 0x00000004;
  }
  else if( mmcore.cpuid.vendor == MM_CPUID_VENDOR_AMD )
  {
    if( amdlevel >= 0x8000001d )
      cpuidindex = 0x8000001d;
  }
  else
  {
    if( intellevel >= 4 )
      cpuidindex = 0x00000004;
  }

  if( cpuidindex )
  {
    for( queryindex = 0 ; queryindex < 0x10 ; queryindex++ )
    {
      mmGetCpuid( cpuidindex, queryindex, &eax, &ebx, &ecx, &edx );
      cachetype = eax & 0x1f;
      if( !( cachetype ) )
        break;
      cachelevel = ( eax >> 5 ) & 0x7;
      cacheline = ( ebx & 0x0fff ) + 1;
      cachepartitions = ( ( ebx >> 12 ) & 0x03ff ) + 1;
      cacheassociativity = ( ( ebx >> 22 ) & 0x03ff ) + 1;
      cachesets = ecx + 1;
      cachesize = ( cacheassociativity * cachepartitions * cacheline * cachesets ) / 1024;
      cacheshared = ( ( eax >> 14 ) & 0xfff ) + 1;
      if( cacheshared > mmcore.cpuid.socketlogicalcores )
        cacheshared = mmcore.cpuid.socketlogicalcores;
      switch( cachelevel )
      {
        case 1:
          if( cachetype & 0x1 )
          {
            mmcore.cache.sizeL1data = cachesize;
            mmcore.cache.lineL1data = cacheline;
            mmcore.cache.associativityL1data = cacheassociativity;
            mmcore.cache.sharedL1data = cacheshared;
          }
          if( cachetype & 0x2 )
          {
            mmcore.cache.sizeL1code = cachesize;
            mmcore.cache.lineL1code = cacheline;
            mmcore.cache.associativityL1code = cacheassociativity;
            mmcore.cache.sharedL1code = cacheshared;
          }
          if( cachetype == 0x3 )
            mmcore.cache.unifiedL1 = 1;
          break;
        case 2:
          mmcore.cache.sizeL2 = cachesize;
          mmcore.cache.lineL2 = cacheline;
          mmcore.cache.associativityL2 = cacheassociativity;
          mmcore.cache.sharedL2 = cacheshared;
          break;
        case 3:
          mmcore.cache.sizeL3 = cachesize;
          mmcore.cache.lineL3 = cacheline;
          mmcore.cache.associativityL3 = cacheassociativity;
          mmcore.cache.sharedL3 = cacheshared;
          break;
      }
    }
  }

  return;
}


static void mmCpuidInit()
{
  uint32_t ebx, ecx, edx;
  uint32_t intellevel, amdlevel;
  uint32_t *id;
  char *c;

#if !defined(__GNUC__) && !defined(_MSC_VER)
  /* We don't know how to cpuid() for other compilers */
  return;
#endif

  id = (uint32_t *)mmcore.cpuid.vendorstring;
  mmGetCpuid( 0x00000000, 0, &intellevel, &id[0], &id[2], &id[1] );
  mmGetCpuid( 0x80000000, 0, &amdlevel, &ebx, &ecx, &edx );

  mmcore.cpuid.vendorstring[12] = 0;
  if( !( strcmp( mmcore.cpuid.vendorstring, "GenuineIntel" ) ) )
    mmcore.cpuid.vendor = MM_CPUID_VENDOR_INTEL;
  else if( !( strcmp( mmcore.cpuid.vendorstring, "AuthenticAMD" ) ) )
    mmcore.cpuid.vendor = MM_CPUID_VENDOR_AMD;
  else
    mmcore.cpuid.vendor = MM_CPUID_VENDOR_UNKNOWN;

  if( amdlevel >= 0x80000004 )
  {
    id = (uint32_t *)mmcore.cpuid.identifier;
    mmGetCpuid( 0x80000002, 0, &id[0], &id[1], &id[2], &id[3] );
    mmGetCpuid( 0x80000003, 0, &id[4], &id[5], &id[6], &id[7] );
    mmGetCpuid( 0x80000004, 0, &id[8], &id[9], &id[10], &id[11] );
    mmcore.cpuid.identifier[48] = 0;
    for( c = mmcore.cpuid.identifier ; *c == ' ' ; c++ );
    if( c != mmcore.cpuid.identifier )
      memmove( mmcore.cpuid.identifier, c, strlen(c)+1 );
    for( c = mmcore.cpuid.identifier + strlen(mmcore.cpuid.identifier) - 1 ; ( *c == ' ' ) && ( c >= mmcore.cpuid.identifier ) ; c-- )
      *c = 0;
  }

  cpuGetCores( intellevel, amdlevel );
  cpuGetCacheOld( intellevel, amdlevel );
  cpuGetCacheNew( intellevel, amdlevel );

  return;
}


////


static void mmCoreWorkInit()
{
  int stepindex, stageindex, stagelast;
  int stagecores;
  int step[5], stepsize;
  int stagecorecount[32], stageblockcount[32];

  step[0] = mmcore.cache.sharedL1data;
  step[1] = mmcore.cache.sharedL2;
  step[2] = mmcore.cache.sharedL3;
  step[3] = mmcore.numa.nodecpucount[0];
  step[4] = mmcore.cpucount;

  /* Ensure steps keep increasing (no zero gaps due to missing L3 cache or whatever) and divide cleanly the next one */
  if( step[0] <= 0 )
    step[0] = 1;
  for( stepindex = 3 ; stepindex >= 1 ; stepindex-- )
  {
    if( ( step[stepindex] > step[stepindex+1] ) || ( step[stepindex] < step[stepindex-1] ) || !( step[stepindex] ) || ( ( step[stepindex+1] % step[stepindex] ) != 0 ) )
      step[stepindex] = step[stepindex+1];
  }

  /* Build stages */
  stagecores = 1;
  stepindex = 0;
  for( stageindex = 0 ; ; stageindex++ )
  {
    stagecorecount[stageindex] = stagecores;
    stageblockcount[stageindex] = mmcore.cpucount / stagecores;
    if( stagecores == mmcore.cpucount )
      break;
    for( ; ( stagecores >= step[stepindex] ) && ( stepindex < 4 ) ; stepindex++ );
    stepsize = step[stepindex];
    if( ( stepsize % ( stagecores * 2 ) ) == 0 )
      stagecores *= 2;
    else if( ( stepsize % ( stagecores * 3 ) ) == 0 )
      stagecores *= 3;
    else if( ( stepsize % ( stagecores * 5 ) ) == 0 )
      stagecores *= 5;
    else
      stagecores = stepsize;
  }
  mmcore.workmap.stagecount = stageindex + 1;
  /* Reverse stages */
  stagelast = mmcore.workmap.stagecount - 1;
  for( stageindex = 0 ; stageindex < mmcore.workmap.stagecount ; stageindex++ )
  {
    mmcore.workmap.stagecorecount[stageindex] = stagecorecount[ stagelast - stageindex ];
    mmcore.workmap.stageblockcount[stageindex] = stageblockcount[ stagelast - stageindex ];
  }
  /* Pick how many logical CPUs should usually be put on the same task, due to shared caches */
  /*  Intel hyperthreading: L1&L2 shared between two logical CPUs */
  /*  AMD Opterons: only L2 shared between two logical CPUs */
  /*  AMD Ryzen: L1&L2 shared between two logical CPUs */
#if 1
  mmcore.workmap.cpugroupsize = mmcore.cache.sharedL2;
#else
  mmcore.workmap.cpugroupsize = mmcore.cache.sharedL1data;
#endif
  if( mmcore.workmap.cpugroupsize < 1 )
    mmcore.workmap.cpugroupsize = 1;

  return;
}


////


void mmInit()
{
  if( mmInitialized )
    return;
  memset( &mmcore, 0, sizeof(mmCore) );
  mmCoreInit();
  mmNumaLoad();
  mmNumaInit();
  mmCpuidInit();
  mmCoreWorkInit();
  mmInitialized = 1;
  return;
}


void mmEnd()
{
  mmNumaUnload();
  return;
}


////


#if defined(__GNUC__) || defined(__INTEL_COMPILER) || defined(__clang__)
static void __attribute__((constructor)) mmAutoInit()
{
  mmInit();
  return;
}
#endif


////



int mmGetCpuCount()
{
  return mmcore.cpucount;
}

int mmGetNodeCount()
{
  return mmcore.numa.nodecount;
}

uint64_t mmGetNodeSize( int nodeindex )
{
  return mmcore.numa.nodesize[nodeindex];
}

int mmGetNodeForCpu( int cpuindex )
{
  return mmcore.numa.cpunode[cpuindex];
}

int mmGetNodeCpuCount( int nodeindex )
{
  return mmcore.numa.nodecpucount[nodeindex];
}


////


void mmBindThreadToCpu( int cpuindex )
{
#if MM_LINUX
  cpu_set_t cpuset;
  CPU_ZERO( &cpuset );
  CPU_SET( cpuindex, &cpuset );
  sched_setaffinity( 0, sizeof(cpu_set_t), &cpuset );
#elif MM_WIN32
  HANDLE *handle;
  mm_GROUP_AFFINITY groupaffinity;
  handle = GetCurrentThread();
  if( mm_SetThreadGroupAffinity )
  {
    memset( &groupaffinity, 0, sizeof(mm_GROUP_AFFINITY) );
    groupaffinity.Mask = (uint64_t)1 << ( mmcore.numa.cputable[cpuindex] & 0xff );
    groupaffinity.Group = mmcore.numa.cputable[cpuindex] >> 8;
    mm_SetThreadGroupAffinity( handle, &groupaffinity, 0 );
  }
  else
    SetThreadAffinityMask( handle, (DWORD_PTR)( (uint64_t)1 << ( mmcore.numa.cputable[cpuindex] & 0xff ) ) );
#endif
  return;
}

void mmBindThreadToCpuGroup( int cpuindex, int cpucount )
{
  int i;
#if MM_LINUX
  cpu_set_t cpuset;
  CPU_ZERO( &cpuset );
  for( i = 0 ; i < cpucount ; i++ )
    CPU_SET( cpuindex+i, &cpuset );
  sched_setaffinity( 0, sizeof(cpu_set_t), &cpuset );
#elif MM_WIN32
  int group;
  HANDLE *handle;
  mm_GROUP_AFFINITY groupaffinity;
  handle = GetCurrentThread();
  if( mm_SetThreadGroupAffinity )
  {
    memset( &groupaffinity, 0, sizeof(mm_GROUP_AFFINITY) );
    group = mmcore.numa.cputable[cpuindex] >> 8;
    groupaffinity.Mask = 0;
    for( i = 0 ; i < cpucount ; i++ )
    {
      if( ( mmcore.numa.cputable[cpuindex+i] >> 8 ) == group )
        groupaffinity.Mask = (uint64_t)1 << ( mmcore.numa.cputable[cpuindex+i] & 0xff );
    }
    groupaffinity.Group = group;
    mm_SetThreadGroupAffinity( handle, &groupaffinity, 0 );
  }
  else
    SetThreadAffinityMask( handle, (DWORD_PTR)( (uint64_t)1 << ( mmcore.numa.cputable[cpuindex] & 0xff ) ) );
#endif
  return;
}

void mmBindThreadToNode( int nodeindex )
{
#if MM_LINUX
  int cpuindex;
  cpu_set_t cpuset;
  if( ( nodeindex >= 0 ) && ( mm_numa_run_on_node ) )
    mm_numa_run_on_node( nodeindex );
  else
  {
    CPU_ZERO( &cpuset );
    for( cpuindex = 0 ; cpuindex < mmcore.cpucount ; cpuindex++ )
      CPU_SET( cpuindex, &cpuset );
    sched_setaffinity( 0, sizeof(cpu_set_t), &cpuset );
  }
#elif MM_WIN32
  int cpuindex;
  uint64_t cpumask;
  HANDLE *handle;
  mm_GROUP_AFFINITY groupaffinity;
  handle = GetCurrentThread();
  if( mm_SetThreadGroupAffinity )
  {
    groupaffinity.Group = 0;
    for( cpuindex = 0 ; cpuindex < mmcore.cpucount ; cpuindex++ )
    {
      if( mmcore.numa.cpunode[ cpuindex ] == nodeindex )
      {
        groupaffinity.Group = mmcore.numa.cputable[cpuindex] >> 8;
        break;
      }
    }
    cpumask = 0;
    for( ; cpuindex < mmcore.cpucount ; cpuindex++ )
    {
      if( ( mmcore.numa.cpunode[ cpuindex ] == nodeindex ) && ( ( mmcore.numa.cputable[cpuindex] >> 8 ) == groupaffinity.Group ) )
        cpumask |= (uint64_t)1 << ( mmcore.numa.cputable[cpuindex] & 0xff );
    }
    groupaffinity.Mask = cpumask;
    mm_SetThreadGroupAffinity( handle, &groupaffinity, 0 );
  }
  else
  {
    cpumask = ~0;
    if( nodeindex >= 0 )
    {
      cpumask = 0;
      for( cpuindex = 0 ; cpuindex < mmcore.cpucount ; cpuindex++ )
      {
        if( mmcore.numa.cpunode[ cpuindex ] == nodeindex )
          cpumask |= (uint64_t)1 << cpuindex;
      }
    }
    SetThreadAffinityMask( handle, (DWORD_PTR)cpumask );
  }
#endif
  return;
}


///


void *mmNumaAlloc( int nodeindex, size_t size )
{
#if MM_LINUX
  if( ( mm_numa_alloc_onnode ) && ( nodeindex >= 0 ) )
    return mm_numa_alloc_onnode( size, nodeindex );
#elif MM_WIN32
  if( ( mm_VirtualAllocExNuma ) && ( nodeindex >= 0 ) )
    return mm_VirtualAllocExNuma( mmCurrentProcess, NULL, size, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE, nodeindex );
#endif
  /* WARNING: GCC 11.3 appears to think the returned pointer has >= 32 bytes alignment, it emits vmovapd %ymm instructions */
  /* It probably gets confused by numa_alloc_onnode() and malloc() being a fallback ~ numa_alloc_onnode() is page-aligned */
  /* So I'm switching here to mmAlignAlloc()/mmAlignFree() for extra safety */
#if 0
  return malloc( size );
#else
  return mmAlignAlloc( size, 0x40 );
#endif
}

void mmNumaFree( int nodeindex, void *v, size_t size )
{
#if MM_LINUX
  if( ( mm_numa_free ) && ( nodeindex >= 0 ) )
  {
    mm_numa_free( v, size );
    return;
  }
#elif MM_WIN32
  if( nodeindex >= 0 )
  {
    VirtualFree( v, 0, MEM_RELEASE );
    return;
  }
#endif
  /* WARNING: GCC 11.3 appears to think the returned pointer has >= 32 bytes alignment, it emits vmovapd %ymm instructions */
  /* It probably gets confused by numa_alloc_onnode() and malloc() being a fallback ~ numa_alloc_onnode() is page-aligned */
  /* So I'm switching here to mmAlignAlloc()/mmAlignFree() for extra safety */
#if 0
  free( v );
#else
  mmAlignFree( v );
#endif
  return;
}


////


int mmNumaMigrate( int nodeindex, void *start, size_t size )
{
 #if MM_LINUX
/*
  unsigned long nodemask[(MM_NODE_COUNT_MAXIMUM+(sizeof(long)*CHAR_BIT)-1)/(sizeof(long)*CHAR_BIT)];
  memset( nodemask, 0, sizeof(nodemask) );
  nodemask[ nodeindex / (sizeof(long)*CHAR_BIT) ] = 1UL << ( nodeindex & ( (sizeof(long)*CHAR_BIT) - 1 ) );
  if( mm_mbind( start, size, MPOL_BIND, nodemask, sizeof(nodemask), MPOL_MF_MOVE ) == -1 )
    return 0;
  return 1;
*/
  if( mm_numa_tonode_memory )
  {
    mm_numa_tonode_memory( start, size, nodeindex );
    return 1;
  }
 #elif MM_WIN32
 #else
 #endif
  return 0;
}


////


void mmPrintSystemTopology()
{
  int nodeindex, cpuindex, stageindex;
  char *stagestring;
  printf( "System has %d CPU cores\n", mmcore.cpucount );
  printf( "  System memory : %.2f MB\n", (double)mmcore.sysmemory / 1048576.0 );
  printf( "CPU \"%s\" by \"%s\"\n", mmcore.cpuid.identifier, mmcore.cpuid.vendorstring );
  printf( "  Sockets : %d\n", mmcore.cpuid.socketcount );
  printf( "  Physical cores per socket : %d\n", mmcore.cpuid.socketphysicalcores );
  printf( "  Logical cores per socket : %d\n", mmcore.cpuid.socketlogicalcores );
  printf( "NUMA nodes : %d\n", mmcore.numa.nodecount );
  for( nodeindex = 0 ; nodeindex < mmcore.numa.nodecount ; nodeindex++ )
  {
    printf( "  NUMA node %d, size %.2f MB, CPU count %d (", nodeindex, (double)mmcore.numa.nodesize[nodeindex] / 1048576.0, mmcore.numa.nodecpucount[nodeindex] );
    for( cpuindex = 0 ; cpuindex < mmcore.cpucount ; cpuindex++ )
    {
      if( mmcore.numa.cpunode[ cpuindex ] == nodeindex )
        printf( " %d", cpuindex );
    }
    printf( " )\n" );
  }
  if( ( mmcore.cache.sizeL1code | mmcore.cache.sizeL2 | mmcore.cache.sizeL3 ) )
  {
    printf( "Cache layout\n" );
    printf( "  Code L1: size of %d KB, %d-ways associative, shared between %d cores\n", mmcore.cache.sizeL1code, mmcore.cache.associativityL1code, mmcore.cache.sharedL1code );
    printf( "  Data L1: size of %d KB, %d-ways associative, shared between %d cores\n", mmcore.cache.sizeL1data, mmcore.cache.associativityL1data, mmcore.cache.sharedL1data );
    if( mmcore.cache.unifiedL1 )
      printf( "  (L1 shared between code and data)\n" );
    printf( "  Data L2: size of %d KB, %d-ways associative, shared between %d cores\n", mmcore.cache.sizeL2, mmcore.cache.associativityL2, mmcore.cache.sharedL2 );
    if( mmcore.cache.sizeL3 )
      printf( "  Data L3: size of %d KB, %d-ways associative, shared between %d cores\n", mmcore.cache.sizeL3, mmcore.cache.associativityL3, mmcore.cache.sharedL3 );
  }
  printf( "Work map\n" );
  for( stageindex = 0 ; stageindex < mmcore.workmap.stagecount ; stageindex++ )
  {
    stagestring = 0;
    if( mmcore.workmap.stagecorecount[stageindex] == mmcore.cache.sharedL1data )
      stagestring = " (Shared L1 cache)";
    else if( mmcore.workmap.stagecorecount[stageindex] == mmcore.cache.sharedL2 )
      stagestring = " (Shared L2 cache)";
    else if( mmcore.workmap.stagecorecount[stageindex] == mmcore.cpucount )
      stagestring = " (Whole system)";
    else if( mmcore.workmap.stagecorecount[stageindex] == mmcore.numa.nodecpucount[0] )
      stagestring = " (Whole NUMA node)";
    else if( mmcore.workmap.stagecorecount[stageindex] == mmcore.cache.sharedL3 )
      stagestring = " (Shared L3 cache)";
    else if( mmcore.workmap.stagecorecount[stageindex] == mmcore.cpuid.socketlogicalcores )
      stagestring = " (Whole CPU socket)";
    printf( "  Stage %d: %d blocks, %d cores per block%s\n", stageindex, mmcore.workmap.stageblockcount[stageindex], mmcore.workmap.stagecorecount[stageindex], ( stagestring ? stagestring : "" ) );
  }
  return;
}


////


#if MM_NUMA_DEBUG

static mtMutex mmDebugNumaMutex = MT_MUTEX_INITIALIZER;

void *mmDebugNumaList = 0;

uint64_t mmDebugNumaLastPrintTime = 0;

typedef struct
{
  uint64_t alloctime;
  int nodeindex;
  void *p;
  size_t size;
  mmListNode list;
} mmNumaChunk;

static void mmDebugNumaPrint()
{
  uint64_t curtime;
  mmNumaChunk *chunk;
  curtime = mmGetMillisecondsTime();
  if( curtime > ( mmDebugNumaLastPrintTime + MM_NUMA_DEBUG_PRINT_INTERVAL ) )
  {
    if( mmDebugNumaList )
    {
      printf( "BEGIN NUMA ALLOC LIST\n" );
      for( chunk = mmDebugNumaList ; chunk ; chunk = chunk->list.next )
        printf( "Chunk %p, size %lld, nodeindex %d, allocated %lld seconds ago\n", chunk->p, (long long)chunk->size, chunk->nodeindex, (long long)( curtime - chunk->alloctime ) );
      printf( "END NUMA ALLOC LIST\n" );
    }
    mmDebugNumaLastPrintTime = curtime;
  }
  return;
}


void *mmDebugNumaAlloc( int nodeindex, size_t size )
{
  void *p;
  mmNumaChunk *chunk;
  mtMutexLock( &mmDebugNumaMutex );
  mmDebugNumaPrint();
  p = 0;
 #if MM_LINUX
  if( ( mm_numa_alloc_onnode ) && ( nodeindex >= 0 ) )
    p = mm_numa_alloc_onnode( size, nodeindex );
 #elif MM_WIN32
  if( ( mm_VirtualAllocExNuma ) && ( nodeindex >= 0 ) )
    p = mm_VirtualAllocExNuma( mmCurrentProcess, NULL, size, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE, nodeindex );
 #endif
  if( !p )
    p = malloc( size );
  chunk = malloc( sizeof(mmNumaChunk) );
  chunk->alloctime = mmGetMillisecondsTime();
  chunk->nodeindex = nodeindex;
  chunk->p = p;
  chunk->size = size;
  mmListAdd( &mmDebugNumaList, chunk, offsetof(mmNumaChunk,list) );
 #if MM_NUMA_DEBUG >= 2
  printf( "MMNUMA: Allocated chunk %p of %lld bytes on nodeindex %d\n", chunk->p, (long long)chunk->size, chunk->nodeindex );
 #endif
  mtMutexUnlock( &mmDebugNumaMutex );
  return p;
}

void mmDebugNumaFree( int nodeindex, void *v, size_t size )
{
  mmNumaChunk *chunk;
  mtMutexLock( &mmDebugNumaMutex );
 #if MM_NUMA_DEBUG >= 2
  printf( "MMNUMA: Trying to free chunk %p of %lld bytes\n", v, (long long)size );
 #endif
  for( chunk = mmDebugNumaList ; chunk ; chunk = chunk->list.next )
  {
    if( chunk->p == v )
      break;
  }
  if( !chunk )
  {
    printf( "MMNUMA ERROR: Attempting to free chunk %p, size %lld, that was never allocated\n", v, (long long)size );
    fflush( stdout );
    abort();
  }
  if( chunk->size != size )
  {
    printf( "MMNUMA ERROR: Mismatch in NUMA chunk alloc/free size, %lld != %lld\n", (long long)chunk->size, (long long)size );
    fflush( stdout );
    abort();
  }
  mmListRemove( chunk, offsetof(mmNumaChunk,list) );
  free( chunk );
 #if MM_LINUX
  if( ( mm_numa_free ) && ( nodeindex >= 0 ) )
  {
    mm_numa_free( v, size );
    mtMutexUnlock( &mmDebugNumaMutex );
    return;
  }
 #elif MM_WIN32
  if( nodeindex >= 0 )
  {
    VirtualFree( v, 0, MEM_RELEASE );
    mtMutexUnlock( &mmDebugNumaMutex );
    return;
  }
 #endif
  free( v );
  mmDebugNumaPrint();
  mtMutexUnlock( &mmDebugNumaMutex );
  return;
}


#endif
