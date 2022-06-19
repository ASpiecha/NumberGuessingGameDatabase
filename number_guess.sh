#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing -t --no-align -c"
SECRET_NUMBER=$(($RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=1
echo $SECRET_NUMBER
echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  RESULT=$($PSQL "INSERT INTO players (username) VALUES ('$USERNAME')")
  GAMES_PLAYED=0
  BEST_GAME=9999
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo "Guess the secret number between 1 and 1000:"
read GUESS

while [[ $GUESS -ne $SECRET_NUMBER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  fi
  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
  read GUESS
done
BEST_GAME=$((BEST_GAME<NUMBER_OF_GUESSES ? BEST_GAME : NUMBER_OF_GUESSES))
GAMES_PLAYED=$(($GAMES_PLAYED+1))
RES=$($PSQL "UPDATE players SET games_played='$GAMES_PLAYED', best_game='$BEST_GAME' WHERE username='$USERNAME'")

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"