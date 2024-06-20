#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Function to get element information
get_element_info() {
  # Input is a number, search by atomic number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol FROM elements WHERE atomic_number=$1")
  elif [[ $1 =~ ^[a-zA-Z]+$ ]]
  then
    # Input is a string, search by symbol or name
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol FROM elements WHERE symbol='$1' OR name='$1'")
  fi
  
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT" | while IFS="|" read NUMBER NAME SYMBOL
    do
      PROPERTIES=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number=$NUMBER")
      echo "$PROPERTIES" | while IFS="|" read MASS MELTING BOILING TYPE
      do
        echo "The element with atomic number $(echo $NUMBER | sed -r 's/^ *| *$//g') is $(echo $NAME | sed -r 's/^ *| *$//g') ($(echo $SYMBOL | sed -r 's/^ *| *$//g')). It's a $(echo $TYPE | sed -r 's/^ *| *$//g'), with a mass of $(echo $MASS | sed -r 's/^ *| *$//g') amu. $(echo $NAME | sed -r 's/^ *| *$//g') has a melting point of $(echo $MELTING | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $BOILING | sed -r 's/^ *| *$//g') celsius."
      done
    done
  fi
}

# Main script logic
if [ $# -eq 1 ]; then
    get_element_info "$1"
else
    echo "Please provide an element as an argument."
    exit
fi
