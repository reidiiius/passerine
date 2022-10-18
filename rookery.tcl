#! /usr/bin/env tclsh

namespace eval Rookery {

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

    # slurpermit
    set capsule LICENSE.txt
    set chandle [open $capsule r]
    set content [read $chandle]
    close $chandle

    # split content words to list
    set swords [lrange [split [string map {"\n" { }} $content]] 5 end]
 
    # append content
    set capsule $pathway
    set chandle [open $capsule a]
    set charted 0

    puts $chandle "# \\"
    foreach betoken $swords {
      puts -nonewline $chandle "$betoken "
      if {50 < [set charted [expr {$charted + [string length $betoken]}]]
      } then {
        puts $chandle "\\"
        set charted 0
      }
    }
    puts $chandle "\n"
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
    }
    flush $chandle
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
    }
    flush $chandle
    close $chandle

    file attributes $pathway -permissions u+x
    file stat $pathway estates

    puts "\n\tSuccessfully wrote to $pathway\n"
    puts "\tmodified: ${estates(mtime)}"
    puts "\tinodenum: ${estates(ino)}"
    puts "\tmodebits: ${estates(mode)}"
    puts "\tfilesize: ${estates(size)}\n"

    # cleanup
    unset capsule chandle charted content estates folder
    unset pathway postdoc recline splines swords betoken
}}

} ;# close Rookery

