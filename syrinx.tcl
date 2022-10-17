#! /usr/bin/env tclsh

# syrinx.tcl

# remedial guardian sniffs for named capsules
apply {{files} {
  set perch grackle.tcl

  if {[file exists $perch]} {
    source $perch
    guardian $files
  } else {
    puts stderr "$perch not found"
    exit 1
  }

  unset perch
}} {estrilda.tcl ploceus.tcl sturnus.tcl}


namespace eval Syrinx {

  # iso-8601 zulu time
  variable dateline
  set dateline [clock format [clock seconds] \
    -timezone UTC -format "%Y-%m-%dT%TZ"]

  # entryway
  apply { {carts argots}
    {
      namespace upvar Estrilda oscines songbirds
      namespace upvar Ploceus machines gears

      # vessel to hold key signature names
      set clefs [lsort -ascii [array names songbirds]]

      # maximum amount of input arguments
      set climax [expr {[llength $clefs] + 1}]

      if {$carts && $carts <= $climax} then {
        # maximum number of input characters
        set spandex 15

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

            if {[array size songbirds]} {
              set crow [string repeat "____ " 12]

              puts ""
              foreach sign $clefs {
                set crow $songbirds($sign)

                Ploceus::fingerboard $sign $crow $harp

                puts ""
              }

              unset crow sign
            } else {
              puts stderr "songbirds is empty"
              exit 1
            }

            unset argots carts clefs climax gears
            unset harp kids songbirds spandex tuned
            exit 0
          } else {
            # display matrices of chosen tuning and keys
            set crow [string repeat "____ " 12]

            puts ""
            foreach sign $kids {
              if {[info exists songbirds($sign)]} {
                set crow $songbirds($sign)

                Ploceus::fingerboard $sign $crow $harp

              } else {
                puts stderr "\t$sign ?"
              }
              puts ""
            }

            unset crow harp sign kids
          }
        }

        unset argots carts spandex tuned
      } else {
        # display menu of signatures
        Estrilda::signboard
      }

      unset clefs climax
      return
    }
  } $argc $argv

} ;# close Syrinx

