#!/usr/bin/env bash
# File: guessinggame.sh

the_truth=$(ls -l | grep ^- | wc -l)

function is_numeric() {
	if [[ $@ =~ ^[0-9]+$ ]]
	then
		true
	else
		false
	fi    
}

function is_correct() {
	if [[ $1 -eq $the_truth ]]
	then
		true
	else
		false
	fi
}

function give_hint() {
	if [[ $1 -lt $the_truth ]]
	then
		echo $"$1 is too low, try again!"
	else
		echo $"$1 is too high, try again!"
	fi    
}

echo "Let's play a game: How many files are in the current directory?"
while true
do
	read guess

	! is_numeric $guess && echo "That is not a valid numeric guess :( Try again!" && continue

	is_correct $guess
	if [[ $? -eq 0 ]]
	then
		echo "Wow, you won the game, awesome!"
		break
	fi

	give_hint $guess
done
