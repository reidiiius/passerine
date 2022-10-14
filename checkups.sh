#! /usr/bin/env sh

APPL='syrinx.tcl'

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

tclsh "$APPL" fkbjdn noop flock

checkup

sleep 2

tclsh "$APPL" cgdae $(ITR=1; MAX=86;
  while test "$ITR" -lt "$MAX";
  do printf "%s " "$ITR"; ITR=$(($ITR+1));
  done)

checkup

sleep 2

tclsh "$APPL" beadgcf n0 k9 j3

checkup

sleep 2

tclsh "$APPL" 56

checkup

sleep 2

tclsh "$APPL" help

checkup

sleep 2

tclsh "$APPL"

checkup

sleep 1

echo "\n Finished Test\n"
echo "\t[ Passed: $PASS, Failed: $FAIL ]\n"

exit 0

