#!/bin/bash 

echo "Enter number of flips:"
read n

declare -A dict

dict[H]=0
dict[T]=0

for((i=0;i<n;i++))
do
        r=$((RANDOM%2))
        if [ $r -eq 0 ]
	then
                dict[H]=$((${dict[H]}+1))
        else
                dict[T]=$((${dict[T]}+1))
        fi
done

echo Number of times head won: ${dict[H]}
echo Number of times tail won: ${dict[T]}

val=${dict[H]}
echo -n "Head percentage: "
headPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $headPercent

val=${dict[T]}
echo -n "Tail percentage: "
tailPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $tailPercent
