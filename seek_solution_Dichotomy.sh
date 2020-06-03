#!/bin/bash

function abc(){
  res=$(echo "scale=9;1.0 - ($1 - 1.0) * ($1 - 1) "| bc)
  echo $res
}

alfa_left=0.10
alfa_right=0.90
lift_left=$(abc $alfa_left)
echo "calculate once!!!"
lift_right=$(abc $alfa_right)
echo "calculate once!!!"

if [ $(echo "scale=9;  $lift_left > 0.9" | bc) -eq 1 ]; then
    echo "wrong!"
    break
elif [ $(echo "scale=9;  $lift_right < 0.9" | bc) -eq 1 ]; then
    echo "wrong!"
    break
else
    echo "normal"
    alfa_mid=$(echo "scale=9;  0.5 * $alfa_left + 0.5 * $alfa_right " | bc)
    lift_mid=$(abc $alfa_mid)
    echo "calculate once!!!"

    while [ $(echo "scale=9; (0.9 - $lift_mid) *(0.9 - $lift_mid) > 0.000001" | bc ) -eq 1 ]
    do
	if [ $(echo "scale=9;  $lift_mid > 0.9" | bc) -eq 1 ]; then
	alfa_right=$alfa_mid
	else
	alfa_left=$alfa_mid
	fi
    	alfa_mid=$(echo "scale=9;  0.5 * $alfa_left + 0.5 * $alfa_right " | bc)
    	lift_mid=$(abc $alfa_mid)

    done
   

fi

echo "fini"
echo "alfa_final=$alfa_mid"
echo "lift_final=$lift_mid"

