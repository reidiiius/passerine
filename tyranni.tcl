#! /usr/bin/env tclsh

# tyranni.tcl

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
}} {syrinx.tcl}


# casework
if { false } then {

  if { $argc } then {
    lset argv { -verbose bels -debug 1 }
  }

package require tcltest

namespace eval ::Tyranni::test {

  namespace import ::tcltest::*

  proc roost {unit} {
    after [expr {int($unit * 1000)}]
    return
  }

  roost 1
  puts "\n\t\t| Estrilda Test |\n"
  roost 1

  test estrilda-1.0 {Estrilda existence} {
    namespace exists ::Estrilda
  } 1

  test estrilda-1.1 {surname value} {
    string tolower $Estrilda::surname
  } estrilda

  test estrilda-1.15 {transits has 13 pairs} {
    expr {[llength $Estrilda::transits] / 2}
  } 13

  test estrilda-1.2 {Estrilda::oscines existence} {
    array exists Estrilda::oscines
  } 1

  test estrilda-1.3 {Estrilda::oscines has 84 records} {
    array size Estrilda::oscines
  } 84

  test estrilda-1.4 {crow value ascii} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    string is ascii -strict $crow
  } -cleanup {
    unset crow sign
  } -result 1

  test estrilda-1.5 {crow string length} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    string length $crow
  } -cleanup {
    unset crow sign
  } -result 60

  test estrilda-1.6 {crow value tuple} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    string is list -strict $crow
  } -cleanup {
    unset crow sign
  } -result 1

  test estrilda-1.7 {crow list length} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    llength $crow
  } -cleanup {
    unset crow sign
  } -result 12

  test estrilda-1.8 {crow consecutive underscores} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    string match *\x5f\x5f* $crow
  } -cleanup {
    unset crow sign
  } -result 1

  test estrilda-1.9 {signboard passed nothing} {
    Estrilda::signboard
  } {}

  test estrilda-2.0 {signboard passed empty tuple} {
    Estrilda::signboard {}
  } {}

  test estrilda-2.1 {signboard passed inhabited tuple} -setup {
    set clefs [array names Estrilda::oscines]
  } -body {
    Estrilda::signboard $clefs
  } -cleanup {
    unset clefs
  } -result {}

  test estrilda-2.2 {research passed empty tuple} {
    Estrilda::research {} 99
  } 1

  test estrilda-2.3 {research matchless} -setup {
    set clefs [array names Estrilda::oscines]
  } -body {
    Estrilda::research $clefs 99
  } -cleanup {
    unset clefs
  } -result {}

  test estrilda-2.4 {research matches} -setup {
    set clefs [array names Estrilda::oscines]
    set sign k2j5
  } -body {
    Estrilda::research $clefs $sign
  } -cleanup {
    unset clefs sign
  } -result {}

  test estrilda-2.5 {place-holder} -constraints {emptyTest}

  roost 1
  puts "\n\t\t| Ploceus Test |\n"
  roost 1

  test ploceus-1.0 {Ploceus existence} {
    namespace exists ::Ploceus
  } 1

  test ploceus-1.1 {Ploceus::machines has 5 elements} {
    llength $Ploceus::machines
  } 5

  test ploceus-1.2 {matallic is ascii} {
    string is ascii -strict $Ploceus::metallic
  } 1

  test ploceus-1.3 {matallic is boolean} {
    string is boolean -strict $Ploceus::metallic
  } 1

  test ploceus-1.4 {matallic is false} {
    string is digit -strict $Ploceus::sequence
  } 1

  test ploceus-1.5 {sequence is digit} {
    string is double -strict $Ploceus::sequence
  } 1

  test ploceus-1.6 {sequence is number} {
    expr {0 < $Ploceus::sequence}
  } 1

  test ploceus-1.7 {tributes existence} {
    array exists Ploceus::tributes
  } 1

  test ploceus-1.8 {tributes has 4 records} {
    array size Ploceus::tributes
  } 4

  test ploceus-1.9 {utensils existence} {
    array exists Ploceus::utensils
  } 1

  test ploceus-2.0 {utensils has 9 records} {
    array size Ploceus::utensils
  } 9

  puts ""

  test ploceus-2.1 {fingerboard returns null} -setup {
    set sign k2j6
    set crow $Estrilda::oscines($sign)
    set harp beadgcf
  } -body {
    Ploceus::fingerboard $sign $crow $harp
  } -cleanup {
    unset crow harp sign
  } -result {}

  puts ""

  test ploceus-2.2 {place-holder} -constraints {emptyTest}

  roost 1
  puts "\n\t\t| Sturnus Test |\n"
  roost 1

  test sturnus-1.0 {Sturnus existence} {
    namespace exists ::Sturnus
  } 1

  test sturnus-1.1 {governor passed empty tuple} {
    llength [Sturnus::governor {}]
  } 0

  test sturnus-1.2 {governor passed inhabited tuple} -setup {
    set clefs [array names Estrilda::oscines]
    set group [concat $clefs $clefs]
  } -body {
    llength [Sturnus::governor $group]
  } -cleanup {
    unset clefs group
  } -result 128 ;# default parameter value

  test sturnus-1.3 {governor passed tuple and max value} -setup {
    set clefs [array names Estrilda::oscines]
    set group [concat $clefs $clefs]
  } -body {
    llength [Sturnus::governor $group [llength $clefs]]
  } -cleanup {
    unset clefs group
  } -result [llength [array names Estrilda::oscines]]

  test sturnus-1.4 {sentinel passed empty tuple} {
    llength [Sturnus::sentinel {}]
  } 0

  test sturnus-1.5 {sentinel passed inhabited tuple} -setup {
    set clefs [array names Estrilda::oscines]
    set group [lsort $clefs]
  } -body {
    string length [lindex [Sturnus::sentinel $group] end-2]
  } -cleanup {
    unset clefs group
  } -result 5

  test sturnus-1.6 {sentinel passed tuple and max value} -setup {
    set clefs [array names Estrilda::oscines]
    set group [lsort $clefs]
    set maxel 1
  } -body {
    string length [lindex [Sturnus::sentinel $group $maxel] end-2]
  } -cleanup {
    unset clefs group maxel
  } -result 2

  test sturnus-1.7 {examples passed empty tuple} {
    Sturnus::examples
  } ok

  test sturnus-1.8 {examples passed inhabited tuple} {
    Sturnus::examples $Ploceus::machines
  } ok

  test sturnus-1.9 {place-holder} -constraints {emptyTest}

  roost 1
  puts "\n\t\t| Syrinx Test |\n"
  roost 1

  test syrinx-1.0 {Syrinx existence} {
    namespace exists ::Syrinx
  } 1

  test syrinx-1.1 {Syrinx dateline returns iso-8601 timestamp} {
    regexp {^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z$} [Syrinx::dateline]
  } 1

  test syrinx-1.2 {Syrinx compendia returns null} -setup {
    set harp beadgcf
    set kids {n0 k9 k6}
  } -body {
    Syrinx::compendia $harp $kids
  } -cleanup {
    unset harp kids
  } -result {}

  test syrinx-1.3 {Syrinx atrium passed nothing returns null} {
    Syrinx::atrium
  } {}

  test syrinx-1.4 {Syrinx atrium passed tuple returns null} -setup {
    set argots {beadgcf j3 j9 j6}
  } -body {
    Syrinx::atrium $argots
  } -cleanup {
    unset argots
  } -result {}

  test syrinx-1.5 {place-holder} -constraints {emptyTest}

  puts [string repeat " ~" 36]

  foreach moniker {::Syrinx ::Sturnus ::Ploceus ::Estrilda} {
    namespace delete $moniker
  }

  cleanupTests
} ;# close Tyranni::test

namespace delete ::Tyranni::test

} ;# casework

