#! /usr/bin/env tclsh

namespace eval ::Rookery {

  # configure
  variable cabinet
  variable pathway
  variable postdoc
  variable section

  set cabinet robin
  set postdoc egretta.tcl
  set pathway [file nativename [file join $cabinet $postdoc]]

  proc transcribe {capsule destiny} {
    if [file exists $capsule] then {
      set chandle [open $capsule r]
      set content [read $chandle]
      close $chandle
    } else {
      puts stderr "$capsule not found"
      exit 1
    }

    # append content
    if [file exists $destiny] then {
      set chapter [open $destiny a]
      puts $chapter $content
      flush $chapter
      close $chapter
    } else {
      puts stderr "$destiny not found"
      exit 1
    }

    unset capsule chandle
    unset chapter content destiny
    return
  }

  proc seditorial {capsule destiny {erasure 0}} {
    if [file exists $capsule] then {
      set chandle [open $capsule r]
      set content [read $chandle]
      close $chandle

      # split content lines to list
      set splines [split $content "\n"]
    } else {
      puts stderr "$capsule not found"
      exit 1
    }

    # append content
    if [file exists $destiny] then {
      set chapter [open $destiny a]

      foreach recline [lrange $splines $erasure end] {
        puts $chapter $recline
      }
      flush $chapter
      close $chapter
    } else {
      puts stderr "$destiny not found"
      exit 1
    }

    unset capsule chandle chapter content
    unset destiny erasure recline splines
    return
  }

  # slurpermit and inscribe docstring
  proc commentate {capsule destiny} {
    if [file exists $capsule] then {
      set chandle [open $capsule r]
      set content [read $chandle]
      close $chandle

      # replace substrings then split content words to list
      set swords [lrange [split [
        string map {"\n\n" "\x20"} $content]] 4 end-1]
    } else {
      puts stderr "$capsule not found"
      exit 1
    }

    # append content
    if [file exists $destiny] then {
      set chapter [open $destiny a]
      set letters 0

      puts $chapter "# \\"
      foreach betoken $swords {
        puts -nonewline $chapter [string cat $betoken "\x20"]
        if {50 < [set letters [expr {$letters + [string length $betoken]}]]
        } then {
          puts $chapter "\\"
          set letters 0
        }
      }
      puts $chapter "\n"
      flush $chapter
      close $chapter
    } else {
      puts stderr "$destiny not found"
      exit 1
    }

    unset betoken capsule chandle chapter
    unset content destiny letters swords
    return
  }

  # make directory and create file or
  # overwrite and truncate existing file
  apply {{folder destiny} {
    file mkdir $folder

    if [file isdirectory $folder] then {
      set chandle [open $destiny w]

      if [file isfile $destiny] then {
        set content {}
        puts -nonewline $chandle $content
      } else {
        puts stderr "$destiny not created"
        exit 1
      }

      flush $chandle
      close $chandle
      unset chandle content
    } else {
      puts stderr "$folder not created"
      exit 1
    }

    unset destiny folder
    return
  }} $cabinet $pathway

  # shebang headline
  apply {{destiny} {
    if [file exists $destiny] then {
      set chandle [open $destiny w]
      set content "#! /usr/bin/env tclsh\n"
      puts $chandle $content
      flush $chandle
      close $chandle

      unset chandle content destiny
    } else {
      puts stderr "$destiny not found"
      exit 1
    }

    return
  }} $pathway

  set section LICENSE.txt
  commentate $section $pathway

  set section estrilda.tcl
  transcribe $section $pathway

  set section ploceus.tcl
  transcribe $section $pathway

  set section sturnus.tcl
  transcribe $section $pathway

  set section syrinx.tcl
  seditorial $section $pathway 20

  set section tyranni.tcl
  seditorial $section $pathway 20

  file attributes $pathway -permissions u+x
  file stat $pathway estates

  puts "\n\tSuccessfully wrote to $pathway\n"
  puts "\tmodified: ${estates(mtime)}"
  puts "\tinodenum: ${estates(ino)}"
  puts "\tmodebits: ${estates(mode)}"
  puts "\tfilesize: ${estates(size)}\n"

  # cleanup
  unset cabinet estates
  unset pathway postdoc section
} ;# close Rookery

