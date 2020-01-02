# check_fordidden
A simple shell script which checks that you only use authorized functions in a compiled binary.

## USAGE
  
 **BE CAREFUL: This bash sript use the binary *ltrace*, this bin must be install on your machine if you ever want the script to run correctly.**

```
./check_forbid.sh ./binary_name [-f filename]
```

### Default without parameters:
```
./check_forbid.sh ./binary_name
```
The script will ask you how many authorized functions you have and you will have to write their name, without paranthesis.

 *e.g: for ```malloc()``` function you just have to type ```malloc```*

### Functions list file (*-f*): 
```
./check_forbid.sh ./binary_name -f filename:
```
The script will take a file with a list of authorized functions, each function name on a line
like this pattern:

        function_name1\n
        function_name2\n
        [...]

## KNOWN BUGS

This script use ```ltrace``` so for example functions like ```printf``` can be replaced by ```puts``` or ```putchar``` by the compiler so be careful and check your code by hand too. ;).
