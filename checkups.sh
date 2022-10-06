#! /usr/bin/env sh

PASS=0
FAIL=0

checkup () {
  if test "$?" -eq '0';
  then
    PASS=$(($PASS+1))
    echo "\n[ Passed: $PASS ]\n"
  else
    FAIL=$(($FAIL+1))
    echo "\n[ Failed: $FAIL ]\n"
  fi
}

sleep 1

echo "\n Beginning Test\n"

sleep 1

tclsh syrinx.tcl fkbjdn noop flock

checkup

sleep 2

tclsh syrinx.tcl beadgcf n0 k9 j3

checkup

sleep 2

tclsh syrinx.tcl 56

checkup

sleep 2

tclsh syrinx.tcl help

checkup

sleep 2

tclsh syrinx.tcl

checkup

sleep 1

echo "\n Finished Test\n"
echo "\t[ Passed: $PASS, Failed: $FAIL ]\n"

exit 0

