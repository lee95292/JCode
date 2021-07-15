
num=`expr $RANDOM % 10000`
echo $num

sed -e "s/password:.*/password: $num/" test

