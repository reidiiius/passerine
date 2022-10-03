#! /usr/bin/env tclsh

namespace eval Syrinx {

  # moves from parent directory to child repository
  proc repositron {} {
    set seat [file tail [info script]]
    set path [file normalize [file dirname $seat]]

    if {![string match -nocase *passerine* $path]} {
      foreach folder [lsort [glob -type d *]] {
        if {[string match -nocase *passerine* $folder]} {
          cd $folder
        }
      }
    }

    unset path seat
  }

  # initialize Estrilda
  proc init_estrilda {} {
    variable lyrebird

    if {[namespace exists Estrilda]} {
      namespace import Estrilda::signboard
      namespace upvar Estrilda oscines temps

      array set lyrebird [array get temps]
    } else {
      error "Estrilda absent!"
    }
  }

  # initialize Ploceus
  proc init_ploceus {} {
    variable gears

    if {[namespace exists Ploceus]} {
      namespace import Ploceus::fingerboard
      namespace upvar Ploceus machines temps

      set gears $temps
    } else {
      error "Ploceus absent!"
    }
  }

  # check targets to be sourced
  proc cabinetP {capsule} {
    if {
      [file exists $capsule] &&
      [file isfile $capsule] &&
      [file readable $capsule]
    } then {
      source $capsule

      set moniker [file rootname $capsule]

      init_$moniker

      unset moniker
    } else {
      error "problem sourcing $capsule"
    }
  }

  # target present initialize or throw exception
  proc anomalyP {capsule} {
    if {[catch { cabinetP $capsule } errs] } {
      set hint "%s: failed to initialize $capsule, %s"

      puts stderr [format $hint [info script] $errs]

      unset errs
      exit 1
    }
  }

  # search through key signatures
  proc research {clefs argv} {
    set temps [list ]

    foreach sign $clefs {
      lappend temps $sign
    }
    set clade [lsearch -all -inline $temps *$argv*]

    if {[llength $clade]} {
      signboard $clade
    }

    unset clade sign temps
  }

  # display help message with examples
  proc examples {gears} {
    set demos "\nTunings:\n\t%s\n\nExample:\n\ttclsh %s %s n0 j3\n"
    set mnemo [info script]

    puts [format $demos $gears $mnemo [lindex $gears 0]]

    unset demos mnemo
  }

  # display all matrices formatted in chosen tuning
  proc gamuts {clefs harp} {
    variable lyrebird

    puts ""
    foreach sign $clefs {
      set crow $lyrebird($sign)

      fingerboard $sign $crow $harp

      puts ""
    }

    unset crow sign
  }

  # display matrices of chosen tuning and signatures
  proc matrices {signs harp} {
    variable lyrebird
    set crow $lyrebird(z0)

    puts ""
    foreach sign $signs {
      if {[info exists lyrebird($sign)]} {
        set crow $lyrebird($sign)

        fingerboard $sign $crow $harp

      } else {
        puts stderr "\t$sign ?"
      }
      puts ""
    }

    unset crow harp sign signs
  }

  # display sourcing error message with alternative example
  proc sourmash {} {
    set demos "\nUnable to source %s\n\nExample:\n\ttclsh %s help\n"
    set mnemo [info script]

    puts stderr [format $demos $mnemo $mnemo]

    unset demos mnemo
  }

  # check for main script or loaded library
  if {$argv0 eq [info script] && !$tcl_interactive} {

    # moves from parent directory to child repository
    repositron

    # target present initialize or throw exception
    anomalyP estrilda.tcl

    anomalyP ploceus.tcl

    # vessel to hold key signature names
    variable clefs {}
    lset clefs [lsort -ascii [array names lyrebird]]

    if {$argc} then {
      # establish instrument tuning
      set tuned [lindex $gears [lsearch -exact $gears [lindex $argv 0]]]

      if {$argc eq 1 && [string match {*[0-7]*} [lindex $argv 0]]} {
        # search through key signatures
        research $clefs $argv

      } elseif {$argc eq 1 || ![llength $tuned]} {
        # display help message with examples
        examples $gears

      } elseif {$argc > 1 && [llength $tuned]} {
        # correct tuning chosen so parse variant arguments
        set harp [lindex $argv 0]
        set signs [lrange $argv 1 end]

        if {[llength [lsearch -inline -exact $signs "flock"]]} {
          # display all matrices formatted in chosen tuning
          gamuts $clefs $harp

          unset clefs gears harp lyrebird signs tuned
          exit 0

        } else {
          # display matrices of chosen tuning and signatures
          matrices $signs $harp

          unset harp signs
        }
      }

      unset tuned

    } else {
      # display menu of signature selections
      signboard {}
    }

    unset clefs gears lyrebird

  } else {
    # display sourcing error message with alternative example
    sourmash
  }

} ;# close Syrinx

