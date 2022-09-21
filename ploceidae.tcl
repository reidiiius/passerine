#!/usr/bin/tclsh

proc FingerBoard {kid str oud} {

  set Bj 50
  set Fn 25
  set Cn 0
  set Gn 35
  set Dn 10
  set An 45
  set En 20
  set Bn 55
  set Fk 30

  set circa [clock microseconds]

  proc headstock {str peg} {
    return [
      concat [string range $str $peg end] [string range $str 0 [expr $peg - 1]]
    ]
  }

  proc beadgcf {kid circa str Fn Cn Gn Dn An En Bn} {
    puts ""
    puts [format "\t%s" "$kid \b-beadgcf-i \b$circa"]
    puts [format "\t%s" [headstock $str $Fn]]
    puts [format "\t%s" [headstock $str $Cn]]
    puts [format "\t%s" [headstock $str $Gn]]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $An]]
    puts [format "\t%s" [headstock $str $En]]
    puts [format "\t%s" [headstock $str $Bn]]
    puts ""
  }

  proc bfbfb {kid circa str Fn Bn} {
    puts ""
    puts [format "\t%s" "$kid \b-bfbfb-i \b$circa"]
    puts [format "\t%s" [headstock $str $Bn]]
    puts [format "\t%s" [headstock $str $Fn]]
    puts [format "\t%s" [headstock $str $Bn]]
    puts [format "\t%s" [headstock $str $Fn]]
    puts [format "\t%s" [headstock $str $Bn]]
    puts ""
  }

  proc cgdae {kid circa str Cn Gn Dn An En} {
    puts ""
    puts [format "\t%s" "$kid \b-cgdae-i \b$circa"]
    puts [format "\t%s" [headstock $str $En]]
    puts [format "\t%s" [headstock $str $An]]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $Gn]]
    puts [format "\t%s" [headstock $str $Cn]]
    puts ""
  }

  proc eadgbe {kid circa str Cn Gn Dn An En Bn} {
    puts ""
    puts [format "\t%s" "$kid \b-eadgbe-i \b$circa"]
    puts [format "\t%s" [headstock $str $En]]
    puts [format "\t%s" [headstock $str $Bn]]
    puts [format "\t%s" [headstock $str $Gn]]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $An]]
    puts [format "\t%s" [headstock $str $En]]
    puts ""
  }

  proc fkbjdn {kid circa str Bj Dn Fk} {
    puts ""
    puts [format "\t%s" "$kid \b-fkbjdn-i \b$circa"]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $Bj]]
    puts [format "\t%s" [headstock $str $Fk]]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $Bj]]
    puts [format "\t%s" [headstock $str $Fk]]
    puts ""
  }

  puts ""

  switch $oud {
    beadgcf {
      $oud $kid $circa $str $Fn $Cn $Gn $Dn $An $En $Bn
    }
    bfbfb {
      $oud $kid $circa $str $Fn $Bn
    }
    cgdae {
      $oud $kid $circa $str $Cn $Gn $Dn $An $En
    }
    eadgbe {
      $oud $kid $circa $str $Cn $Gn $Dn $An $En $Bn
    }
    fkbjdn {
      $oud $kid $circa $str $Bj $Dn $Fk
    }
    default {
      set harp {beadgcf bfbfb cgdae eadgbe fkbjdn}
      set xmpl {tclsh syrinx.tcl n0 eadgbe}

      puts [
        format "Tunning:\n\t%s\n\nExample:\n\t%s" $harp $xmpl
      ]
      unset harp xmpl
    }
  }

  puts ""

  unset circa Bj Fn Cn Gn Dn An En Bn Fk

}

