# FreeSWITCH mod_av.so Packaging

!!!! This repo does not contain avcodec.c  avformat.c  mod\_av.c  mod_av.h
!!!! You must copy those files from the FreeSWITCH source tarball or src.rpm

Current version: 1.10.3.release.5

Helper gist-repo to package freeswitch-application-av, as
FreeSWITCH CentOS 7 packaging does not include `mod_av.so`.

FreeSWITCH CentOS 7 packages: https://files.freeswitch.org/repo/yum/centos-release/7/x86_64/

## Intended Audience

The FreeSWITCH teams provides over 100 CentOS 7 packages, including `freeswitch-devel`.

This repo is meant for those using these packages but also want to add a “snowflake” RPM
for internal consumption.

This repo packages `mod_av.so` but can be used as an example for other unpackaged modules.

By using upstream's `freeswitch-devel` we can skip the `./configure` step, and won't need
the development dependencies that a full build would require.

## FFmpeg

CentOS 7 does not contain ffmpeg-devel. You need to wrangle a ffmpeg-devel
from, e.g., RPMFusion.


## HOWTO

```
# Preparation
yum install https://files.freeswitch.org/repo/yum/centos-release/freeswitch-release-repo-0-1.noarch.rpm
yum install freeswitch-devel zlib-devel

# Example of ffmpeg-devel from RPMFusion
yum install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
yum install https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm

yum install ffmpeg-devel


# This will create the tarball, and run rpmbuild on the tarball
# in ~/rpmbuild. The artifact will be in ~/rpmbuild/RPMS/x86_64/
# Build requires: freeswitch-devel, zlib-devel, ffmpeg-devel

./build.sh
```


## Files 

```
# artifact in
~/rpmbuild/RPMS/x86_64/freeswitch-application-av-1.10.3.release.5-1.el7.x86_64.rpm

# files
/usr/lib64/freeswitch/mod/mod_av.so
```
