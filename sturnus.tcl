
namespace eval Sturnus {

  namespace export *

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

  # display help message with examples
  proc examples {gears} {
    set demos "\nTunings:\n\t%s\n\nExample:\n\ttclsh %s %s n0 j3\n"
    set mnemo [info script]

    puts [format $demos $gears $mnemo [lindex $gears 0]]

    unset demos mnemo
  }

} ;# close Sturnus

