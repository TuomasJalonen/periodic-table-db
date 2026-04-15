#!/bin/bash

# This script queries a database and prints information about chemical elements.
# Inputs:
# Argument 1: atomic number (INT);
#             chemical symbol (string up to 2 characters);
#             chemical name (string)
# Examples: ./element.sh 1
#           ./element.sh H
#           ./element.sh Hydrogen

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

get_info() {

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
    
    # split row into variables
    IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS <<< "$ROW"
    
    # print result
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  fi
fi
}

get_info "$1"
