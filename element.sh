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

else
  # get correct row from database using the argument
  ROW=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
  FROM elements
  LEFT JOIN properties ON elements.atomic_number = properties.atomic_number
  LEFT JOIN types ON properties.type_id = types.type_id
  WHERE elements.atomic_number::TEXT = '$1'
  OR name = '$1'
  OR symbol = '$1';")

  # if row is empty print message
  if [[ ! $ROW ]]
  then
    echo I could not find that element in the database.
  else
    echo $ROW
    # print results
  fi
fi
}

GET_INFO $1
