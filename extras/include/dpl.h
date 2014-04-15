// dpl.h
// see dpl.c

#ifndef	_DPL_H
#define _DPL_H 1

// Debug Print Line Format (_dplf)
#ifdef _DPL_ON
#define _dplf(...) __dplf(__FILE__, __LINE__, ##__VA_ARGS__)
#else
#define _dplf(...)
#endif

// Debug Print Channel Line Format (_dpclf)
#ifdef _DPL_ON
#define _dpclf(...) __dpclf(__FILE__, __LINE__, ##__VA_ARGS__)
#else
#define _dpclf(...)
#endif

#endif // dpl.h
