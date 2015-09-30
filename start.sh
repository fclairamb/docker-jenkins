#!/bin/sh
service rsyslog start
service postfix start
service jenkins start
tail -f /var/log/syslog /var/log/jenkins/jenkins.log &
bash
