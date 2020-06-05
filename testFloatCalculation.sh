#!/bin/bash

knot="/home/user03/mffoil"
airfoil="rae2822"
fixl_original=0.824



fixlift=$(echo "scale=9;  $fixl_original * 0.4   " | bc)
echo "fixlift=$fixlift"

lift_left=0.09
echo "lift_left=$lift_left"

lift_right=0.19
echo "lift_right=$lift_right"


t2=$(awk -v  num1=$lift_left -v num2=$fixlift  'BEGIN{print(num1>num2)?"1":"0"}')
echo $t2

t3=$(awk -v  num1=$fixilift -v num2=$lift_right  'BEGIN{print(num1>num2)?"1":"0"}')
echo $t3

if [ $t3 -eq 1 ];then
   echo $lift_left is smaller
else
    echo $fixlift is smaller
fi

if [ $(awk -v  num1=$lift_left -v num2=$fixlift  'BEGIN{print(num1>num2)?"1":"0"}') -eq 1 ]; then
    echo "wrong1!"
elif [ $(awk -v  num1=$lift_right -v num2=$fixlift  'BEGIN{print(num1<num2)?"1":"0"}') -eq 1 ]; then
    echo "wrong2!"
else
    echo "NORMAL!"
fi

lift_mid=3.22235e-01
echo $lift_mid
lift_mid=0.322
lift_mid=$(echo "$lift_mid"| awk '{printf("%.9f",$0)}')
echo $lift_mid

dist=$(echo "scale=9; ($fixlift - $lift_mid) *($fixlift - $lift_mid) " | bc )
echo "dist=$dist"
comp=$(echo "scale=9; $dist > 0.000005" | bc )
echo "comp=$comp"







