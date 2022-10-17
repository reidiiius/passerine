#! /usr/bin/tclsh

apply {{} {
  # configure
  set folder robin
  set postdoc egretta.tcl
  set pathway [file nativename [file join $folder $postdoc]]

  file mkdir $folder

  if ![file isdirectory $folder] {
    puts stderr "$folder not created"
    exit 1
  }

  # truncation
  set capsule $pathway
  set chandle [open $capsule w]
  set content {}
  puts -nonewline $chandle $content
  flush $chandle
  close $chandle

  if ![file isfile $pathway] {
    puts stderr "$pathway not created"
    exit 1
  }

  # shebang header
  set capsule $pathway
  set chandle [open $capsule w]
  puts $chandle "#! /usr/bin/env tclsh\n"
  flush $chandle
  close $chandle

  set capsule estrilda.tcl
  set chandle [open $capsule r]
  set content [read $chandle]
  close $chandle

  # append content
  set capsule $pathway
  set chandle [open $capsule a]
  puts $chandle $content
  flush $chandle
  close $chandle

  set capsule ploceus.tcl
  set chandle [open $capsule r]
  set content [read $chandle]
  close $chandle

  # append content
  set capsule $pathway
  set chandle [open $capsule a]
  puts $chandle $content
  flush $chandle
  close $chandle

  set capsule sturnus.tcl
  set chandle [open $capsule r]
  set content [read $chandle]
  close $chandle

  # append content
  set capsule $pathway
  set chandle [open $capsule a]
  puts $chandle $content
  flush $chandle
  close $chandle

  set capsule syrinx.tcl
  set chandle [open $capsule r]
  set content [read $chandle]
  close $chandle

  # split content lines to list
  set splines [split $content "\n"]

  # append content
  set capsule $pathway
  set chandle [open $capsule a]

  foreach recline [lrange $splines 19 end] {
    puts $chandle $recline
    flush $chandle
  }
  close $chandle

  set capsule tyranni.tcl
  set chandle [open $capsule r]
  set content [read $chandle]
  close $chandle

  # split content lines to list
  set splines [split $content "\n"]

  # append content
  set capsule $pathway
  set chandle [open $capsule a]

  foreach recline [lrange $splines 19 end] {
    puts $chandle $recline
    flush $chandle
  }
  if {[catch {close $chandle} anomaly]} {
      puts "$capsule failure: $anomaly"
  }

  file attributes $pathway -permissions u+x

  # cleanup
  unset anomaly capsule chandle content folder pathway postdoc recline splines
}}

