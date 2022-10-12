
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
  proc governor {maxine argues} {
    if {$maxine >= [llength $argues]} {
      set group $argues
    } else {
      set group [lrange $argues 0 [expr {$maxine - 1}]]
    }

    return $group
  }

  # display help message with examples
  proc examples {gears} {
    set demos "\nTunings:\n\t%s\n\nExample:\n\ttclsh %s %s n0 j3\n"
    set mnemo [info script]

    puts [format $demos $gears $mnemo [lindex $gears 0]]

    unset demos mnemo
  }

} ;# close Sturnus

