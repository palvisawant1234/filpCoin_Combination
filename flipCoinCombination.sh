#!/bin/bash 

echo "Enter number of flips:"
read n

declare -A dict

dict[H]=0
dict[T]=0

declare -A dictd
dictd[HH]=0
dictd[HT]=0
dictd[TH]=0
dictd[TT]=0

declare -A dictt
dictt[HHH]=0
dictt[HHT]=0
dictt[HTH]=0
dictt[THH]=0
dictt[TTH]=0
dictt[THT]=0
dictt[HTT]=0
dictt[TTT]=0
max=0

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

echo -n "Sorted combinations are: "
readarray -t descendSortedArr < <(printf '%s\n' "${dict[@]}" | sort -r --numeric-sort)
echo "${descendSortedArr[@]}"
for((i=0;i<2;i++))
do
	if((i==0))
	then
		max=${descendSortedArr[i]}
	fi
done
for i in ${!dict[@]}
do
        if [ ${dict[$i]} -eq $max ]
        then
                echo "The maximum combination $max is of : $i"
        fi
done
}

doublet() {

for((i=0;i<n;i++))
do
        r=$((RANDOM%4))
	case "$r" in
		0)dictd[HH]=$((${dictd[HH]}+1));;
		1)dictd[HT]=$((${dictd[HT]}+1));;
		2)dictd[TH]=$((${dictd[TH]}+1));;
		3)dictd[TT]=$((${dictd[TT]}+1));;
	esac
done

echo Number of times HH won: ${dictd[HH]}
echo Number of times HT won: ${dictd[HT]}
echo Number of times TH won: ${dictd[TH]}
echo Number of times TT won: ${dictd[TT]}

val=${dictd[HH]}
echo -n "HH percentage: "
hhPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $hhPercent

val=${dictd[HT]}
echo -n "HT percentage: "
htPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $htPercent

val=${dictd[TH]}
echo -n "TH percentage: "
thPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $thPercent

val=${dictd[TT]}
echo -n "TT percentage: "
ttPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $ttPercent

echo -n "descending sorted array is: "
readarray -t descendSortedArr < <(printf '%s\n' "${dictd[@]}" | sort -r --numeric-sort)
echo "${descendSortedArr[@]}"
for((i=0;i<4;i++))
do
        if((i==0))
        then
                max=${descendSortedArr[i]}
        fi
done
for i in ${!dictd[@]}
do
        if [ ${dictd[$i]} -eq $max ]
        then
                echo "The maximum combination $max is of : $i"
        fi
done


}

triplet() {
for((i=0;i<n;i++))
do
        r=$((RANDOM%8))
        case "$r" in
                0)dictt[HHH]=$((${dictt[HHH]}+1));;
                1)dictt[HHT]=$((${dictt[HHT]}+1));;
                2)dictt[HTH]=$((${dictt[HTH]}+1));;
                3)dictt[THH]=$((${dictt[THH]}+1));;
                4)dictt[TTH]=$((${dictt[TTH]}+1));;
                5)dictt[THT]=$((${dictt[THT]}+1));;
                6)dictt[HTT]=$((${dictt[HTT]}+1));;
                7)dictt[TTT]=$((${dictt[TTT]}+1));;
        esac
done

echo Number of times HHH won: ${dictt[HHH]}
echo Number of times HHT won: ${dictt[HHT]}
echo Number of times HTH won: ${dictt[HTH]}
echo Number of times THH won: ${dictt[THH]}
echo Number of times TTH won: ${dictt[TTH]}
echo Number of times THT won: ${dictt[THT]}
echo Number of times HTT won: ${dictt[HTT]}
echo Number of times TTT won: ${dictt[TTT]}

val=${dictt[HHH]}
echo -n "HHH percentage: "
hhhPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $hhhPercent

val=${dictt[HHT]}
echo -n "HHT percentage: "
hhtPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $hhtPercent

val=${dictt[HTH]}
echo -n "HTH percentage: "
hthPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $hthPercent

val=${dictt[THH]}
echo -n "THH percentage: "
thhPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $thhPercent

val=${dictt[TTH]}
echo -n "TTH percentage: "
tthPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $tthPercent

val=${dictt[THT]}
echo -n "THT percentage: "
thtPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $thtPercent

val=${dictt[HTT]}
echo -n "HTT percentage: "
httPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $httPercent

val=${dictt[TTT]}
echo -n "TTT percentage: "
tttPercent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $tttPercent

echo -n "descending sorted array is: "
readarray -t descendSortedArr < <(printf '%s\n' "${dictt[@]}" | sort -r --numeric-sort)
echo "${descendSortedArr[@]}"
for((i=0;i<2;i++))
do
        if((i==0))
        then
                max=${descendSortedArr[i]}
        fi
done
for i in ${!dictt[@]}
do
        if [ ${dictt[$i]} -eq $max ]
        then
                echo "The maximum combination $max is of : $i"
        fi
done


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

