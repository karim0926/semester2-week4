/*
Name: Karim Ozoor
Student ID: 201953003
*/

#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {

    // Buffer large enough for maximum possible output
    // Max 10 arguments × 4 chars each = 40
    // Plus 9 dashes = 9
    // Plus null terminator = 1
    char buffer[60] = "";

    // Process command-line arguments
    for (int i = 1; i < argc; i++) {

        strcat(buffer, argv[i]);

        // Add dash between arguments (but not after last one)
        if (i < argc - 1) {
            strcat(buffer, "-");
        }
    }

    printf("%s\n", buffer);  // use only this single print statement

    return 0;
}
