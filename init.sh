#!/bin/bash

/usr/bin/systemctl restart autofs
exec /usr/sbin/init
service docker start
service docker enable