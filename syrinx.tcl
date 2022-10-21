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
  return
}} {estrilda.tcl ploceus.tcl sturnus.tcl}


namespace eval Syrinx {

  namespace export *

  # iso-8601 zulu time
  variable dateline
  set dateline [clock format [clock seconds] \
    -timezone UTC -format "%Y-%m-%dT%TZ"]

  # display matrices of chosen tuning and keys
  proc compendia {harp kids} {
    set crow [string repeat "____ " 12]

    puts ""
    foreach sign $kids {
      if {[info exists ::Estrilda::oscines($sign)]} {
        set crow $::Estrilda::oscines($sign)

        ::Ploceus::fingerboard $sign $crow $harp

      } else {
        puts stderr "\t$sign ?"
      }
      puts ""
    }

    unset crow harp sign kids
    return
  }

  # entryway
  proc atrium {{cargos 0} {argots {}}} {
    # vessel to hold key signature names
    set clefs [lsort -ascii [array names ::Estrilda::oscines]]

    # maximum amount of input arguments
    set climax [expr {[llength $clefs] + 1}]

    if {$cargos && ($cargos <= $climax)} then {
      # maximum number of input characters
      set spandex 15

      # limit quantity of characters for each argument
      lset argots [::Sturnus::sentinel $argots $spandex]

      # establish instrument tuning
      set tuned [lindex $::Ploceus::machines [
        lsearch -exact $::Ploceus::machines [lindex $argots 0]]]

      # numerically search through keys
      if {($cargos eq 1) && [string match {*[0-9]*} [lindex $argots 0]]} {
        set kinda [lindex $argots 0]

        ::Estrilda::research $clefs $kinda

        unset kinda
      } elseif {($cargos eq 1) &&
        [string match {*[A-z]*} [lindex $argots 0]] &&
       ![string length [
         lsearch -exact -inline $::Ploceus::machines [lindex $argots 0]]] &&
       ![string equal help [lindex $argots 0]]
        } then {
        # alphabetic search through values
        ::Estrilda::correlate [lindex $argots 0] $::Ploceus::metallic

      } elseif {($cargos eq 1) || ![llength $tuned]} {
        # display help message with examples
        ::Sturnus::examples $::Ploceus::machines 

      } elseif {($cargos > 1) && [llength $tuned]} {
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

          unset argots cargos clefs climax
          unset harp kids spandex tuned
          exit 0
        } else {
          # display matrices of chosen tuning and keys
          compendia $harp $kids

          unset harp kids
        }
      }

      unset argots cargos spandex tuned
    } else {
      # display menu of signatures
      ::Estrilda::signboard
    }

    unset clefs climax
    return
  } ;# atrium

  atrium $argc $argv

} ;# close Syrinx

