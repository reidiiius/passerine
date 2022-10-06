#! /usr/bin/env tclsh

namespace eval PreFetch {

  variable qualid

  # name of current namespace
  set qualid [namespace tail [namespace current]]

  # initialize Estrilda
  proc init_estrilda {} {
    variable songbird

    if {[namespace exists Estrilda]} {
      namespace import Estrilda::*
      namespace upvar Estrilda oscines temps

      array set songbird [array get temps]
    } else {
      error "Estrilda absent!"
    }
  }

  # initialize Ploceus
  proc init_ploceus {} {
    variable tuners

    if {[namespace exists Ploceus]} {
      namespace import Ploceus::fingerboard
      namespace upvar Ploceus machines temps

      set tuners $temps
    } else {
      error "Ploceus absent!"
    }
  }

  # initialize Sturnus
  proc init_sturnus {} {
    if {[namespace exists Sturnus]} {
      namespace import Sturnus::*

    } else {
      error "Sturnus absent!"
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

  # if target present initialize or throw exception
  proc anomalyP {capsule} {
    if {[catch {cabinetP $capsule} errs]} {
      set hint "%s: failed to initialize $capsule, %s"

      puts stderr [format $hint [info script] $errs]

      unset errs
      exit 1
    }
  }

} ;# close PreFetch

