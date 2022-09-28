#! /usr/bin/env tclsh

namespace eval Syrinx {

  # check for main script or loaded library
  if {$argv0 eq [info script] && !$tcl_interactive} {

    variable rsrc estrildidae.tcl

    if {
      [file exists $rsrc] &&
      [file isfile $rsrc] &&
      [file readable $rsrc]
    } then {
      source $rsrc
    } else {
      puts stderr "$rsrc not found!"
      exit 1
    }

    if {[namespace exists Estrilda]} {
       namespace upvar Estrilda oscines lyrebird
    } else {
      puts stderr "Estrilda absent!"
      exit 1
    }

    if {[catch {set lyrebird(z0) [string repeat "____ " 12]} errs] } {
      set hint "%s, failed to set lyrebird, %s"
      puts stderr [format $hint $::argv0 $errs]
      exit 1
    }

    set rsrc ploceidae.tcl

    if {
      [file exists $rsrc] &&
      [file isfile $rsrc] &&
      [file readable $rsrc]
    } then {
      source $rsrc
    } else {
      puts stderr "$rsrc not found!"
      exit 1
    }

    if {[namespace exists Ploceus]} {
      namespace import Ploceus::fingerboard Ploceus::signboard
    } else {
      puts stderr "Ploceus absent!"
      exit 1
    }

    unset errs rsrc

    variable clefs {}

    lset clefs [lsort -ascii [array names lyrebird]]

    if {$argc} then {
      set harps [list beadgcf bfbfb cgdae eadgbe fkbjdn]
      set tuned [lindex $harps [lsearch -exact $harps [lindex $argv 0]]]

      if {$argc eq 1 && [string match {*[0-7]*} [lindex $argv 0]]} {
        set temps [list ]

        foreach sign $clefs {
          lappend temps $sign
        }
        set clade [lsearch -all -inline $temps *$argv*]
        unset sign temps

        if {[llength $clade]} {
          signboard $clade
        }

        unset clade
      } elseif {$argc eq 1 || ![llength $tuned]} {
        set demos "\nTunning:\n\t%s\n\nExample:\n\ttclsh %s %s n0 j3\n"
        set mnemo [info script]

        puts [format $demos $harps $mnemo [lindex $harps 0]]

        unset demos mnemo
      } elseif {$argc > 1 && [llength $tuned]} {
        set harp [lindex $argv 0]
        set signs [lrange $argv 1 end]

        if {[llength [lsearch -inline -exact $signs "flock"]]} {
          puts ""
          foreach sign $clefs {
            set crow $lyrebird($sign)

            fingerboard $sign $crow $harp

            puts ""
          }

          unset clefs crow harp harps sign signs tuned
          exit 0
        } else {
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

          unset harp signs sign
        }
      }

      unset harps tuned
    } else {
      signboard $clefs
    }

    unset clefs
  } else {
    set demos "\nUnable to source %s\n\nExample:\n\ttclsh %s help\n"
    set mnemo [info script]

    puts stderr [format $demos $mnemo $mnemo]

    unset demos mnemo
  }

} ;# close Syrinx

