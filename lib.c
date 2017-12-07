#include <stdlib.h>

extern int global_int;

int func(void)
{
    for (int i = 0; i < 4; i++) {
        global_int = i + 20;
    }
    return 0;
}
