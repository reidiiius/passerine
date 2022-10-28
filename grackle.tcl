
namespace eval ::Grackle {

  # attempts to acquire and evaluate named capsules
  proc exordium {capsule} {
    if {
      [file exists $capsule] &&
      [file isfile $capsule]
    } then {
      source $capsule
    } else {
      set meantime [clock format [clock seconds] \
        -timezone UTC -format "%Y-%m-%dT%TZ"]

      puts stderr "problem sourcing $capsule $meantime"

      unset meantime
      exit 1
    }

    return
  }

  # remedial guardian sniffs for named capsules
  proc guardian {files} {
    foreach capsule $files {
      set moniker [string toupper [file rootname $capsule] 0]

      if {![namespace exists ::$moniker]} {
        exordium $capsule
      }
    }

    return
  }

} ;# close Grackle

