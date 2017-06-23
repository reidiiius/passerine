#!/usr/bin/tclsh

source estrildidae.tcl
source ploceidae.tcl

if {$argc eq 0 || ![info exists oscines($argv)]} then {
  set interim [list ]
  foreach signat [lsort -ascii [array names oscines]] {
    lappend interim $signat
  }
  set clade [lsearch -all -inline $interim *$argv*]
  unset interim
  if {[llength $clade] > 0} {
    for {set i 0} {$i < [llength $clade]} {incr i} {
      set pluma [lindex $clade $i]
      if {$i % 7 == 0} {
        puts -nonewline [format "\n\t%s" $pluma]
      } else {
        puts -nonewline [format "\t%s" $pluma]
      }
      unset pluma
    }
    puts "\n"
  }
  unset clade
  exit 0
}

FingerBoard $argv $oscines($argv)

array unset oscines

exit 0

