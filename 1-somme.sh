#!/bin/bash
a=12
b=30 

somme()
{
  echo "La somme de $1 et $2 est $(($1+$2))"
}

somme $a $b