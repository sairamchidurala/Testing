#!/bin/bash

# Generate a random number between 1 and 10
count=$(( RANDOM % 10 + 1 ))

echo "Running script $count times"

# Path to the script you want to run
SCRIPT="./streak.sh"

# Run the script count times
for ((i=1; i<=count; i++))
do
    echo "Run #$i"
    bash "$SCRIPT"
done
