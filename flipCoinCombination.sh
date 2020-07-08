#!/bin/bash -x

r=$((RANDOM%2))
if [ $r -eq 1 ]
then
        echo "Heads won"
else
        echo "Tails won"
fi
