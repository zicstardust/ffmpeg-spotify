# FFMPEG Libraries to Spotify Linux Client

FFMPEG libraries for the native Linux Spotify client. To resolve the issue of playing local files on distributions that do not have the correct version of the FFMPEG libraries.

## Tested on:
- Debian (official .deb package)
- Ubuntu (official .deb package)

## Install

### Dependecies
- curl
- bash
- tar

### Install
```sh
curl https://raw.githubusercontent.com/zicstardust/ffmpeg-spotify/main/install.sh > /tmp/spotifyFFMPEG.sh; sudo bash /tmp/spotifyFFMPEG.sh
```

## Usage
After installation, Spotify is already fixed.
Whenever the spotify package updates, it will be necessary to run the command:
```sh
spotify-ffmpegfix
```

### Uninstall
```sh
spotify-ffmpegfix --uninstall
```