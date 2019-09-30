#!/bin/bash
sha256sum -c SHA256SUMS 2>&1

cd ./distro

sha256sum -c SHA256SUMS 2>&1
