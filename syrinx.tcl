#!/usr/bin/tclsh

source estrildidae.tcl
source ploceidae.tcl

set oscines(z0) [lrepeat 12 "____"]

if {$argc eq 0 || ![info exists oscines([lindex $argv 0])]} then {
  set interim [list ]

  foreach signat [lsort -ascii [array names oscines]] {
    lappend interim $signat
  }
  set clade [lsearch -all -inline $interim *$argv*]

  if {[llength $clade] > 0} {
    for {set i 0} {$i < [llength $clade]} {incr i} {
      set pluma [lindex $clade $i]

      if {$i % 7 == 0} {
        puts -nonewline [format "\n\t%s" $pluma]
      } else {
        puts -nonewline [format "\t%s" $pluma]
      }
    }
    puts "\n"
  } else {
    puts [format "\n\t%s ?\n" [lindex $argv 0]]
  }
  unset interim clade

  exit 0
}

if {$argc} {
  set kid [lindex $argv 0]
  set str $oscines($kid)

  if {$argc > 1} {
    set oud [lindex $argv 1]
  } else {
    set oud false
  }
}

FingerBoard $kid $str $oud

array unset oscines
unset kid str oud

exit 0

