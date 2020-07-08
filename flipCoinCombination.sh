#!/bin/bash 

echo "Enter number of flips:"
read n

declare -A dict

dict[H]=0
dict[T]=0
dict[HH]=0
dict[HT]=0
dict[TH]=0
dict[TT]=0

singlet() {
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
}

doublet() {

for((i=0;i<n;i++))
do
        r=$((RANDOM%4))
	case "$r" in
		0)dict[HH]=$((${dict[HH]}+1));;
		1)dict[HT]=$((${dict[HT]}+1));;
		2)dict[TH]=$((${dict[TH]}+1));;
		3)dict[TT]=$((${dict[TT]}+1));;
	esac
done

echo Number of times HH won: ${dict[HH]}
echo Number of times HT won: ${dict[HT]}
echo Number of times TH won: ${dict[TH]}
echo Number of times TT won: ${dict[TT]}

val=${dict[HH]}
echo -n "HH percentage: "
hhPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $hhPercent

val=${dict[HT]}
echo -n "HT percentage: "
htPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $htPercent

val=${dict[TH]}
echo -n "TH percentage: "
thPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $thPercent

val=${dict[TT]}
echo -n "TT percentage: "
ttPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $ttPercent
}

echo Enter your choice
echo 1.Singlet
echo 2.Doublet
read ch
case "$ch" in
        1)singlet;;
        2)doublet;;
esac

