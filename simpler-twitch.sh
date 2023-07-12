#!/bin/bash

die () {
  echo $1
  exit 1
}

TOKEN_FILE="$HOME/.config/simpler-twitch/token"
TOKEN=""
[ -f $TOKEN_FILE ] && TOKEN=$(cat $TOKEN_FILE)

CID_FILE="$HOME/.config/simpler-twitch/client-id"
CLIENT_ID=""
[ -f $CID_FILE ] && CLIENT_ID=$(cat $CID_FILE)

USER_ID_FILE="$HOME/.config/simpler-twitch/user-id"
USER_ID=""
[ -f $USER_ID_FILE ] && USER_ID=$(cat $USER_ID_FILE)

[ -z "$TOKEN" ] && die "Unable to get token"
[ -z "$CLIENT_ID" ] && die "Unable to get client id"
[ -z "$USER_ID" ] && die "Unable to get user id"

menu="rofi -dmenu"

data=$(curl -X GET "https://api.twitch.tv/helix/streams/followed?user_id=${USER_ID}" \
    -H "Client-Id: ${CLIENT_ID}" \
    -H "Authorization: Bearer ${TOKEN}")

streamer=$(echo $data | jq -r '.data[] | [.user_name, .title] | join(" - ")' | $menu | cut -d "-" -f1 | awk '{print tolower($0)}')
echo $streamer
# mpv "https://www.twitch.tv/${streamer}" &> /dev/null &
streamlink "https://www.twitch.tv/${streamer}" best --player mpv --twitch-disable-ads &> /dev/null &
catgirl twitch -j "#${streamer}"




