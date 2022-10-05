#! /usr/bin/env tclsh

# prefetch.tcl
 
  # initialize Estrilda
  proc init_estrilda {} {
    variable lyrebird

    if {[namespace exists Estrilda]} {
      namespace import Estrilda::signboard
      namespace upvar Estrilda oscines temps

      array set lyrebird [array get temps]
    } else {
      error "Estrilda absent!"
    }
  }

  # initialize Ploceus
  proc init_ploceus {} {
    variable gears

    if {[namespace exists Ploceus]} {
      namespace import Ploceus::fingerboard
      namespace upvar Ploceus machines temps

      set gears $temps
    } else {
      error "Ploceus absent!"
    }
  }

  # check targets to be sourced
  proc cabinetP {capsule} {
    if {
      [file exists $capsule] &&
      [file isfile $capsule] &&
      [file readable $capsule]
    } then {
      source $capsule

      set moniker [file rootname $capsule]

      init_$moniker

      unset moniker
    } else {
      error "problem sourcing $capsule"
    }
  }

  # target present initialize or throw exception
  proc anomalyP {capsule} {
    if {[catch { cabinetP $capsule } errs] } {
      set hint "%s: failed to initialize $capsule, %s"

      puts stderr [format $hint [info script] $errs]

      unset errs
      exit 1
    }
  }

