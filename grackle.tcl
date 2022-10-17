
# grackle.tcl

# attempts to acquire and evaluate named capsules
proc exordium {files} {
  lmap target $files {
    apply { {capsule}
      {
        if {
          [file exists $capsule] &&
          [file isfile $capsule]
        } then {
          source $capsule
        } else {
          set dateline [clock format [clock seconds] \
            -timezone UTC -format "%Y-%m-%dT%TZ"]

          puts stderr "problem sourcing $capsule $dateline"

          unset dateline
          exit 1
        }
      }
    } $target
  }

  unset target
  return
}

