#!/bin/bash

die () {
  echo $1
  exit 1
}

read -p "Do you want to create ${HOME}/.config/catgirl/twitch ? [Y/n] " answer

[ "${answer}" != "Y" -a "${awswer}" != "" ] && die "Exiting"

config="${HOME}/.config/catgirl"

mkdir -p $config

echo 'host = irc.chat.twitch.tv' > ${config}/twitch
echo 'user = justinfan123' >> ${config}/twitch
echo 'nick = justinfan123' >> ${config}/twitch

echo "Created the config file."

