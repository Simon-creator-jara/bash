#!/bin/bash

# THis script generates a random password for each user specified on the command line 

# Display what the user typed on the command line.
echo "YOu executed this command: ${0}"

# Display the path and filename of the script
echo "YOu used $(dirname ${0}) as the path to the $(basename ${0}) script."

# Tell them how many arguments they passed in
# (INside the script they are parameters, outside they arguments.)

NUMBER_OF_PARAMETERS="${#}"
echo "YOu supplied ${NUMBER_OF_PARAMETERS} argument(s) on the command line."

# Make sure they at least supply one argument.
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then 
	echo "Usage: ${0} USER_NAME [USER_NAME]..."
	exit 1
fi

#General and display a password for each parameter.
for USER_NAME in "${@}"
do 
	PASSWORD=$(date +%s%N | sha256sum | head -c48)
	echo "${USER_NAME}: ${PASSWORD}"
done

