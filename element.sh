#!/bin/bash

# This script queries a database and prints infromation about chemical elements.
# Inputs:
# Argument 1: atomic number (INT);
#             chemical symbol (String up to 2 characters);
#             chemical name (String)
# Examples: ./element.sh 1
#           ./element.sh H
#           ./element.sh Hydrogen

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

GET_INFO() {
# echo message if an argument is not given
if [[ ! $1 ]]
then
  echo Please provide an element as an argument.
# else
  # get join table

  # get the correct row from the join table using the argument
  # print results

  # if row is empty print message
  #echo I could not find that element in the database.
fi
}

GET_INFO
