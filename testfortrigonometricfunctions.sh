#!/bin/sh


alpha_deg=0.5
alpha=`echo "scale=8;r=$alpha_deg;r/180.0*3.1415926535898"|bc -l`
echo $alpha
SIN=`echo "scale=5;r=$alpha;s(r/2.0)"|bc -l`
echo $SIN
COS=`echo "scale=5;r=$alpha;c(r/3.0)"|bc -l`
echo $COS

cp cal_anyproc_sample.jou cal_anyproc_$alpha_deg.jou
sed -i "s/COS/$COS/g" cal_anyproc_$alpha_deg.jou
sed -i "s/SIN/$SIN/g" cal_anyproc_$alpha_deg.jou








