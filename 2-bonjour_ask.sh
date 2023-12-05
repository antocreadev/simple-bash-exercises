#!/bin/bash
bonjour_ask()
{
    echo "Quel est ton nom ?"
    read nom
    # si la variable est vide ? tant que 
    while [ -z $nom ]
    do
        echo "Quel est ton nom ?"
        read nom
    done

    echo "Bonjour $nom"
}

bonjour_ask