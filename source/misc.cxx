#include "misc.h"

FILE* etcpack_fopen(const char* path, const char* mode) {
    FILE* f = fopen(path, mode);
    if (f)
        printf("Opened `%s` with mode \"%s\"\n", path, mode);
    else
        printf("Failed to open `%s` with mode \"%s\"\n", path, mode);
    
    return f;
}