#! /usr/bin/env tclsh

namespace eval Ploceus {

  proc concord {crow pitch} {
    set wire [
      concat [string range $crow $pitch end] [
        string range $crow 0 [expr $pitch - 1]
      ]
    ]
    return $wire
  }

  proc headstock {crow pitch metal} {
    if {$metal} then {
      set yarn [
        concord $crow $pitch
      ]
    } else {
      set trans {
        __ _ Ag s Au u Cu r Fe q Hg v Mn p Np y Pb w Pu z Sn t Ti o Ur x
      }
      set yarn [
        string map $trans [
          concord $crow $pitch
        ]
      ]
    }
    return $yarn
  }

  proc layout {sign crow harp pegs} {
    set stamp [clock milliseconds]
    set metal false

    puts [format "\t%s-%s-i%u" $sign $harp $stamp]
    foreach pitch $pegs {
      puts [format "\t%s" [headstock $crow $pitch $metal]]
    }
  }

  proc fingerboard {sign crow harp} {
    if {[string length $crow] != 60} {
      set harp "unison"
    }

    set Bj 50
    set Fn 25
    set Cn 0
    set Gn 35
    set Dn 10
    set An 45
    set En 20
    set Bn 55
    set Fk 30

    switch $harp {
      beadgcf {
        set pegs [lreverse "$Bn $En $An $Dn $Gn $Cn $Fn"]
        layout $sign $crow $harp $pegs
      }
      bfbfb {
        set pegs "$Bn $Fn $Bn $Fn $Bn"
        layout $sign $crow $harp $pegs
      }
      cgdae {
        set pegs [lreverse "$Cn $Gn $Dn $An $En"]
        layout $sign $crow $harp $pegs
      }
      eadgbe {
        set pegs [lreverse "$En $An $Dn $Gn $Bn $En"]
        layout $sign $crow $harp $pegs
      }
      fkbjdn {
        set pegs [lreverse "$Fk $Bj $Dn $Fk $Bj $Dn"]
        layout $sign $crow $harp $pegs
      }
      default {
        set pegs [list $Cn]
        layout $sign $crow $harp $pegs
      }
    }
  }

  proc signboard {clefs} {
    for {set i 0} {$i < [llength $clefs]} {incr i} {
      if {$i % 7 == 0} {
        puts -nonewline [format "\n\t%s" [lindex $clefs $i]]
      } else {
        puts -nonewline [format "\t%s" [lindex $clefs $i]]
      }
    }
    puts "\n"
  }

  namespace export fingerboard signboard

} ;# close Ploceus

