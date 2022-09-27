#! /usr/bin/env tclsh

namespace eval Ploceidae {

  proc headstock {crow peg} {
    set trans {
      __ _ Ag s Au u Cu r Fe q Hg v Mn p Np y Pb w Pu z Sn t Ti o Ur x
    }
    set yarn [
      string map $trans [
        concat [string range $crow $peg end] [
          string range $crow 0 [expr $peg - 1]
        ]
      ]
    ]
    return $yarn
  }

  proc layout {sign harp stamp crow tuned} {
    puts [format "\t%s-%s-i%u" $sign $harp $stamp]
    foreach pitch $tuned {
      puts [format "\t%s" [headstock $crow $pitch]]
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

    set stamp [clock milliseconds]

    switch $harp {
      beadgcf {
        set tuned [lreverse "$Bn $En $An $Dn $Gn $Cn $Fn"]
        layout $sign $harp $stamp $crow $tuned
      }
      bfbfb {
        set tuned "$Bn $Fn $Bn $Fn $Bn"
        layout $sign $harp $stamp $crow $tuned
      }
      cgdae {
        set tuned [lreverse "$Cn $Gn $Dn $An $En"]
        layout $sign $harp $stamp $crow $tuned
      }
      eadgbe {
        set tuned [lreverse "$En $An $Dn $Gn $Bn $En"]
        layout $sign $harp $stamp $crow $tuned
      }
      fkbjdn {
        set tuned [lreverse "$Fk $Bj $Dn $Fk $Bj $Dn"]
        layout $sign $harp $stamp $crow $tuned
      }
      default {
        set tuned [list $Cn]
        layout $sign $harp $stamp $crow $tuned
      }
    }

    unset Bj Fn Cn Gn Dn An En Bn Fk stamp tuned
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

    unset clefs i
  }

  namespace export fingerboard signboard

} ;# close Ploceidae

