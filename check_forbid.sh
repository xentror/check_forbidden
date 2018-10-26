#! /bin/bash

if [ $# -eq 3 ] && [ "$2" = "-f" ] && [ -r $3 ];then
    args=`cat $3`
else
    echo -n "combien de fonction sont autorizes ? "
    read nb_func
    args=''

    while [ $nb_func -gt 0 ];do
        read arg
        args=$args-$arg
        nb_func=$((nb_func - 1))
    done
fi

options=''
[ "$args" != "" ] && options='-e'

ltrace $options $args $1 2> count 1> delete
ltrace -c $options $args $1 2> log 1> delete

nb_forbid=$((`wc -l count | cut -d ' ' -f 1`-1))
rm -f delete count
[ $nb_forbid -eq 0 ] && echo " FELICITATIONS: pas de fonctions interdites utilises" && exit 0

echo -n "$nb_forbid interdites utilises.Voulez vous voir les logs (y/n) ? "
read choice
[ "$choice" = "n" ] && echo "Vous pouvez voire les log dans le fichier log a la racine du program
BYE BYE ;)" && exit 

cat log
