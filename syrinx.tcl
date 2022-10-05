#! /usr/bin/env tclsh

namespace eval Syrinx {

  # change directory to child repository if needed
  proc repositron {} {
    set seat [file tail [info script]]
    set path [file normalize [file dirname $seat]]

    # determine parent directory or child repository
    if {![string match -nocase *passerine* $path]} {
      foreach folder [lsort [glob -type d *]] {
        if {[string match -nocase *passerine* $folder]} {
          cd $folder
        }
      }
    }

    unset path seat
  }

  # navigate pathway
  repositron

  # load subroutines
  source prefetch.tcl
  source sturnus.tcl

  # entryway
  proc mainframe {} {
    global argc argv argv0 tcl_interactive

    variable gears
    variable lyrebird
    variable qualid
    variable spandex

    # check for main script or loaded library
    if {$argv0 eq [info script] && !$tcl_interactive} {

      # if target present initialize or throw exception
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
  }

  # entryway
  mainframe

} ;# close Syrinx

