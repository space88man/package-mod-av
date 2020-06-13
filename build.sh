#! /bin/bash
set -x -e

for f in avcodec.c  avformat.c  mod_av.c  mod_av.h; do
    if [ ! -f $f ]; then
	echo "You need to copy $f from the source tree/src.rpm here."
	exit 2
    fi
done

rpm -q freeswitch-devel ||  { echo "freeswitch-devel is needed"; exit 1; }
rpm -q ffmpeg-devel || { echo "ffmpeg-devel is needed"; exit 1; }
rpm -q zlib-devel || { echo "zlib-devel is needed"; exit 1; }




RELEASE=$(cat ./RELEASE)

mkdir -p ~/rpmbuild/SOURCES

tar -zvcf ~/rpmbuild/SOURCES/freeswitch-application-av-${RELEASE}.tar.gz --transform s@^@freeswitch-application-av-${RELEASE}/@ Makefile freeswitch-application-av.spec README.md *.c *.h
rpmbuild -tb ~/rpmbuild/SOURCES/freeswitch-application-av-${RELEASE}.tar.gz 
