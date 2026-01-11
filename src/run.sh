#!/usr/bin/env bash

#https://ffmpeg.org/download.html#releases
FFMPEG_VERSION="4.4.6" #libavcodec58, libavformat58
TAR_FORMAT="gz"
#TAR_FORMAT="xz"
#TAR_FORMAT="bz2"

cd /app

echo "Downloading FFMPEG ${FFMPEG_VERSION} source code..."
curl -fSL "https://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.${TAR_FORMAT}" -o "/app/ffmpeg-${FFMPEG_VERSION}.tar.${TAR_FORMAT}" &> /dev/null

tar -xf /app/ffmpeg-${FFMPEG_VERSION}.tar.${TAR_FORMAT}

cd /app/ffmpeg-${FFMPEG_VERSION}

./configure --prefix="/data" \
            --enable-shared \
            --disable-static \
            --enable-gnutls \
            --disable-doc \
            --disable-avdevice \
            --disable-avfilter \
            --disable-programs \
            --disable-encoders \
            --disable-hwaccels \
            --disable-devices \
            --disable-filters \
            --disable-bsfs \
            --disable-muxers \
            --disable-protocols \
            --enable-protocol=file \
            --disable-decoders \
            --enable-decoder=aac \
            --enable-decoder=aac_latm \
            --enable-decoder=ac3 \
            --enable-decoder=flac \
            --enable-decoder=als \
            --enable-decoder=mp1 \
            --enable-decoder=mp2 \
            --enable-decoder=mp3 \
            --enable-decoder=mp3adu \
            --enable-decoder=opus \
            --enable-decoder=vorbis

make -j$(nproc)

make install
