#!/usr/bin/tclsh

source estrildidae.tcl
source ploceidae.tcl

if {$argc eq 0 || ![info exists oscines($argv)]} then {
  list menu
  foreach clade [lsort -ascii [array names oscines]] {
    lappend menu $clade
  }
  set nest [lsearch -all -inline $menu *$argv*]
  if {[llength $nest] > 0} {
    for {set i 0} {$i < [llength $nest]} {incr i} {
      set pluma [lindex $nest $i]
      if {$i % 7 == 0} {
        puts -nonewline [format "\n\t%s" $pluma]
      } else {
        puts -nonewline [format "\t%s" $pluma]
      }
    }
    puts "\n"
  }
  exit 0
}

set clade $argv
set flock $oscines($clade)

  puts ""

  eadgbe $clade $circa $flock $Cn $Gn $Dn $An $En $Bn

  cgdae $clade $circa $flock $Cn $Gn $Dn $An $En

#  beadgcf $clade $circa $flock $Fn $Cn $Gn $Dn $An $En $Bn

  puts ""

unset oscines clade circa flock Fn Cn Gn Dn An En Bn

exit 0

