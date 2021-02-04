#!/bin/bash

tar -zxf sources.tar.gz
sudo chown -R root:root ./sources.list.d/
sudo mv ./sources.list.d/* /etc/apt/sources.list.d/
rm -rf ./sources.list.d/
