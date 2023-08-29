#!/bin/bash

die () {
  echo $1
  exit 1
}

echo "This will create the following files :"
echo "$HOME/.config/simpler-twitch/token"
echo "$HOME/.config/simpler-twitch/user-id"
echo "$HOME/.config/simpler-twitch/client-id"
read -p "Ok ? [Y/n] " answer
[ "${answer}" != "Y" -o "${awswer}" != "" ] && die "Exiting"

mkdir -p $HOME/.config/simpler-twitch

read -p "Enter your client id: " client_id
echo "$client_id" > $HOME/.config/simpler-twitch/client-id
echo
echo "Click here : https://id.twitch.tv/oauth2/authorize?response_type=token&client_id=${client_id}&redirect_uri=http://localhost:3000&scope=user%3Aread%3Afollows"
echo
cat response.http | nc -lC 3000 &
token=$(nc -lC 4000 | tail -n1)

echo "$token" > $HOME/.config/simpler-twitch/token

data=$(curl -X GET "https://api.twitch.tv/helix/users" \
    -H "Client-Id: ${client_id}" \
    -H "Authorization: Bearer ${token}")

user_id=$(echo $data | jq -r '.data[] | .id')

echo "$user_id" > $HOME/.config/simpler-twitch/user-id

# TODO : catgirl setup
