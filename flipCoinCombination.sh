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
dict[HHH]=0
dict[HHT]=0
dict[HTH]=0
dict[THH]=0
dict[TTH]=0
dict[THT]=0
dict[HTT]=0
dict[TTT]=0

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

triplet() {
for((i=0;i<n;i++))
do
        r=$((RANDOM%8))
        case "$r" in
                0)dict[HHH]=$((${dict[HHH]}+1));;
                1)dict[HHT]=$((${dict[HHT]}+1));;
                2)dict[HTH]=$((${dict[HTH]}+1));;
                3)dict[THH]=$((${dict[THH]}+1));;
                4)dict[TTH]=$((${dict[TTH]}+1));;
                5)dict[THT]=$((${dict[THT]}+1));;
                6)dict[HTT]=$((${dict[HTT]}+1));;
                7)dict[TTT]=$((${dict[TTT]}+1));;
        esac
done

echo Number of times HHH won: ${dict[HHH]}
echo Number of times HHT won: ${dict[HHT]}
echo Number of times HTH won: ${dict[HTH]}
echo Number of times THH won: ${dict[THH]}
echo Number of times TTH won: ${dict[TTH]}
echo Number of times THT won: ${dict[THT]}
echo Number of times HTT won: ${dict[HTT]}
echo Number of times TTT won: ${dict[TTT]}

val=${dict[HHH]}
echo -n "HHH percentage: "
hhhPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $hhhPercent

val=${dict[HHT]}
echo -n "HHT percentage: "
hhtPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $hhtPercent

val=${dict[HTH]}
echo -n "HTH percentage: "
hthPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $hthPercent

val=${dict[THH]}
echo -n "THH percentage: "
thhPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $thhPercent

val=${dict[TTH]}
echo -n "TTH percentage: "
tthPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $tthPercent

val=${dict[THT]}
echo -n "THT percentage: "
thtPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $thtPercent

val=${dict[HTT]}
echo -n "HTT percentage: "
httPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $httPercent

val=${dict[TTT]}
echo -n "TTT percentage: "
tttPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $tttPercent
}

echo Enter your choice
echo 1.Singlet
echo 2.Doublet
echo 3.Triplet
read ch
case "$ch" in
        1)singlet;;
        2)doublet;;
	3)triplet;;
esac

