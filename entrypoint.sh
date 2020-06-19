#!/bin/bash

echo -e "\nThe following FAKETIME* variables are set:"
export|grep FAKE

echo -e "\nRunning test without FAKETIME_SHARED unset"
FAKETIME="@2000-01-01 11:12:13" /bin/bash -c 'while [ $SECONDS -lt 5 ]; do date; sleep 1; done'

echo -e "\nRunning test with FAKETIME_SHARED unset"
unset FAKETIME_SHARED
FAKETIME="@2000-01-01 11:12:13" /bin/bash -c 'while [ $SECONDS -lt 5 ]; do date; sleep 1; done'
