/* *****************************************************************************
 * Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
/**
 * @file
 *
 * Threading interface, POSIX implementation.
 */



#if defined(COMPILE_FOR_VSL)
 #define MT_QT
#endif



#if defined(MT_QT)

 #include "mmthreadqt.h"

#elif defined(MT_DISABLED)

struct mtNull
{
};

typedef struct mtNull mtMutex;
typedef struct mtNull mtSpin;
typedef struct mtNull mtSignal;

 #define mtMutexInit(a)
 #define mtMutexDestroy(a)
 #define mtMutexLock(a)
 #define mtMutexUnlock(a)
 #define mtMutexTryLock(a)

 #define mtSpinInit(a)
 #define mtSpinDestroy(a)
 #define mtSpinLock(a)
 #define mtSpinUnlock(a)
 #define mtSpinTryLock(a)

 #define mtSignalInit(a)
 #define mtSignalDestroy(a)
 #define mtSignalDispatch(a)
 #define mtSignalBroadcast(a)
 #define mtSignalMutexWait(a,b)

#else

 #include <pthread.h>
 #include <unistd.h>
 #include <sched.h>
 #include <limits.h>

 #if _POSIX_SPIN_LOCKS > 0
  #define MT_SPIN_LOCK_SUPPORT
 #endif
/*
 #define MT_BARRIER_SUPPORT
 #define MT_RWLOCK_SUPPORT
*/


static inline void mtYield()
{
  sched_yield();
  return;
}


typedef struct mtThread mtThread;

struct mtThread
{
  pthread_t pthread;
};


#define MT_THREAD_FLAGS_JOINABLE (0x1)
#define MT_THREAD_FLAGS_SETSTACK (0x2)


static inline void mtThreadCreate( mtThread *thread, void *(*threadmain)( void *value ), void *value, int flags, void *stack, size_t stacksize )
{
  pthread_attr_t attr;

  pthread_attr_init( &attr );
#if !MM_WIN32 && !MM_WIN64
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
 #else
  return ( mmcontext.pagesize ? 4*mmcontext.pagesize : 16384 );
 #endif
}



 #ifdef MT_DEBUG
  #ifndef DEBUG_WARNING()
   #define DEBUG_WARNING() ({printf( "\nRF WARNING : %s %s %d\n", __FILE__, __FUNCTION__, __LINE__ ); fflush( stdout );})
  #endif
 #endif



typedef struct mtMutex mtMutex;

struct mtMutex
{
#ifdef MT_DEBUG
  unsigned char *function;
  unsigned char *file;
  int line;
#endif
  pthread_mutex_t pmutex;
};

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
      DEBUG_WARNING();
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
    DEBUG_WARNING();
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



typedef struct mtSignal mtSignal;

struct mtSignal
{
  pthread_cond_t pcond;
};

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
    DEBUG_WARNING();
 #else
  pthread_cond_signal( &signal->pcond );
 #endif
  return;
}

static inline void mtSignalBroadcast( mtSignal *signal )
{
 #ifdef MT_DEBUG
  if( pthread_cond_broadcast( &signal->pcond ) )
    DEBUG_WARNING();
 #else
  pthread_cond_broadcast( &signal->pcond );
 #endif
  return;
}

static inline void mtSignalWait( mtSignal *signal, mtMutex *mutex )
{
 #ifdef MT_DEBUG
  if( pthread_cond_wait( &signal->pcond, &mutex->pmutex ) )
    DEBUG_WARNING();
 #else
  pthread_cond_wait( &signal->pcond, &mutex->pmutex );
 #endif
  return;
}

static inline void mtSignalWaitTimeout( mtSignal *signal, mtMutex *mutex, long milliseconds )
{
  uint64_t microsecs;
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
  ts.tv_nsec = (int)(microsecs * 1000);
  pthread_cond_timedwait( &signal->pcond, &mutex->pmutex, &ts );
  return;
}

 #ifdef MT_DEBUG
  #define MT_MUTEX_INITIALIZER { 0, 0, 0, PTHREAD_MUTEX_INITIALIZER }
 #else
  #define MT_MUTEX_INITIALIZER { PTHREAD_MUTEX_INITIALIZER }
 #endif



////



 #ifdef MM_ATOMIC_SUPPORT

typedef struct mtSpin mtSpin;

struct mtSpin
{
  mmAtomic32 atomicspin;
};

static inline void mtSpinInit( mtSpin *spin )
{
  mmAtomicWrite32( &spin->atomicspin, 0x0 );
  return;
}

static inline void mtSpinDestroy( mtSpin *spin )
{
  return;
}

static inline void mtSpinLock( mtSpin *spin )
{
  mmAtomicSpin32( &spin->atomicspin, 0x0, 0x1 );
  return;
}

static inline void mtSpinUnlock( mtSpin *spin )
{
  mmAtomicWrite32( &spin->atomicspin, 0x0 );
  return;
}

static inline int mtSpinTryLock( mtSpin *spin )
{
  return mmAtomicCmpReplace32( &spin->atomicspin, 0x0, 0x1 );
}

 #elif _POSIX_SPIN_LOCKS > 0

typedef struct mtSpin mtSpin;

struct mtSpin
{
 #ifdef MT_DEBUG
  unsigned char *function;
  unsigned char *file;
  int line;
 #endif
  pthread_spinlock_t pspinlock;
};

static inline void mtSpinInit( mtSpin *spin )
{
#if !defined(__EMSCRIPTEN__)
  pthread_spin_init( &spin->pspinlock, PTHREAD_PROCESS_PRIVATE );
#endif
  return;
}

static inline void mtSpinDestroy( mtSpin *spin )
{
#if !defined(__EMSCRIPTEN__)
  pthread_spin_destroy( &spin->pspinlock );
#endif
  return;
}

static inline void mtSpinLock( mtSpin *spin )
{
#if !defined(__EMSCRIPTEN__)
  #ifdef MT_DEBUG
  if( pthread_spin_lock( &spin->pspinlock ) )
    DEBUG_WARNING();
  #else
  pthread_spin_lock( &spin->pspinlock );
  #endif
#endif
  return;
}

static inline void mtSpinUnlock( mtSpin *spin )
{
#if !defined(__EMSCRIPTEN__)
  #ifdef MT_DEBUG
  if( pthread_spin_unlock( &spin->pspinlock ) )
    DEBUG_WARNING();
  #else
  pthread_spin_unlock( &spin->pspinlock );
  #endif
#endif
  return;
}

static inline int mtSpinTryLock( mtSpin *spin )
{
#if !defined(__EMSCRIPTEN__)
  return !( pthread_spin_trylock( &spin->pspinlock ) );
#else
  return 0;
#endif
}

 #else

typedef struct mtMutex mtSpin;

  #define mtSpinInit(a) mtMutexInit(a)
  #define mtSpinDestroy(a) mtMutexDestroy(a)
  #define mtSpinLock(a) mtMutexLock(a)
  #define mtSpinUnlock(a) mtMutexUnlock(a)
  #define mtSpinTryLock(a) mtMutexTryLock(a)

 #endif



////



 #ifdef MT_BARRIER_SUPPORT

typedef struct
{
  pthread_barrier_t pbarrier;
} mtBarrier;

static inline void mtBarrierInit( mtBarrier *barrier, int count )
{
#if !defined(__EMSCRIPTEN__)
  pthread_barrier_init( &barrier->pbarrier, 0, count );
#endif
  return;
}

static inline void mtBarrierDestroy( mtBarrier *barrier )
{
#if !defined(__EMSCRIPTEN__)
  pthread_barrier_destroy( &barrier->pbarrier );
#endif
  return;
}

static inline int mtBarrierWait( mtBarrier *barrier )
{
#if !defined(__EMSCRIPTEN__)
  return pthread_barrier_wait( &barrier->pbarrier );
#else
  return 0;
#endif
}

 #endif



////



 #ifdef MT_RWLOCK_SUPPORT

typedef struct mtRWlock mtRWlock;

struct mtRWlock
{
  pthread_rwlock_t prwlock;
};


static inline void mtRWlockInit( mtRWlock *rwlock )
{
#if !defined(__EMSCRIPTEN__)
  pthread_rwlock_init( &rwlock->prwlock, 0 );
#endif
  return;
}

static inline void mtRWlockDestroy( mtRWlock *rwlock )
{
#if !defined(__EMSCRIPTEN__)
  pthread_rwlock_destroy( &rwlock->prwlock );
#endif
  return;
}

static inline void mtRWlockRead( mtRWlock *rwlock )
{
#if !defined(__EMSCRIPTEN__)
  pthread_rwlock_rdlock( &rwlock->prwlock );
#endif
  return;
}

static inline void mtRWlockWrite( mtRWlock *rwlock )
{
#if !defined(__EMSCRIPTEN__)
  pthread_rwlock_wrlock( &rwlock->prwlock );
#endif
  return;
}

static inline void mtRWlockUnlock( mtRWlock *rwlock )
{
#if !defined(__EMSCRIPTEN__)
  pthread_rwlock_unlock( &rwlock->prwlock );
#endif
  return;
}

static inline int mtRWlockTryRead( mtRWlock *rwlock )
{
#if !defined(__EMSCRIPTEN__)
  return pthread_rwlock_rdlock( &rwlock->prwlock );
#else
  return 0;
#endif
}

static inline int mtRWlockTryWrite( mtRWlock *rwlock )
{
#if !defined(__EMSCRIPTEN__)
  return pthread_rwlock_wrlock( &rwlock->prwlock );
#else
  return 0;
#endif
}

 #endif


#endif


