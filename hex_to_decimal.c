#include <stdio.h>
#include <string.h>

int main() {
    char hex[9];  // up to 8 characters + null terminator
    int length, i, value = 0;
    int digit;

    printf("Enter a hexadecimal number (up to 8 digits): ");
    scanf("%8s", hex);

    length = strlen(hex);

    for (i = 0; i < length; i++) {
        char c = hex[i];

        if (c >= '0' && c <= '9') {
            digit = c - '0';
        }
        else if (c >= 'A' && c <= 'F') {
            digit = c - 'A' + 10;
        }
        else if (c >= 'a' && c <= 'f') {
            digit = c - 'a' + 10;
        }
        else {
            printf("Error: Invalid Hexadecimal\n");
            return 1;
        }

        value = value * 16 + digit; // manual base-16 conversion
    }

    printf("Decimal equivalent: %d\n", value);

    return 0;
}
