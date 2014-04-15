// dpl.eh
// see dpl.ec

#ifndef	_DPL_EH
#define _DPL_EH 1

// Debug Print Line Format (_dplf)
#ifdef _DPL_ON
#define _dplf(...) __dplf(__FILE__, __LINE__, ##__VA_ARGS__)
#else
#define _dplf(...)
#endif

// Debug Print Channel Line (_dpcl)
#ifdef _DPL_ON
#define _dpcl(...) __dpcl(__FILE__, __LINE__, ##__VA_ARGS__)
#else
#define _dpcl(...)
#endif

// Debug Print Channel Line Format (_dpclf)
#ifdef _DPL_ON
#define _dpclf(...) __dpclf(__FILE__, __LINE__, ##__VA_ARGS__)
#else
#define _dpclf(...)
#endif

#endif // dpl.eh
