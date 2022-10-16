#! /usr/bin/env tclsh

# tyranni.tcl

# remedial guardian sniffs for named capsules
if {
  ![namespace exist ::Estrilda] ||
  ![namespace exist ::Ploceus ] ||
  ![namespace exist ::Sturnus ] ||
  ![namespace exist ::Syrinx  ]
} then {
  set perch grackle.tcl

  if {[file exists $perch]} {
    source $perch
  } else {
    puts stderr "$perch not found"
    exit 1
  }
  unset perch

  exordium {estrilda.tcl ploceus.tcl sturnus.tcl syrinx.tcl}
}

# casework
if {0} then {

package require tcltest

namespace eval ::Corvus::test {

  namespace import ::tcltest::*

  proc roost {unit} {
    after [expr {int($unit * 1000)}]
  }

  roost 1
  puts "\n\t\t| Estrilda Test |\n"
  roost 1

  test estrilda-1.0 {Estrilda existence} {
    namespace exists ::Estrilda
  } 1

  test estrilda-1.1 {place-holder} -constraints {emptyTest}

  test estrilda-1.2 {qualid value} {
    string tolower $Estrilda::qualid
  } estrilda

  test estrilda-1.3 {Estrilda::oscines existence} {
    array exists Estrilda::oscines
  } 1

  test estrilda-1.4 {Estrilda::oscines has 84 records} {
    array size Estrilda::oscines
  } 84

  test estrilda-1.5 {crow value ascii} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    string is ascii -strict $crow
  } -cleanup {
    unset crow sign
  } -result 1

  test estrilda-1.6 {crow string length} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    string length $crow
  } -cleanup {
    unset crow sign
  } -result 60

  test estrilda-1.7 {crow value tuple} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    string is list -strict $crow
  } -cleanup {
    unset crow sign
  } -result 1

  test estrilda-1.8 {crow list length} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    llength $crow
  } -cleanup {
    unset crow sign
  } -result 12

  test estrilda-1.9 {crow consecutive underscores} -setup {
    set sign n0
    set crow $Estrilda::oscines($sign)
  } -body {
    string match *\x5f\x5f* $crow
  } -cleanup {
    unset crow sign
  } -result 1

  test estrilda-2.0 {signboard passed nothing} {
    Estrilda::signboard
  } {}

  test estrilda-2.1 {signboard passed empty tuple} {
    Estrilda::signboard {}
  } {}

  test estrilda-2.2 {signboard passed inhabited tuple} -setup {
    set clefs [array names Estrilda::oscines]
  } -body {
    Estrilda::signboard $clefs
  } -cleanup {
    unset clefs
  } -result {}

  test estrilda-2.3 {research passed empty tuple} {
    Estrilda::research {} 99
  } 1

  test estrilda-2.4 {research matchless} -setup {
    set clefs [array names Estrilda::oscines]
  } -body {
    Estrilda::research $clefs 99
  } -cleanup {
    unset clefs
  } -result {}

  test estrilda-2.5 {research matches} -setup {
    set clefs [array names Estrilda::oscines]
    set sign k2j5
  } -body {
    Estrilda::research $clefs $sign
  } -cleanup {
    unset clefs sign
  } -result {}

  roost 1
  puts "\n\t\t| Ploceus Test |\n"
  roost 1

  test ploceus-1.0 {Ploceus existence} {
    namespace exists ::Ploceus
  } 1

  test ploceus-1.1 {place-holder} -constraints {emptyTest}

  test ploceus-1.2 {Ploceus::machines has 5 elements} {
    llength $Ploceus::machines
  } 5

  test ploceus-1.3 {matallic is ascii} {
    string is ascii -strict $Ploceus::metallic
  } 1

  test ploceus-1.4 {matallic is boolean} {
    string is boolean -strict $Ploceus::metallic
  } 1

  test ploceus-1.5 {matallic is false} {
    string is false -strict $Ploceus::metallic
  } 1

  test ploceus-1.6 {sequence is digit} {
    string is digit -strict $Ploceus::sequence
  } 1

  test ploceus-1.7 {sequence is number} {
    expr {0 < $Ploceus::sequence}
  } 1

  test ploceus-1.8 {tributes existence} {
    array exists Ploceus::tributes
  } 1

  test ploceus-1.9 {tributes has 4 records} {
    array size Ploceus::tributes
  } 4

  test ploceus-2.0 {utensils existence} {
    array exists Ploceus::utensils
  } 1

  test ploceus-2.1 {utensils has 9 records} {
    array size Ploceus::utensils
  } 9

  puts ""

  test ploceus-2.2 {fingerboard returns null} -setup {
    set sign k2j6
    set crow $Estrilda::oscines($sign)
    set harp beadgcf
  } -body {
    Ploceus::fingerboard $sign $crow $harp
  } -cleanup {
    unset crow harp sign
  } -result {}

  puts ""

  roost 1
  puts "\n\t\t| Sturnus Test |\n"
  roost 1

  test sturnus-1.0 {Sturnus existence} {
    namespace exists ::Sturnus
  } 1

  test sturnus-1.1 {place-holder} -constraints {emptyTest}

  test sturnus-1.2 {governor passed empty tuple} {
    llength [Sturnus::governor {}]
  } 0

  test sturnus-1.3 {governor passed inhabited tuple} -setup {
    set clefs [array names Estrilda::oscines]
    set group [concat $clefs $clefs]
  } -body {
    llength [Sturnus::governor $group]
  } -cleanup {
    unset clefs group
  } -result 128 ;# default parameter value

  test sturnus-1.4 {governor passed tuple and max value} -setup {
    set clefs [array names Estrilda::oscines]
    set group [concat $clefs $clefs]
  } -body {
    llength [Sturnus::governor $group [llength $clefs]]
  } -cleanup {
    unset clefs group
  } -result [llength [array names Estrilda::oscines]]

  test sturnus-1.5 {sentinel passed empty tuple} {
    llength [Sturnus::sentinel {}]
  } 0

  test sturnus-1.6 {sentinel passed inhabited tuple} -setup {
    set clefs [array names Estrilda::oscines]
    set group [lsort $clefs]
  } -body {
    string length [lindex [Sturnus::sentinel $group] end-2]
  } -cleanup {
    unset clefs group
  } -result 5

  test sturnus-1.7 {sentinel passed tuple and max value} -setup {
    set clefs [array names Estrilda::oscines]
    set group [lsort $clefs]
    set maxel 1
  } -body {
    string length [lindex [Sturnus::sentinel $group $maxel] end-2]
  } -cleanup {
    unset clefs group maxel
  } -result 2

  test sturnus-1.8 {examples passed empty tuple} {
    Sturnus::examples
  } ok

  test sturnus-1.9 {examples passed inhabited tuple} {
    Sturnus::examples $Ploceus::machines
  } ok

  roost 1
  puts "\n\t\t| Syrinx Test |\n"
  roost 1

  test syrinx-1.0 {Syrinx existence} {
    namespace exists ::Syrinx
  } 1

  test syrinx-1.1 {place-holder} -constraints {emptyTest}

  test syrinx-1.2 {Syrinx dateline is ascii} {
    string is ascii -strict $Syrinx::dateline
  } 1

  puts [string repeat " ~" 36]

  foreach ns {::Syrinx ::Sturnus ::Ploceus ::Estrilda} {
    namespace delete $ns
  }

  cleanupTests
}

namespace delete ::Corvus::test

} ;# casework

