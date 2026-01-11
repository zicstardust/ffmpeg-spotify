#!/usr/bin/env bash

current_dir=$(pwd)

mkdir -p ${HOME}/.local/share/applications
mkdir -p ${HOME}/.local/share/spotifyffmpeg


cd ${HOME}/.local/share/spotifyffmpeg
curl -fSL "https://github.com/zicstardust/ffmpeg-spotify/releases/download/1.0/spotify_ffmpeg_libs_linux_x86_64.tar.gz" -o spotify_ffmpeg_libs_linux_x86_64.tar.gz &> /dev/null
tar -xf spotify_ffmpeg_libs_linux_x86_64.tar.gz &> /dev/null
rm -f spotify_ffmpeg_libs_linux_x86_64.tar.gz
chmod -R +x *

cat > ${HOME}/.local/share/applications/spotify-ffmpeg.desktop <<DESKTOP
[Desktop Entry]
Type=Application
Name=Spotify (fix FFMPEG)
GenericName=Music Player
Comment=Spotify streaming music client fix FFMPEG
Icon=spotify-client
Exec=LD_LIBRARY_PATH="${HOME}/.local/share/spotifyffmpeg\${LD_PRELOAD:+:\$LD_PRELOAD}" spotify %U
Terminal=false
MimeType=x-scheme-handler/spotify;
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=spotify
Actions=Uninstall;
[Desktop Action Uninstall]
Name=Uninstall
Exec=rm -Rf "${HOME}/.local/share/spotifyffmpeg" && rm -f "${HOME}/.local/share/applications/spotify-ffmpeg.desktop"
DESKTOP

cd $current_dir

echo "Spotify (fix FFMPEG) installed!"