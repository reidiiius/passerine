#!/usr/bin/tclsh

source estrildidae.tcl
source ploceidae.tcl

if {$argc eq 0 || ![info exists oscines($argv)]} then {
  set i 0
  list menu
  foreach clade [lsort -ascii [array names oscines]] {
    lappend menu $clade
    incr i
  }
  set nest [lsearch -all -inline $menu *$argv*]
  if {$nest != 0} {
    puts [join [concat $nest ?] "\n"]
  }
  exit
}

set clade $argv
set flock $oscines($clade)

  puts ""

  guitarTuning_6 $clade $flock $Cn $Gn $Dn $An $En $Bn

  celloTuning_5 $clade $flock $Cn $Gn $Dn $An $En

#  bassTuning_7 $clade $flock $Fn $Cn $Gn $Dn $An $En $Bn

  puts ""

unset oscines clade flock Fn Cn Gn Dn An En Bn

exit

