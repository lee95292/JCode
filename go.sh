num=`expr $RANDOM % 10000`
echo $num
num=$(seq -f "%04g" $num $num)

echo $num

