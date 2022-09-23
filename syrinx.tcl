#!/usr/bin/tclsh

namespace eval Syrinx {

  source estrildidae.tcl
  if {[namespace exists Estrildidae]} {
     namespace upvar Estrildidae oscines lyrebird
  } else {
    puts stderr "Estrildidae absent!"
    exit 1
  }

  if {[catch {set lyrebird(z0) [lrepeat 12 "____"]} errs] } {
    set hint "%s, failed to set lyrebird, %s"
    puts stderr [format $hint $::argv0 $errs]
    exit 1
  }

  source ploceidae.tcl
  if {[namespace exists Ploceidae]} {
    namespace import Ploceidae::fingerboard
  } else {
    puts stderr "Ploceidae absent!"
    exit 1
  }

  if {$argc} then {
    set harps [list beadgcf bfbfb cgdae eadgbe fkbjdn]
    set tuned [lindex $harps [lsearch -exact $harps [lindex $argv 0]]]

    if {$argc eq 1 && [string match {*[0-7]*} [lindex $argv 0]]} {
      set temps [list ]

      foreach sign [lsort -ascii [array names lyrebird]] {
        lappend temps $sign
      }
      set clade [lsearch -all -inline $temps *$argv*]
      unset temps

      if {[llength $clade]} {
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
    } elseif {$argc eq 1 || ![llength $tuned]} {
      set demos "\nTunning:\n\t%s\n\nExample:\n\ttclsh %s %s n0 j3\n"

      puts [format $demos $harps $::argv0 [lindex $harps 0]]

      unset demos
    } elseif {$argc > 1 && [llength $tuned]} {
      set harp [lindex $argv 0]
      set signs [lrange $argv 1 end]

      puts ""
      foreach sign $signs {
        if {[info exists lyrebird($sign)]} {
          set crow $lyrebird($sign)

          fingerboard $sign $crow $harp

          unset crow
        } else {
          puts stderr "\t$sign ?"
        }
        puts ""
      }

      unset harp signs
    }

    unset harps tuned
  } else {
    set clef [lsort -ascii [array names lyrebird]]

    for {set i 0} {$i < [llength $clef]} {incr i} {
      if {$i % 7 == 0} {
        puts -nonewline [format "\n\t%s" [lindex $clef $i]]
      } else {
        puts -nonewline [format "\t%s" [lindex $clef $i]]
      }
    } 
    puts "\n"

    unset clef
  }

  array unset lyrebird

} ;# close Syrinx

