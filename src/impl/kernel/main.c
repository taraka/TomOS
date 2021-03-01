#include "print.h"

void kernel_main() {
    print_clear();
    print_set_colour(PRINT_COLOUR_BLUE, PRINT_COLOUR_LIGHT_RED);
    print_str("This is a printing test\nTesting!!!!");
}