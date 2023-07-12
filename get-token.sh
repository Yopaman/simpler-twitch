#!/bin/bash

echo "Enter your client id :"
read client_id
echo "Click here : https://id.twitch.tv/oauth2/authorize?response_type=token&client_id=${client_id}&redirect_uri=http://localhost:3000&scope=user%3Aread%3Afollows"
echo "Your token will be in the url parameters"
# TODO : parse token
#token=$(nc -l 3000 | head -n1 | )


