
namespace eval Sturnus {

  namespace export *

  # limit quantity of standard input characters
  proc sentinel {argots {caps 24}} {
    set narc [llength $argots]
    set item 0

    while {$item < $narc} {
      if {[string length [lindex $argots $item]] > $caps} {
        # govern amount of characters in violator argument
        lset argots $item [string range [lindex $argots $item] 0 $caps]
      }

      incr item
    }

    unset item narc
    return $argots
  }

  # limit input arguments to be processed
  proc governor {argots {caps 128}} {
    if {[llength $argots] > $caps} {
      set argots [lrange $argots 0 [expr {$caps - 1}]]
    }

    return $argots
  }

  # display help message with examples
  proc examples {{gears {beadgcf cgdae eadgbe}}} {
    global tcl_interactive

    if {$tcl_interactive} then {
      set mnemo syrinx.tcl
    } else {
      set mnemo [file tail [info script]]
    }

    set demos "\nTunings:\n\t%s\n\nExample:\n\ttclsh %s %s n0 j3\n"

    puts [format $demos $gears $mnemo [lindex $gears 0]]

    unset demos mnemo
    return ok
  }

} ;# close Sturnus

