# Simpler Twitch

A small script to view your list twitch followings that are currently streaming using `rofi` (or `dmenu`)
and play the selected stream with `mpv` (using [streamlink](https://streamlink.github.io/) to remove ads) + the chat 
on the `catgirl` irc client.

## Dependencies

- curl
- netcat
- rofi
- catgirl
- mpv 
- streamlink 

## How to use

### Anonymous mode

Just run `setup-no-account.sh`

This will create a configuration file for `catgirl` that will let you connect to a chat anonymously.

To watch a stream, use 

```bash
./simpler-twitch.sh <streamer name>
```

### Account mode

- Create an application on [twitch developper console](https://dev.twitch.tv/console/apps). Note your client id.
- Run `setup-account.sh` and follow the setup. It will use your client id to get a token and save it.

To watch a stream, use

```bash
./simpler-twitch.sh --account
```

