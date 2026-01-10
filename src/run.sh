#!/usr/bin/env bash

FFMPEG_VERSION="4.4.6" #libavcodec58, libavformat58

cd /app

#curl -fSL "https://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.xz" -o "/app/ffmpeg-${FFMPEG_VERSION}.tar.xz"
#curl -fSL "https://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.bz2" -o "/app/ffmpeg-${FFMPEG_VERSION}.tar.bz2"
curl -fSL "https://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.gz" -o "/app/ffmpeg-${FFMPEG_VERSION}.tar.gz"

#tar -xvf /app/ffmpeg-${FFMPEG_VERSION}.tar.xz
#tar -xvf /app/ffmpeg-${FFMPEG_VERSION}.tar.bz2
tar -xvf /app/ffmpeg-${FFMPEG_VERSION}.tar.gz

cd /app/ffmpeg-${FFMPEG_VERSION}

./configure --prefix="/data" --enable-shared --disable-static --enable-gnutls --disable-doc --disable-avdevice --disable-avfilter --disable-programs --disable-encoders --disable-hwaccels --disable-devices --disable-filters --disable-bsfs --disable-muxers --disable-protocols --enable-protocol=file --disable-decoders --enable-decoder=aac --enable-decoder=aac_latm --enable-decoder=ac3 --enable-decoder=flac --enable-decoder=als --enable-decoder=mp1 --enable-decoder=mp2 --enable-decoder=mp3 --enable-decoder=mp3adu --enable-decoder=opus --enable-decoder=vorbis

make -j$(nproc)

make install
