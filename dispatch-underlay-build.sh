#!/usr/bin/env bash

PAK='underlay-build.tar.gz'

tar -czvf "$PAK" underlay-build/
scp "$PAK" root@network-test00002:.
scp "$PAK" root@network-test00003:.
scp "$PAK" root@network-test00004:.
scp "$PAK" root@network-test00005:.
rm -f "$PAK"
