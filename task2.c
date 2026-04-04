/*
 * Sem 2, week 5
 *
 * Portfolio submission: Hexadecimal to Decimal Converter
 * Name: Karim Ozoor
 * ID:201953003
 */

#include <stdio.h>

int main(void) {
    char hex[9];
    unsigned long long decimal = 0;
    int digit = 0;

    if (scanf("%8s", hex) != 1) {
        return 0;
    }

    for (int i = 0; hex[i] != '\0'; i++) {
        if (hex[i] >= '0' && hex[i] <= '9') {
            digit = hex[i] - '0';
        } else if (hex[i] >= 'A' && hex[i] <= 'F') {
            digit = hex[i] - 'A' + 10;
        } else if (hex[i] >= 'a' && hex[i] <= 'f') {
            digit = hex[i] - 'a' + 10;
        } else {
            printf("Error: Invalid Hexadecimal\n");
            return 0;
        }

        decimal = decimal * 16 + digit;
    }

    printf("%llu\n", decimal);
    return 0;
}
