arg2=$(echo "ibase=2; obase=8; $2" | bc)
arg3=$(echo "ibase=2; obase=8; $3" | bc)
arg4=$(echo "ibase=2; obase=8; $4" | bc)

# change permissions in file $1 with agr2, arg3 and arg4
chmod $arg2$arg3$arg4 $1