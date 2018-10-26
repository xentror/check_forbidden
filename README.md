# check_fordidden
A simple sh script to check of we use only the autorise function precise in subjects

########################## USAGE ###################################################################
  
 BE CAREFUL: This bash sript use the binary ltrace, this bin must be install on your machine if you ever want the script to run correctly.

./check_forbid.sh [-f filename] ./binary_name

DEFAULT: ./check_forbid.sh ./binary_name
  -> the script will ask you how may authorize function do you have and you will have to write their name but without paranthesis.
        e.g: for malloc() function you just have to type malloc.
-f: ./check_forbid.sh -f filename ./binary_name:
  -> the script will take a file with a list of authorized functions, all writting in one line and following this pattern:
        -[function_name]-[function_name]...etc
       
########################## BUGS ##################################################################

This script use ltrace so for example functions like printf can be replace by puts or putchar by the compiler so be careful and check your code by hand too. ;).
