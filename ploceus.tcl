
namespace eval Ploceus {

  namespace export fingerboard

  variable machines
  variable metallic
  variable sequence
  variable tributes
  variable utensils

  # instrument tunings
  set machines [list beadgcf bfbfb cgdae eadgbe fkbjdn]

  # configure digraphs
  set metallic false

  # current time as integer
  set sequence [clock milliseconds]

  # stack state buffers
  array set tributes {
    sign {}
    crow {}
    harp {}
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

  proc concord {pitch} {
    variable utensils
    variable tributes

    set wire [
      concat [string range $tributes(crow) $utensils($pitch) end] [
        string range $tributes(crow) 0 [expr $utensils($pitch) - 1]
      ]
    ]

    return $wire
  }

  proc headstock {pitch} {
    variable metallic

    if {$metallic} {
      set yarn [concord $pitch]
    } else {
      set trans {
        __ _ Ag s Au u Cu r Fe q Hg v Mn p Np y Pb w Pu z Sn t Ti o Ur x
      }
      set yarn [string map $trans [concord $pitch]]
    }

    return $yarn
  }

  proc layout {} {
    variable tributes
    variable sequence

    puts [format "\t%s-%s-i%u" $tributes(sign) $tributes(harp) $sequence]
    foreach pitch $tributes(pegs) {
      puts [format "\t%s" [headstock $pitch]]
    }

    return
  }

  # from input sets values for layout
  proc fingerboard {sign crow harp} {
    set clef [string length $sign]
    set cols [string length $crow]
    set lute [string length $harp]

    if {$clef < 1 || $clef > 9} {
      set sign z0
    }
    if {$cols < 36 || $cols > 72} {
      set crow [string repeat "____ " 12]
      set harp unison
    }
    if {$lute < 1 || $lute > 16} {
      set harp unison
    }

    unset clef cols lute

    variable tributes
    lset tributes(sign) $sign
    lset tributes(crow) $crow
    lset tributes(harp) $harp

    switch $harp {
      beadgcf {
        lset tributes(pegs) [lreverse {Bn En An Dn Gn Cn Fn}]
      }
      bfbfb {
        lset tributes(pegs) {Bn Fn Bn Fn Bn}
      }
      cgdae {
        lset tributes(pegs) [lreverse {Cn Gn Dn An En}]
      }
      eadgbe {
        lset tributes(pegs) [lreverse {En An Dn Gn Bn En}]
      }
      fkbjdn {
        lset tributes(pegs) [lreverse {Fk Bj Dn Fk Bj Dn}]
      }
      default {
        lset tributes(pegs) [list Cn]
      }
    }

    tailcall layout
  }

} ;# close Ploceus

