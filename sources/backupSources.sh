#!/bin/bash

rm -f sources.tar.gz >> /dev/null
tar -C / -czf sources.tar.gz /etc/apt/sources.list.d/
