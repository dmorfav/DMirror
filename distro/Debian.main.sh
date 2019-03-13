#!/bin/sh
debmirror -debug \
-progress \
-verbose \
-diff=none \
-host=repositorios.une.cu/debian \
-root=/ \
-method=http \
-dist=stretch \
-arch=i386,amd64 \
-nosource \
-section=main,contrib,non-free \
-i18n \
-getcontents \
-ignore-release-gpg \
-ignore-missing-release \
$HOME/mirror/debian
exit
