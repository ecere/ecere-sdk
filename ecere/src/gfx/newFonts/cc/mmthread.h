/* *****************************************************************************
 * Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
/**
 * @file
 *
 * Thread interface, POSIX threads and Windows threads implementations.
 */


#ifndef MMTHREAD_H
#define MMTHREAD_H

#if defined(__EMSCRIPTEN__) || defined(__UWP__)
   #define MT_NOTHREADS   1
#endif

////


#if !MT_PTHREADS && !MT_WINTHREADS && !MT_NOTHREADS
 #if defined(__linux__) || defined(__gnu_linux__) || defined(__linux) || defined(__linux) || defined(__APPLE__) || defined(__unix__) || defined(__unix) || defined(unix)
  #undef MT_PTHREADS
  #define MT_PTHREADS (1)
 #elif defined(_WIN64) || defined(__WIN64__) || defined(WIN64) || defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
  #undef MT_WINTHREADS
  #define MT_WINTHREADS (1)
 #else
  #undef MT_NOTHREADS
  #define MT_NOTHREADS (1)
  #warning We have no threading implementation for the platform.
 #endif
#endif

#if defined(__GNUC__) || defined(__INTEL_COMPILER) || defined(__clang__)
 #define MT_GNUC (1)
#elif defined(_MSC_VER)
 #define MT_MSVC (1)
#else
 #if MT_WINTHREADS
  #error Can not target Windows threads with an unrecognized compiler! Need atomics and stuff.
 #endif
#endif


/////


#define MT_THREAD_FLAGS_JOINABLE (0x1)
#define MT_THREAD_FLAGS_SETSTACK (0x2)

#ifdef MT_DEBUG
 #ifndef MT_DEBUG_WARNING()
  #define MT_DEBUG_WARNING() ({printf( "\nMMTHREAD WARNING : %s %s %d\n", __FILE__, __FUNCTION__, __LINE__ ); fflush( stdout );})
 #endif
#endif


////


#if MT_PTHREADS


/* POSIX threads */

 #ifndef _GNU_SOURCE
  #define _GNU_SOURCE
 #endif
 #include <pthread.h>
 #include <unistd.h>
 #include <sched.h>
 #include <limits.h>
 #include <sys/time.h>


static inline void mtYield()
{
  sched_yield();
  return;
}


typedef struct
{
  pthread_t pthread;
} mtThread;

static inline void mtThreadCreate( mtThread *thread, void *(*threadmain)( void *value ), void *value, int flags, void *stack, size_t stacksize )
{
  pthread_attr_t attr;

  pthread_attr_init( &attr );
 #if defined(__linux__) || defined(__gnu_linux__) || defined(__linux) || defined(__linux) || defined(__APPLE__) || defined(__unix__) || defined(__unix) || defined(unix)
  if( flags & MT_THREAD_FLAGS_SETSTACK )
    pthread_attr_setstack( &attr, stack, stacksize );
#endif
  if( flags & MT_THREAD_FLAGS_JOINABLE )
    pthread_attr_setdetachstate( &attr, PTHREAD_CREATE_JOINABLE );
  else
    pthread_attr_setdetachstate( &attr, PTHREAD_CREATE_DETACHED );
  pthread_create( &thread->pthread, &attr, threadmain, value );
  pthread_attr_destroy( &attr );

  return;
}

static inline void mtThreadExit()
{
  pthread_exit( 0 );
  return;
}

static inline void mtThreadJoin( mtThread *thread )
{
  void *ret;
  pthread_join( thread->pthread, &ret );
  return;
}

static inline mtThread mtThreadSelf()
{
  mtThread thread;
  thread.pthread = pthread_self();
  return thread;
}

static inline int mtThreadCmpEqual( mtThread *thread0, mtThread *thread1 )
{
  return ( pthread_equal( thread0->pthread, thread1->pthread ) != 0 ? 1 : 0 );
}

static inline size_t mtGetMinimumStackSize()
{
 #ifdef PTHREAD_STACK_MIN
  return PTHREAD_STACK_MIN;
 #elif defined(MM_H)
  return ( mmcontext.pagesize ? 4*mmcontext.pagesize : 16384 );
 #else
  return 16384;
 #endif
}


////


typedef struct
{
#ifdef MT_DEBUG
  unsigned char *function;
  unsigned char *file;
  int line;
#endif
  pthread_mutex_t pmutex;
} mtMutex;

static inline void mtMutexInit( mtMutex *mutex )
{
  pthread_mutex_init( &mutex->pmutex, 0 );
  return;
}

static inline void mtMutexDestroy( mtMutex *mutex )
{
  pthread_mutex_destroy( &mutex->pmutex );
  return;
}

 #ifdef MT_DEBUG

  #define mtMutexLock(a) mtMutexLockDebug(a,__FUNCTION__,__FILE__,__LINE__)
  #define mtMutexUnlock(a) mtMutexUnlockDebug(a,__FUNCTION__,__FILE__,__LINE__)
  #define mtMutexTryLock(a) mtMutexTryLockDebug(a,__FUNCTION__,__FILE__,__LINE__)

static inline void mtMutexLockDebug( mtMutex *mutex, const unsigned char *function, const unsigned char *file, const int line )
{
  printf( "Mutex lock :    Thread %d on %p from %s() in %s:%d\n", (int)pthread_self(), mutex, function, file, line );
  fflush( stdout );
  if( pthread_mutex_trylock( &mutex->pmutex ) )
  {
    printf( "    Mutex %p locked by %s() in %s:%d\n", mutex, mutex->function, mutex->file, mutex->line );
    fflush( stdout );
    if( pthread_mutex_lock( &mutex->pmutex ) )
      MT_DEBUG_WARNING();
  }
  mutex->function = (unsigned char *)function;
  mutex->file = (unsigned char *)file;
  mutex->line = line;
  return;
}

static inline void mtMutexUnlockDebug( mtMutex *mutex, const unsigned char *function, const unsigned char *file, const int line )
{
  mutex->function = (unsigned char *)function;
  mutex->file = (unsigned char *)file;
  mutex->line = line;
  printf( "Mutex Unlock :  Thread %d on %p from %s() in %s:%d\n", (int)pthread_self(), mutex, function, file, line );
  fflush( stdout );
  if( pthread_mutex_unlock( &mutex->pmutex ) )
    MT_DEBUG_WARNING();
  return;
}

static inline int mtMutexTryLockDebug( mtMutex *mutex, const unsigned char *function, const unsigned char *file, const int line )
{
  printf( "Mutex Trylock :  Thread %d on %p from %s() in %s:%d\n", (int)pthread_self(), mutex, function, file, line );
  fflush( stdout );
  if( !( pthread_mutex_trylock( &mutex->pmutex ) ) )
  {
    mutex->function = (unsigned char *)function;
    mutex->file = (unsigned char *)file;
    mutex->line = line;
    return 1;
  }
  else
    return 0;
}

 #else

static inline void mtMutexLock( mtMutex *mutex )
{
  pthread_mutex_lock( &mutex->pmutex );
  return;
}

static inline void mtMutexUnlock( mtMutex *mutex )
{
  pthread_mutex_unlock( &mutex->pmutex );
  return;
}

static inline int mtMutexTryLock( mtMutex *mutex )
{
  return !( pthread_mutex_trylock( &mutex->pmutex ) );
}

 #endif


////


typedef struct
{
  pthread_cond_t pcond;
} mtSignal;

static inline void mtSignalInit( mtSignal *signal )
{
  pthread_cond_init( &signal->pcond, 0 );
  return;
}

static inline void mtSignalDestroy( mtSignal *signal )
{
  pthread_cond_destroy( &signal->pcond );
  return;
}

static inline void mtSignalWake( mtSignal *signal )
{
 #ifdef MT_DEBUG
  if( pthread_cond_signal( &signal->pcond ) )
    MT_DEBUG_WARNING();
 #else
  pthread_cond_signal( &signal->pcond );
 #endif
  return;
}

static inline void mtSignalBroadcast( mtSignal *signal )
{
 #ifdef MT_DEBUG
  if( pthread_cond_broadcast( &signal->pcond ) )
    MT_DEBUG_WARNING();
 #else
  pthread_cond_broadcast( &signal->pcond );
 #endif
  return;
}

static inline void mtSignalWait( mtSignal *signal, mtMutex *mutex )
{
 #ifdef MT_DEBUG
  if( pthread_cond_wait( &signal->pcond, &mutex->pmutex ) )
    MT_DEBUG_WARNING();
 #else
  pthread_cond_wait( &signal->pcond, &mutex->pmutex );
 #endif
  return;
}

static inline int mtSignalWaitTimeout( mtSignal *signal, mtMutex *mutex, long milliseconds )
{
  unsigned long long microsecs;
  struct timespec ts;
  struct timeval tp;
  gettimeofday( &tp, NULL );
  ts.tv_sec  = tp.tv_sec + ( milliseconds / 1000 );
  microsecs = tp.tv_usec + ( ( milliseconds % 1000 ) * 1000 );
  if( microsecs >= 1000000 )
  {
    ts.tv_sec++;
    microsecs -= 1000000;
  }
  ts.tv_nsec = (long)(microsecs * 1000);
  return ( pthread_cond_timedwait( &signal->pcond, &mutex->pmutex, &ts ) == 0 );
}

static inline unsigned long long mtSignalTime( long milliseconds )
{
  unsigned long long millitime;
  struct timeval lntime;
  gettimeofday( &lntime, 0 );
  millitime = ( (unsigned long long)lntime.tv_sec * 1000 ) + ( (unsigned long long)lntime.tv_usec / 1000 ) + (unsigned long long)milliseconds;
  return millitime;
}

static inline int mtSignalWaitTime( mtSignal *signal, mtMutex *mutex, unsigned long long millitime )
{
  struct timespec ts;
  ts.tv_sec = (long)(millitime / 1000);
  ts.tv_nsec = (long)(( millitime % 1000 ) * 1000000);
  return ( pthread_cond_timedwait( &signal->pcond, &mutex->pmutex, &ts ) == 0 );
}

 #ifdef MT_DEBUG
  #define MT_MUTEX_INITIALIZER { 0, 0, 0, PTHREAD_MUTEX_INITIALIZER }
 #else
  #define MT_MUTEX_INITIALIZER { PTHREAD_MUTEX_INITIALIZER }
 #endif


#elif MT_WINTHREADS


/* Windows threads */

 #ifndef WIN32_LEAN_AND_MEAN
 #define WIN32_LEAN_AND_MEAN
 #endif
 #include <windows.h>
 #if MT_MSVC
  #include <intrin.h>
 #endif

static inline void mtYield()
{
  SwitchToThread();
  return;
}


typedef struct
{
  HANDLE winthread;
  DWORD threadidentifier;
} mtThread;

typedef struct
{
  void *(*threadmain)( void *value );
  void *value;
} mtWinThreadLaunch;

static DWORD WINAPI mtWinThreadMain( void *launchdata )
{
  mtWinThreadLaunch launch;
  launch = *(mtWinThreadLaunch *)launchdata;
  free( (void *)launchdata );
  launch.threadmain( launch.value );
  return 0;
}

static inline void mtThreadCreate( mtThread *thread, void *(*threadmain)( void *value ), void *value, int flags, void *stack, size_t stacksize )
{
  mtWinThreadLaunch *launch;
  launch = (mtWinThreadLaunch *)malloc( sizeof(mtWinThreadLaunch) );
  launch->threadmain = threadmain;
  launch->value = value;
  thread->winthread = CreateThread( (LPSECURITY_ATTRIBUTES)0, stacksize, mtWinThreadMain, (void *)launch, 0, &thread->threadidentifier );
  return;
}

static inline void mtThreadExit()
{
  ExitThread( 0 );
  return;
}

static inline void mtThreadJoin( mtThread *thread )
{
  WaitForSingleObject( thread->winthread, INFINITE );
  CloseHandle( thread->winthread );
  return;
}

static inline mtThread mtThreadSelf()
{
  mtThread thread;
  thread.winthread = 0;
  thread.threadidentifier = GetCurrentThreadId();
  return thread;
}

static inline int mtThreadCmpEqual( mtThread *thread0, mtThread *thread1 )
{
  return ( thread0->threadidentifier == thread1->threadidentifier );
}

static inline size_t mtGetMinimumStackSize()
{
  return 16384;
}


////


typedef struct
{
  CRITICAL_SECTION critsection;
} mtMutex;

static inline void mtMutexInit( mtMutex *mutex )
{
  InitializeCriticalSection( &mutex->critsection );
  return;
}

static inline void mtMutexDestroy( mtMutex *mutex )
{
  DeleteCriticalSection( &mutex->critsection );
  return;
}


static inline void mtMutexLock( mtMutex *mutex )
{
  EnterCriticalSection( &mutex->critsection );
  return;
}

static inline void mtMutexUnlock( mtMutex *mutex )
{
  LeaveCriticalSection( &mutex->critsection );
  return;
}

static inline int mtMutexTryLock( mtMutex *mutex )
{
  return TryEnterCriticalSection( &mutex->critsection );
}


////


typedef struct
{
  volatile long waitcount;
  /* Signal:0, broadcast:1 */
  HANDLE events[2];
} mtSignal;

static inline void mtSignalInit( mtSignal *signal )
{
  signal->waitcount = 0;
  signal->events[0] = CreateEvent( 0, 0, 0, 0 );
  signal->events[1] = CreateEvent( 0, 1, 0, 0 );
  return;
}

static inline void mtSignalDestroy( mtSignal *signal )
{
  CloseHandle( signal->events[0] );
  CloseHandle( signal->events[1] );
  return;
}

static inline void mtSignalWake( mtSignal *signal )
{
  if( signal->waitcount )
    SetEvent( signal->events[0] );
  return;
}

static inline void mtSignalBroadcast( mtSignal *signal )
{
  if( signal->waitcount )
    SetEvent( signal->events[1] );
  return;
}

static inline void mtSignalWait( mtSignal *signal, mtMutex *mutex )
{
  int waitresult;
  long remwaitcount;

#if MT_GNUC
  __sync_add_and_fetch( &signal->waitcount, (long)1 );
#elif MT_MSVC
  _InterlockedIncrement( &signal->waitcount );
#endif
  LeaveCriticalSection( &mutex->critsection );
  waitresult = WaitForMultipleObjects( 2, signal->events, FALSE, INFINITE );
  EnterCriticalSection( &mutex->critsection );
#if MT_GNUC
  remwaitcount = __sync_sub_and_fetch( &signal->waitcount, (long)1 );
#elif MT_MSVC
  remwaitcount = _InterlockedDecrement( &signal->waitcount );
#endif
  if( ( waitresult == ( WAIT_OBJECT_0 + 1 ) ) && !remwaitcount )
    ResetEvent( signal->events[1] );
  return;
}

static inline int mtSignalWaitTimeout( mtSignal *signal, mtMutex *mutex, long milliseconds )
{
  int waitresult;
  long remwaitcount;

#if MT_GNUC
  __sync_add_and_fetch( &signal->waitcount, (long)1 );
#elif MT_MSVC
  _InterlockedIncrement( &signal->waitcount );
#endif
  LeaveCriticalSection( &mutex->critsection );
  waitresult = WaitForMultipleObjects( 2, signal->events, FALSE, milliseconds );
  EnterCriticalSection( &mutex->critsection );
#if MT_GNUC
  remwaitcount = __sync_sub_and_fetch( &signal->waitcount, (long)1 );
#elif MT_MSVC
  remwaitcount = _InterlockedDecrement( &signal->waitcount );
#endif
  if( ( waitresult == ( WAIT_OBJECT_0 + 1 ) ) && !remwaitcount )
    ResetEvent( signal->events[1] );
  return ( waitresult != WAIT_TIMEOUT );
}

static inline int mtGetTimeOfDay( struct timeval *tv )
{
 #define DELTA_EPOCH_IN_MICROSECS  11644473600000000ULL
  FILETIME ft;
  unsigned long long curtime;
  if( tv )
  {
    GetSystemTimeAsFileTime( &ft );
    curtime = ( ( ( (unsigned long long)ft.dwHighDateTime << 32 ) | (unsigned long long)ft.dwLowDateTime ) / 10 ) - DELTA_EPOCH_IN_MICROSECS;
    tv->tv_sec = (long)( curtime / 1000000UL );
    tv->tv_usec = (long)( curtime % 1000000UL );
  }
  return 0;
}

static inline unsigned long long mtSignalTime( long milliseconds )
{
  unsigned long long millitime;
  struct timeval lntime;
  mtGetTimeOfDay( &lntime );
  millitime = ( (unsigned long long)lntime.tv_sec * 1000 ) + ( (unsigned long long)lntime.tv_usec / 1000 ) + (unsigned long long)milliseconds;
  return millitime;
}

static inline int mtSignalWaitTime( mtSignal *signal, mtMutex *mutex, unsigned long long millitime )
{
  unsigned long long currenttime;
  long timeout;
  struct timeval lntime;
  mtGetTimeOfDay( &lntime );
  currenttime = ( (unsigned long long)lntime.tv_sec * 1000 ) + ( (unsigned long long)lntime.tv_usec / 1000 );
  timeout = (long)( millitime - currenttime );
  if( timeout < 0 )
    timeout = 0;
  return mtSignalWaitTimeout( signal, mutex, timeout );
}


#else


/* No threads */

 #ifndef MT_DISABLED
  #define MT_DISABLED (1)
 #endif

typedef struct mtMutex { int foo; } mtMutex;
typedef struct mtSpin { int foo; } mtSpin;
typedef struct mtSignal { int foo; } mtSignal;

 #define mtMutexInit(a)
 #define mtMutexDestroy(a)
 #define mtMutexLock(a)
 #define mtMutexUnlock(a)
 #define mtMutexTryLock(a) 1

 #define mtSpinInit(a)
 #define mtSpinDestroy(a)
 #define mtSpinLock(a)
 #define mtSpinUnlock(a)
 #define mtSpinTryLock(a)

 #define mtSignalInit(a)
 #define mtSignalDestroy(a)
 #define mtSignalWake(a)
 #define mtSignalBroadcast(a)
 #define mtSignalMutexWait(a,b)
 #define mtSignalTime(a) (0)
 #define mtSignalWaitTime(a) (1)


#endif


////


#if MT_GNUC && !MT_NOTHREADS


/* Spin locks, GNUC/clang/ICC implementation */

typedef struct mtSpin
{
  volatile unsigned int atomicspin;
} mtSpin;

static inline void mtSpinInit( mtSpin *spin )
{
  __asm__ __volatile__( "":::"memory" );
  spin->atomicspin = 0;
  return;
}

static inline void mtSpinDestroy( mtSpin *spin )
{
  return;
}

static inline void mtSpinLock( mtSpin *spin )
{
  for( ; __sync_val_compare_and_swap( &spin->atomicspin, 0x0, 0x1 ) != 0x0 ; )
  {
    for( ; spin->atomicspin != 0x0 ; )
    {
 #if defined(__x86_64__) || defined(__x86_64) || defined(__amd64__) || defined(__amd64) || defined(__i386__) || defined(__i386)  || defined(i386)
      __asm__ __volatile__( "rep ; nop" :::"memory" );
 #else
      __asm__ __volatile__( "":::"memory" );
 #endif
    }
  }
  return;
}

static inline void mtSpinUnlock( mtSpin *spin )
{
  __asm__ __volatile__( "":::"memory" );
  spin->atomicspin = 0;
  return;
}

static inline int mtSpinTryLock( mtSpin *spin )
{
  return ( __sync_val_compare_and_swap( &spin->atomicspin, 0x0, 0x1 ) == 0x0 );
}


#elif MT_MSVC && !MT_NOTHREADS


/* Spin locks, MSVC implementation */

typedef struct mtSpin
{
  volatile long atomicspin;
} mtSpin;

static inline void mtSpinInit( mtSpin *spin )
{
  _ReadWriteBarrier();
  spin->atomicspin = 0;
  return;
}

static inline void mtSpinDestroy( mtSpin *spin )
{
  return;
}

static inline void mtSpinLock( mtSpin *spin )
{
  for( ; _InterlockedCompareExchange( &spin->atomicspin, 0x1, 0x0 ) != 0x0 ; )
  {
    for( ; spin->atomicspin != 0x0 ; )
    {
      YieldProcessor();
      _ReadWriteBarrier();
    }
  }
  return;
}

static inline void mtSpinUnlock( mtSpin *spin )
{
  _ReadWriteBarrier();
  spin->atomicspin = 0;
  return;
}

static inline int mtSpinTryLock( mtSpin *spin )
{
  return ( _InterlockedCompareExchange( &spin->atomicspin, 0x1, 0x0 ) == 0x0 );
}


 #elif !MT_NOTHREADS


typedef struct mtMutex mtSpin;

  #define mtSpinInit(a) mtMutexInit(a)
  #define mtSpinDestroy(a) mtMutexDestroy(a)
  #define mtSpinLock(a) mtMutexLock(a)
  #define mtSpinUnlock(a) mtMutexUnlock(a)
  #define mtSpinTryLock(a) mtMutexTryLock(a)


 #endif


////


#if MT_GNUC && !MT_NOTHREADS


typedef struct
{
  volatile int counter __attribute__((aligned(64)));
  volatile unsigned int state __attribute__((aligned(64)));
  volatile unsigned int stateref __attribute__((aligned(64)));
  int resetvalue __attribute__((aligned(64)));
} mtBarrier;

static inline void mtBarrierBuild( mtBarrier *barrier, int waitcount )
{
  barrier->counter = waitcount;
  barrier->state = 0;
  barrier->stateref = 0;
  barrier->resetvalue = waitcount;
  __asm__ __volatile__( "":::"memory" );
  return;
}

static inline unsigned int mtBarrierWait( mtBarrier *barrier, unsigned int spinwaitcounter )
{
  unsigned int stateref, nextstateref;

  stateref = barrier->stateref;
  if( __sync_sub_and_fetch( &barrier->counter, 1 ) == 0 )
{
    nextstateref = stateref + 1;
    /* Barrier is cleared, that was the last thread waiting on it */
    barrier->stateref = nextstateref;
    __sync_add_and_fetch( &barrier->counter, barrier->resetvalue );
    /* Ensure stateref and counter are updated and visible before releasing all spinning threads */
    __sync_synchronize();
    barrier->state = nextstateref;
}
  else
  {
    /* Spin-wait */
    for( ; ( barrier->state == stateref ) && ( spinwaitcounter ) ; spinwaitcounter-- )
{
 #if defined(__x86_64__) || defined(__x86_64) || defined(__amd64__) || defined(__amd64) || defined(__i386__) || defined(__i386)  || defined(i386)
      __asm__ __volatile__( "rep ; nop" :::"memory" );
#else
      __asm__ __volatile__( "":::"memory" );
#endif
}
    /* Spin-wait counter exhausted, yield thread */
    if( !spinwaitcounter )
    {
      __asm__ __volatile__( "":::"memory" );
      for( ; barrier->state == stateref ; )
        mtYield();
    }
  }

  return spinwaitcounter;
}


#elif MT_MSVC


typedef struct
{
  __declspec(align(64)) volatile long counter;
  __declspec(align(64)) volatile unsigned long state;
  __declspec(align(64)) volatile unsigned long stateref;
  __declspec(align(64)) int resetvalue;
} mtBarrier;

static inline void mtBarrierBuild( mtBarrier *barrier, int waitcount )
{
  barrier->counter = waitcount;
  barrier->state = 0;
  barrier->stateref = 0;
  barrier->resetvalue = waitcount;
  _ReadWriteBarrier();
  return;
}

static inline unsigned int mtBarrierWait( mtBarrier *barrier, unsigned int spinwaitcounter )
{
  unsigned int stateref, nextstateref;

  stateref = barrier->stateref;
  if( _InterlockedDecrement( &barrier->counter ) == 0 )
  {
    nextstateref = stateref + 1;
    /* Barrier is cleared, that was the last thread waiting on it */
    barrier->stateref = nextstateref;
    _InterlockedExchangeAdd( &barrier->counter, barrier->resetvalue );
    /* Ensure stateref and counter are updated and visible before releasing all spinning threads */
    _ReadWriteBarrier();
    barrier->state = nextstateref;
  }
  else
  {
    /* Spin-wait */
    for( ; ( barrier->state == stateref ) && ( spinwaitcounter ) ; spinwaitcounter-- )
    {
      YieldProcessor();
      _ReadWriteBarrier();
    }
    /* Spin-wait counter exhausted, yield thread */
    if( !spinwaitcounter )
    {
      _ReadWriteBarrier();
      for( ; barrier->state == stateref ; )
        mtYield();
    }
  }

  return spinwaitcounter;
}


#endif


////


#if defined(__linux__) || defined(__gnu_linux__) || defined(__linux) || defined(__linux)

 #ifndef _GNU_SOURCE
  #define _GNU_SOURCE
#endif
 #include <sched.h>

 #if ( !defined(CPU_ZERO) || !defined(CPU_SET) ) && !defined(MM_H)
  #warning Headers were included without #define _GNU_SOURCE, mtBindThreadToCpu() is not available
#endif

static inline void mtBindThreadToCpu( int cpuindex )
{
 #if defined(CPU_ZERO) && defined(CPU_SET)
  cpu_set_t cpuset;
  CPU_ZERO( &cpuset );
  CPU_SET( cpuindex, &cpuset );
  sched_setaffinity( 0, sizeof(cpu_set_t), &cpuset );
 #elif defined(MM_H)
  mmThreadBindToCpu( cpuindex );
#endif
  return;
}

#elif defined(_WIN64) || defined(__WIN64__) || defined(WIN64) || defined(_WIN32) || defined(__WIN32__) || defined(WIN32)

 #include <windows.h>

static inline void mtBindThreadToCpu( int cpuindex )
{
  HANDLE handle;
  handle = GetCurrentThread();
  SetThreadAffinityMask( handle, (size_t)1 << cpuindex );
  return;
}

#else

static inline void mtBindThreadToCpu( int cpuindex )
{
  return;
}

#endif


////


#endif
