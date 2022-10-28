
namespace eval ::Ploceus {

  namespace export *

  variable machines
  variable metallic
  variable sequence
  variable surname
  variable tributes
  variable utensils

  # instrument tunings
  set machines {beadgcf bfbfb cgdae eadgbe fkbjdn}

  # configure digraphs
  set metallic false

  # current time as integer
  set sequence [clock milliseconds]

  # name of current namespace
  set surname [namespace tail [namespace current]]

  # stack state buffers
  array set tributes {
    sign ""
    crow ""
    harp ""
    pegs {}
  }

  # elemental field indices
  array set utensils {
    Bj 50
    Fn 25
    Cn 0
    Gn 35
    Dn 10
    An 45
    En 20
    Bn 55
    Fk 30
  }

  proc monotonic {{pitch Cn}} {
    variable utensils
    variable tributes

    set wire [string cat [
        string range $tributes(crow) $utensils($pitch) end ] [
        string range $tributes(crow) 0 [expr $utensils($pitch) - 1]
      ]
    ]

    return $wire
  }

  proc headstock {{pitch Cn}} {
    variable metallic

    if {$metallic} {
      set yarn [monotonic $pitch]
    } else {
      # substring replacement mapping pairs
      if [namespace exists ::Estrilda] {
        namespace upvar ::Estrilda transits trans
      } else {
        set trans {_ -}
      }

      set yarn [string map $trans [monotonic $pitch]]
    }

    return $yarn
  }

  proc layout {} {
    variable tributes
    variable sequence

    puts [format "\t%s-%s-i%u" $tributes(sign) $tributes(harp) $sequence]
    foreach pitch [lreverse $tributes(pegs)] {
      puts [format "\t%s" [headstock $pitch]]
    }

    return
  }

  # setter for tributes then calls layout
  proc fingerboard {{sign ""} {harp ""}} {
    if [namespace exists ::Estrilda] {
      namespace upvar ::Estrilda oscines bank
    } else {
      puts stderr "\tEstrilda not present!\n"
      exit 1
    }

    if {[info exists bank($sign)]} {
      set crow $bank($sign)
    } else {
      puts "\t$sign ?" 
      return
    }

    set clef [string length $sign]
    set lute [string length $harp]
    set cols [string length $crow]

    if {($clef < 1) || ($clef > 9)} {
      set sign z0
    }
    if {($lute < 1) || ($lute > 16)} {
      set harp unison
    }
    if {($cols < 36) || ($cols > 72)} {
      set crow [string repeat "____ " 12]
      set harp unison
    }

    unset clef cols lute

    variable tributes
    set tributes(sign) $sign
    set tributes(harp) $harp
    set tributes(crow) $crow

    switch $harp {
      beadgcf {
        lset tributes(pegs) {Bn En An Dn Gn Cn Fn}
      }
      bfbfb {
        lset tributes(pegs) {Bn Fn Bn Fn Bn}
      }
      cgdae {
        lset tributes(pegs) {Cn Gn Dn An En}
      }
      eadgbe {
        lset tributes(pegs) {En An Dn Gn Bn En}
      }
      fkbjdn {
        lset tributes(pegs) {Fk Bj Dn Fk Bj Dn}
      }
      default {
        lset tributes(pegs) {Cn}
      }
    }

    tailcall layout
  }

} ;# close Ploceus

