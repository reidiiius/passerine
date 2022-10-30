
namespace eval ::Ploceus {

  namespace export *

  variable machines
  variable metallic
  variable sequence
  variable tributes
  variable utensils

  # instrument tunings
  set machines {beadgcf bfbfb cgdae eadgbe fkbjdn}

  # configure digraphs
  set metallic false

  # current time as integer
  set sequence [clock milliseconds]

  # stack state buffers
  array set tributes {
    sign ""
    crow ""
    harp ""
    pegs {}
  }

  # elemental field indices
  array set utensils {
    Cn 0
    Ck 5
    Dj 5
    Dn 10
    Dk 15
    Ej 15
    En 20
    Fn 25
    Fk 30
    Gj 30
    Gn 35
    Gk 40
    Aj 40
    An 45
    Ak 50
    Bj 50
    Bn 55
  }

  # tail name of current qualified namespace
  proc surname {} {
    set curtail [namespace tail [namespace current]]
    return $curtail
  }

  # takes a digraph argument which represents pitch and pairs with
  # an integer value in utensils, the integer acts as a range index
  # to splice and concatenate the copied value from tributes(crow)
  proc monotonic {{pitch Cn}} {
    variable utensils
    variable tributes

    if {[scan $pitch "%c%c" head tail] != 2} then {
      error "invalid pitchfork"
    }
    if {($head < 65) || ($head > 72)} then {
      error "invalid monotone"
    }
    if {($tail < 106) || ($tail > 110)} then {
      error "invalid accidental"
    }
    if {[string length $pitch] > 2} then {
      set pitch [format "%c%c" $head $tail]
    }

    unset head tail

    if [info exists utensils($pitch)] then {
      set wire [string cat [
          string range $tributes(crow) $utensils($pitch) end ] [
          string range $tributes(crow) 0 [expr $utensils($pitch) - 1]
        ]
      ]
    } else {
      set wire [string repeat "____ " 12]
    }

    return $wire
  }

  # takes a digraph argument which represents pitch,
  # depending on the boolean value stored by metallic,
  # latter branch processes return value from monotonic
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

  # dependent values stored in tributes and sequence,
  # format and print key-tuning-serial headline then
  # iterate over pegs passing each pitch to headstock,
  # format and print the return value from headstock
  proc layout {} {
    variable tributes
    variable sequence

    puts [format "\t%s-%s-i%u" $tributes(sign) $tributes(harp) $sequence]
    foreach pitch [lreverse $tributes(pegs)] {
      puts [format "\t%s" [headstock $pitch]]
    }

    return
  }

  # takes two arguments, the first is a key denoting
  # accidentals and the second is a selected tuning,
  # sets the values of tributes then calls layout
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

