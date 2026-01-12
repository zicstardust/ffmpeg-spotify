#!/usr/bin/env bash

option=$1
current_dir=$(pwd)

#Check root
if [ "$(whoami)" != "root" ]; then
    echo "Please, run as root"
    exit 2
fi

if [ $"$option" == "--uninstall" ]; then
    rm -Rf /usr/share/spotifyffmpeg
    rm -f /usr/local/bin/spotify-ffmpegfix
    echo "Spotify Fix FFMPEG uninstalled!"
    exit 0
fi

mkdir -p /usr/local/bin
curl https://raw.githubusercontent.com/zicstardust/ffmpeg-spotify/main/install.sh > /usr/local/bin/spotify-ffmpegfix
chmod +x /usr/local/bin/spotify-ffmpegfix

rm -Rf /usr/share/spotifyffmpeg
mkdir -p /usr/share/spotifyffmpeg
cd /usr/share/spotifyffmpeg
curl -fSL "https://github.com/zicstardust/ffmpeg-spotify/releases/download/1.0/spotify_ffmpeg_libs_linux_x86_64.tar.gz" -o spotify_ffmpeg_libs_linux_x86_64.tar.gz &> /dev/null
tar -xf spotify_ffmpeg_libs_linux_x86_64.tar.gz &> /dev/null
rm -f spotify_ffmpeg_libs_linux_x86_64.tar.gz
chmod -R +x *

cat > /usr/share/applications/spotify.desktop <<DESKTOP
[Desktop Entry]
Type=Application
Name=Spotify
GenericName=Music Player
Comment=Spotify streaming music client
Icon=spotify-client
Exec=LD_LIBRARY_PATH="/usr/share/spotifyffmpeg\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}" spotify %U
Terminal=false
MimeType=x-scheme-handler/spotify;
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=spotify
DESKTOP

cd $current_dir

echo "Spotify Fix FFMPEG installed!"