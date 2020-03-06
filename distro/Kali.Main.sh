#!/bin/sh
debmirror -debug \
-progress \
-verbose \
-diff=none \
-host=archive.kali.org/kali/ \
-root=/ \
-method=http \
-dist=kali-rolling \
-arch=i386,amd64 \
-nosource \
-section=main,contrib,non-free \
-i18n \
-getcontents \
-ignore-release-gpg \
-ignore-missing-release \
/$HOME/mirror/kali
exit
