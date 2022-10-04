#! /usr/bin/env tclsh

namespace eval Syrinx {

  variable qualid
  variable spandex

  # name of current namespace
  set qualid [namespace tail [namespace current]]

  # maximum number of characters in a string
  set spandex 15

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

  # limit quantity of standard input characters
  proc sentinel {argc argv caps} {
    set item 0

    while {$item ne $argc} {
      if {[string length [lindex $argv $item]] > $caps} {
        # govern amount of characters in violator argument
        lset argv $item [string range [lindex $argv $item] 0 $caps]
      }

      incr item
    }

    unset item
  }

  # limits quantity of characters for each element of
  # given list and returns normalized list of strings
  # see procedure sentinel and variable spandex
  proc governor {kids caps} {
    set narc [llength $kids]
    set item 0

    while {$item ne $narc} {
      if {[string length [lindex $kids $item]] > $caps} {
        # govern amount of characters in violator argument
        lset kids $item [string range [lindex $kids $item] 0 $caps]
      }

      incr item
    }

    unset item narc
    return $kids
  }

  # search through keys
  proc research {clefs kinda} {
    set clutch [list ]

    if {[llength $clefs]} {
      foreach egg $clefs {
        lappend clutch $egg
      }

      unset egg
    } else {
      variable qualid

      puts stderr "${qualid}::research passed an empty tuple"
    }

    if {[llength $clutch]} {
      set clade [lsearch -all -inline $clutch *$kinda*]

      if {[llength $clade]} {
        signboard $clade
      } else {
        puts "\n\tNothing similar to $kinda\n"
      }

      unset clade
    }

    unset clutch
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

    if {[array size lyrebird]} {
      puts ""
      foreach sign $clefs {
        set crow $lyrebird($sign)

        fingerboard $sign $crow $harp

        puts ""
      }

      unset crow sign
    } else {
      variable qualid

      puts stderr "${qualid}::lyrebird is empty"
    }
  }

  # display matrices of chosen tuning and keys
  proc matrices {kids harp} {
    variable lyrebird
    variable spandex
    set crow [string repeat "____ " 12]

    puts ""
    foreach sign $kids {
      # input characters quantity limit
      if {[string length $sign] < $spandex &&
          [info exists lyrebird($sign)]
      } then {
        set crow $lyrebird($sign)

        fingerboard $sign $crow $harp

      } else {
        puts stderr "\t[string range $sign 0 9] ?"
      }
      puts ""
    }

    unset crow harp sign kids
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
      # limit quantity of input characters
      sentinel $argc $argv $spandex

      # establish instrument tuning
      set tuned [lindex $gears [lsearch -exact $gears [lindex $argv 0]]]

      if {$argc eq 1 && [string match {*[0-9]*} [lindex $argv 0]]} {
        # search through keys
        set kinda [lindex $argv 0]

        # input characters quantity limit
        if {[string length $kinda] < $spandex} {
          research $clefs $kinda
        } else {
          puts stderr "\n\t[string range $kinda 0 9]... ?\n"
        }

        unset kinda
      } elseif {$argc eq 1 || ![llength $tuned]} {
        # display help message with examples
        examples $gears

      } elseif {$argc > 1 && [llength $tuned]} {
        # correct tuning chosen so parse variant arguments
        set harp [lindex $argv 0]
        set kids [lrange $argv 1 end]

        if {[llength [lsearch -inline -exact $kids "flock"]]} {
          # display all matrices formatted in chosen tuning
          gamuts $clefs $harp

          unset clefs gears harp lyrebird kids tuned
          exit 0

        } else {
          # display matrices of chosen tuning and keys
          matrices [governor $kids 12] $harp

          unset harp kids
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

  unset qualid
} ;# close Syrinx

