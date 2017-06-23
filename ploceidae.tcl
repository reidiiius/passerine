#!/usr/bin/tclsh

set Fn 25
set Cn 0
set Gn 35
set Dn 10
set An 45
set En 20
set Bn 55

set circa [clock seconds]

proc headstock {str tune} {
  return [
    concat [string range $str $tune end] [string range $str 0 $tune-1]
  ]
}

proc beadgcf {clade circa flock Fn Cn Gn Dn An En Bn} {
  puts ""
  puts [format "\t%s" "$clade \b-b \b$circa"]
  puts [format "\t%s" [headstock $flock $Fn]]
  puts [format "\t%s" [headstock $flock $Cn]]
  puts [format "\t%s" [headstock $flock $Gn]]
  puts [format "\t%s" [headstock $flock $Dn]]
  puts [format "\t%s" [headstock $flock $An]]
  puts [format "\t%s" [headstock $flock $En]]
  puts [format "\t%s" [headstock $flock $Bn]]
  puts ""
}

proc eadgbe {clade circa flock Cn Gn Dn An En Bn} {
  puts ""
  puts [format "\t%s" "$clade \b-g \b$circa"]
  puts [format "\t%s" [headstock $flock $En]]
  puts [format "\t%s" [headstock $flock $Bn]]
  puts [format "\t%s" [headstock $flock $Gn]]
  puts [format "\t%s" [headstock $flock $Dn]]
  puts [format "\t%s" [headstock $flock $An]]
  puts [format "\t%s" [headstock $flock $En]]
  puts ""
}

proc cgdae {clade circa flock Cn Gn Dn An En} {
  puts ""
  puts [format "\t%s" "$clade \b-c \b$circa"]
  puts [format "\t%s" [headstock $flock $En]]
  puts [format "\t%s" [headstock $flock $An]]
  puts [format "\t%s" [headstock $flock $Dn]]
  puts [format "\t%s" [headstock $flock $Gn]]
  puts [format "\t%s" [headstock $flock $Cn]]
  puts ""
}

