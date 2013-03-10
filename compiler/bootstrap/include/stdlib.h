#ifndef BSL_STDLIB_H
#define BSL_STDLIB_H

/*
#include <stddef.h>
#define EAGAIN    1002

double strtod(const char *nptr, char **endptr);
int atoi(const char *nptr);
int rand(void);
long atol(const char *nptr);
long int random(void);
long int strtol(const char *nptr, char **endptr, int base);
*/

void exit(int status);
void *calloc(size_t nmemb, size_t size);
void free(void *ptr);
void *malloc(size_t size);
void *realloc(void *ptr, size_t size);
long int strtol(const char *nptr, char **endptr, int base);
long long int strtoll(const char *nptr, char **endptr, int base);
unsigned long long int strtoull(const char *nptr, char **endptr, int base);
/*
void qsort(void *base, size_t nmemb, size_t size, int(*compar)(const void *, const void *));
void srandom(unsigned int seed);
void srand(unsigned int seed);
*/
#endif
