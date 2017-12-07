#include <stdlib.h>
#include "lib.h"

int        __attribute__((used)) global_int = 0;
int static __attribute__((used)) global_int_static = 0;

int __attribute__((used)) main(int argc, char ** argv[])
{
    for (int i = 0; i < 10; i++) {
        global_int = 0xa * i;
    }

    func();
    return 0;
}
