#! /usr/bin/env tclsh

namespace eval Syrinx {

  # maximum number of input characters
  variable spandex 15

  # check targets to be sourced
  variable timeline
  set timeline [clock format [clock seconds] \
    -timezone UTC -format "%Y-%m-%dT%TZ"]

  variable resources {}
  lset resources {estrilda.tcl ploceus.tcl sturnus.tcl}

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

  # initialization
  apply { {dateline} {
    variable songbird
    variable tuners

    if {[namespace exists ::Estrilda]} {
      namespace import ::Estrilda::*
      namespace upvar ::Estrilda oscines temps

      array set songbird [array get temps]
    } else {
      puts stderr "Estrilda absent! $dateline"
      exit 1
    }

    if {[namespace exists ::Ploceus]} {
      namespace import ::Ploceus::fingerboard
      namespace upvar ::Ploceus machines temps

      set tuners $temps
    } else {
      puts stderr "Ploceus absent! $dateline"
      exit 1
    }

    if {[namespace exists ::Sturnus]} {
      namespace import ::Sturnus::*

    } else {
      puts stderr "Sturnus absent! $dateline"
      exit 1
    }
  }} $timeline

  # entryway
  apply { {spandex}
    {
      global argc argv

      # reference pointers
      upvar 1 tuners gears
      upvar 1 songbird lyrebird

      # vessel to hold key signature names
      set clefs [lsort -ascii [array names lyrebird]]

      if {$argc} then {
        set carts $argc

        # maximum amount of input arguments
        set climax [expr {[llength $clefs] + 1}]

        # vessel to hold limited arguments
        set argots [list ]

        # limit input arguments to be processed
        lset argots [Sturnus::governor $climax $argv]

        # limit quantity of characters for each argument
        lset argots [Sturnus::sentinel $argots $spandex]

        # establish instrument tuning
        set tuned [lindex $gears [lsearch -exact $gears [lindex $argots 0]]]

        # numerically search through keys
        if {$carts eq 1 && [string match {*[0-9]*} [lindex $argots 0]]} {
          set kinda [lindex $argots 0]

          Estrilda::research $clefs $kinda

          unset kinda
        } elseif {$carts eq 1 || ![llength $tuned]} {
          # display help message with examples
          Sturnus::examples $gears

        } elseif {$carts > 1 && [llength $tuned]} {
          # correct tuning chosen so parse variant arguments
          set harp [lindex $argots 0]
          set kids [lrange $argots 1 end]

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
            foreach sign $kids {
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

        unset argots carts climax tuned
      } else {
        # display menu of signatures
        Estrilda::signboard
      }

      unset clefs gears lyrebird
    }
  } $spandex

  unset resources spandex target timeline
} ;# close Syrinx

