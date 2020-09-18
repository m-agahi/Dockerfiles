#!/bin/bash

temp=`echo /gw-input/$SRCFILE`
echo "$temp - this is the recunstructed file" > /gw-output/files/$SRCFILE
report="$SRCFILE.xml"
echo "and this is the report of $SRCFILE" > /gw-output/reports/$report
