#include <stdio.h>

int diff(int a, int b) {
    return a - b;
}

int main() {
    int x = 20;
    int y = 10;
    int dif = diff(x, y);

    printf("Diferenta lui %d si %d e %d\n", x, y, dif);

    // Return 0 to indicate successful execution
    return 0;
}
