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
      set interim [list ]

      foreach signet [lsort -ascii [array names lyrebird]] {
        lappend interim $signet
      }
      set clade [lsearch -all -inline $interim *$argv*]
      unset interim

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
      set xmpl "\nTunning:\n\t%s\n\nExample:\n\ttclsh %s %s n0 j3\n"

      puts [format $xmpl $harps $::argv0 [lindex $harps 0]]

      unset xmpl
    } elseif {$argc > 1 && [llength $tuned]} {
      set machine [lindex $argv 0]
      set signets [lrange $argv 1 end]

      puts ""
      foreach kid $signets {
        if {[info exists lyrebird($kid)]} {
          set str $lyrebird($kid)

          fingerboard $kid $str $machine

          unset str
        } else {
          puts stderr "\t$kid ?"
        }
        puts ""
      }

      unset machine signets
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

