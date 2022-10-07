#! /usr/bin/env tclsh

namespace eval Syrinx {

  variable qualid
  variable spandex

  # name of current namespace
  set qualid [namespace tail [namespace current]]

  # maximum number of characters in a string
  set spandex 15

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

  # if target present initialize or throw exception
  foreach target {estrilda ploceus sturnus} {
    anomalyP ${target}.tcl
  }

  # entryway
  proc mainframe {} {
    global argc argv argv0 tcl_interactive

    variable gears
    variable lyrebird
    variable qualid
    variable spandex

    # check for main script or loaded library
    if {$argv0 eq [info script] && !$tcl_interactive} {

      # reference pointers
      upvar 1 tuners gears
      upvar 1 songbird lyrebird

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
            puts stderr "\n\t${kinda}... ?\n"
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
            if {[array size lyrebird]} {
              set crow [string repeat "____ " 12]

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

            unset clefs gears harp lyrebird kids tuned
            exit 0
          } else {
            # display matrices of chosen tuning and keys
            set crow [string repeat "____ " 12]

            puts ""
            foreach sign [governor $kids $spandex] {
              if {[info exists lyrebird($sign)]} {
                set crow $lyrebird($sign)

                fingerboard $sign $crow $harp

              } else {
                puts stderr "\t$sign ?"
              }
              puts ""
            }

            unset crow harp sign kids
          }
        }

        unset tuned
      } else {
        # display menu of signature selections
        signboard {}
      }

      unset clefs gears lyrebird
    } else {
      # display sourcing error message
      sourmash
    }

    unset qualid spandex
  }

  # entryway
  mainframe

} ;# close Syrinx

