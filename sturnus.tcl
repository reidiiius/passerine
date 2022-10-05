#! /usr/bin/env tclsh

# sturnus.tcl

  variable qualid
  variable spandex

  # name of current namespace
  set qualid [namespace tail [namespace current]]

  # maximum number of characters in a string
  set spandex 15

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

  # display help message with examples
  proc examples {gears} {
    set demos "\nTunings:\n\t%s\n\nExample:\n\ttclsh %s %s n0 j3\n"
    set mnemo [info script]

    puts [format $demos $gears $mnemo [lindex $gears 0]]

    unset demos mnemo
  }

  # display sourcing error message with alternative example
  proc sourmash {} {
    set demos "\nUnable to source %s\n\nExample:\n\ttclsh %s help\n"
    set mnemo [info script]

    puts stderr [format $demos $mnemo $mnemo]

    unset demos mnemo
  }

