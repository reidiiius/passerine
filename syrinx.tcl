#! /usr/bin/env tclsh

namespace eval Syrinx {

  # maximum number of input characters
  variable spandex 15

  # check targets to be sourced
  variable timeline
  set timeline [clock format [clock seconds] \
    -timezone UTC -format "%Y-%m-%dT%TZ"]

  variable resources {}
  lset resources {estrilda.tcl ploceus.tcl sturnus.tcl prefetch.tcl}

  lmap target $resources {
    apply { {capsule dateline}
      {
        if {
          [file exists $capsule] &&
          [file isfile $capsule] &&
          [file readable $capsule]
        } then {
          source $capsule
        } else {
          puts stderr "problem sourcing $capsule $dateline"
          exit 1
        }
      }
    } $target $timeline
  }

  # entryway
  apply { {spandex}
    {
      global argc argv

      # reference pointers
      upvar 1 tuners gears
      upvar 1 songbird lyrebird

      # vessel to hold key signature names
      variable clefs {}
      lset clefs [lsort -ascii [array names lyrebird]]

      if {$argc} then {
        # limit quantity of input characters
        Sturnus::sentinel $argc $argv $spandex

        # establish instrument tuning
        set tuned [lindex $gears [lsearch -exact $gears [lindex $argv 0]]]

        if {$argc eq 1 && [string match {*[0-9]*} [lindex $argv 0]]} {
          # search through keys
          set kinda [lindex $argv 0]

          # input characters quantity limit
          if {[string length $kinda] < $spandex} {
            Estrilda::research $clefs $kinda
          } else {
            puts stderr "\n\t${kinda}... ?\n"
          }

          unset kinda
        } elseif {$argc eq 1 || ![llength $tuned]} {
          # display help message with examples
          Sturnus::examples $gears

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

                Ploceus::fingerboard $sign $crow $harp

                puts ""
              }

              unset crow sign
            } else {
              puts stderr "lyrebird is empty"
              exit 1
            }

            unset clefs gears harp lyrebird kids tuned
            exit 0
          } else {
            # display matrices of chosen tuning and keys
            set crow [string repeat "____ " 12]

            puts ""
            foreach sign [Sturnus::governor $kids $spandex] {
              if {[info exists lyrebird($sign)]} {
                set crow $lyrebird($sign)

                Ploceus::fingerboard $sign $crow $harp

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
        Estrilda::signboard {}
      }

      unset clefs gears lyrebird
    }
  } $spandex

  unset resources spandex target timeline
} ;# close Syrinx

