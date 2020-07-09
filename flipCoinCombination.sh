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

for i in ${!dict[@]}
do
val=${dict[$i]}
echo -n "$i percentage: "
Percent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $Percent
done

echo -n "Sorted combinations are: "
readarray -t descendSortedArr < <(printf '%s\n' "${dict[@]}" | sort -r --numeric-sort)
echo "${descendSortedArr[@]}"
max=${descendSortedArr[0]}

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

for i in ${!dictd[@]}
do
echo Number of times $i won: ${dictd[$i]}
done

for i in ${!dictd[@]}
do
val=${dictd[$i]}
echo -n "$i percentage: "
Percent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $Percent
done

echo -n "descending sorted array is: "
readarray -t descendSortedArr < <(printf '%s\n' "${dictd[@]}" | sort -r --numeric-sort)
echo "${descendSortedArr[@]}"

max=${descendSortedArr[0]}

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

for i in ${!dictt[@]}
do
echo Number of times $i won: ${dictt[$i]}
done

for i in ${!dictt[@]}
do
val=${dictt[$i]}
echo -n "$i percentage: "
Percent=`echo - | awk '{print '$val' / '$n' * '100' }'`
echo $Percent
done

echo -n "descending sorted array is: "
readarray -t descendSortedArr < <(printf '%s\n' "${dictt[@]}" | sort -r --numeric-sort)
echo "${descendSortedArr[@]}"
max=${descendSortedArr[0]}
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

