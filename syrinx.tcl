#! /usr/bin/env tclsh

# syrinx.tcl

# remedial guardian sniffs for named capsules
apply {{files} {
  set perch grackle.tcl

  if {[file exists $perch]} {
    source $perch
    Grackle::guardian $files
  } else {
    puts stderr "$perch not found"
    exit 1
  }

  unset perch
  return
}} {estrilda.tcl ploceus.tcl sturnus.tcl}


namespace eval ::Syrinx {

  namespace export atrium

  # name of current namespace
  set surname [namespace tail [namespace current]]

  # iso-8601 timestamp
  proc dateline {} {
    set meantime [clock format [clock seconds] \
      -timezone UTC -format "%Y-%m-%dT%TZ"]

    return $meantime
  }

  # display matrices of chosen tuning and keys
  proc compendia {{harp ""} {kids {}}} {
    if [llength $kids] then {
      puts ""
      foreach sign $kids {
        ::Ploceus::fingerboard $sign $harp
        puts ""
      }

      unset sign
    }

    unset harp kids
    return
  }

  # entryway
  proc atrium {{argots {}}} {
    set amount [llength $argots]

    # vessel to hold key signature names
    set clefs [lsort -ascii [array names ::Estrilda::oscines]]

    # maximum amount of input arguments
    set climax [expr {[llength $clefs] + 1}]

    if {$amount && ($amount <= $climax)} then {
      # maximum number of input characters
      set spandex 15

      # limit quantity of characters for each argument
      lset argots [::Sturnus::sentinel $argots $spandex]

      # establish instrument tuning
      set tuned [lindex $::Ploceus::machines [
        lsearch -exact $::Ploceus::machines [lindex $argots 0]]]

      # numerically search through keys
      if {($amount eq 1) && [string match {*[0-9]*} [lindex $argots 0]]} {
        set kinda [lindex $argots 0]

        ::Estrilda::research $clefs $kinda

        unset kinda
      } elseif {($amount eq 1) &&
        [string match {*[A-z]*} [lindex $argots 0]] &&
       ![string length [
         lsearch -exact -inline $::Ploceus::machines [lindex $argots 0]]] &&
       ![string equal help [lindex $argots 0]]
        } then {
        # alphabetic search through values
        ::Estrilda::correlate [lindex $argots 0] $::Ploceus::metallic

      } elseif {($amount eq 1) || ![llength $tuned]} {
        # display help message with examples
        ::Sturnus::examples $::Ploceus::machines 

      } elseif {($amount > 1) && [llength $tuned]} {
        # correct tuning chosen so parse variant arguments
        set harp [lindex $argots 0]
        set kids [lrange $argots 1 end]

        if {[string length [lsearch -exact -inline $kids "flock"]]} {
          # display all matrices formatted in chosen tuning
          if {[array size ::Estrilda::oscines]} {
            compendia $harp $clefs

          } else {
            puts stderr "::Estrilda::oscines is empty"
            exit 1
          }

          unset argots amount clefs climax
          unset harp kids spandex tuned
          exit 0
        } else {
          # display matrices of chosen tuning and keys
          compendia $harp $kids

          unset harp kids
        }
      }

      unset amount argots spandex tuned
    } else {
      # display menu of signatures
      ::Estrilda::signboard
    }

    unset clefs climax
    return
  } ;# atrium

  atrium $argv

} ;# close Syrinx

