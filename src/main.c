#include <stdio.h>

#include "tmpl/version.h"

int main(void)
{
    printf("Hello, World!\n");
    printf("Version: %s\n", TMPL_VERSION);
    return 0;
}
