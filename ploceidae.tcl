#!/usr/bin/tclsh

set Fn 25
set Cn 0
set Gn 35
set Dn 10
set An 45
set En 20
set Bn 55

proc bassTuning_7 {clade flock Fn Cn Gn Dn An En Bn} {
  puts ""
  puts [concat $clade-b[clock seconds]]
  puts [concat [string range $flock $Fn end] [string range $flock 0 $Fn-1]]
  puts [concat [string range $flock $Cn end] [string range $flock 0 $Cn-1]]
  puts [concat [string range $flock $Gn end] [string range $flock 0 $Gn-1]]
  puts [concat [string range $flock $Dn end] [string range $flock 0 $Dn-1]]
  puts [concat [string range $flock $An end] [string range $flock 0 $An-1]]
  puts [concat [string range $flock $En end] [string range $flock 0 $En-1]]
  puts [concat [string range $flock $Bn end] [string range $flock 0 $Bn-1]]
  puts ""
}

proc guitarTuning_6 {clade flock Cn Gn Dn An En Bn} {
  puts ""
  puts [concat $clade-g[clock seconds]]
  puts [concat [string range $flock $En end] [string range $flock 0 $En-1]]
  puts [concat [string range $flock $Bn end] [string range $flock 0 $Bn-1]]
  puts [concat [string range $flock $Gn end] [string range $flock 0 $Gn-1]]
  puts [concat [string range $flock $Dn end] [string range $flock 0 $Dn-1]]
  puts [concat [string range $flock $An end] [string range $flock 0 $An-1]]
  puts [concat [string range $flock $En end] [string range $flock 0 $En-1]]
  puts ""
}

proc celloTuning_5 {clade flock Cn Gn Dn An En} {
  puts ""
  puts [concat $clade-c[clock seconds]]
  puts [concat [string range $flock $En end] [string range $flock 0 $En-1]]
  puts [concat [string range $flock $An end] [string range $flock 0 $An-1]]
  puts [concat [string range $flock $Dn end] [string range $flock 0 $Dn-1]]
  puts [concat [string range $flock $Gn end] [string range $flock 0 $Gn-1]]
  puts [concat [string range $flock $Cn end] [string range $flock 0 $Cn-1]]
  puts ""
}

