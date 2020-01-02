#! /bin/bash

[ $# -lt 2 ] && echo "usage: ./check_forbid.sh [-f file] binary" && exit 1

args=''
if  [ "$1" = "-f" ];
then
    if [ $# -ne 3 ] || [ ! -r $2 ];
    then
        echo "usage: ./check_forbid.sh [-f file] binary" && exit 1
    fi

    for function_name in `cat $2`;
    do
        args=$args-$function_name
    done
    binary=$3
    options='-e'
else
    echo -n "Combien de fonctions sont autorisées ? "
    read nb_func

    while [ $nb_func -gt 0 ];do
        read arg
        args=$args-$arg
        nb_func=$((nb_func - 1))
    done

    binary=$1
fi

[ ! -x $binary ] && echo "cannot execute $binary file." && exit 1

ltrace -c $options $args $binary 2> log 1> NULL

nb_forbid=$(wc -l log | sed s/[^0-9]*//g)
nb_forbid=$(($nb_forbid-4))

[ $nb_forbid -eq 0 ] && echo " FELICITATIONS: pas de fonction interdite utilisée" && exit 0

echo -n "$nb_forbid fonctions interdites utilisées. Voulez-vous voir les logs (Y/n) ? "

read choice
if [ "$choice" != "n" ];
then
    cat log
else
    echo "Vous pouvez voir les logs dans le fichier log à la racine du
    programme.  BYE BYE ;)"
fi

exit
