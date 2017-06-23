#!/usr/bin/tclsh

proc FingerBoard {qp str} {

  set Bj 50
  set Fn 25
  set Cn 0
  set Gn 35
  set Dn 10
  set An 45
  set En 20
  set Bn 55
  set Fk 30

  set circa [clock seconds]

  proc headstock {str peg} {
    return [
      concat [string range $str $peg end] [string range $str 0 [expr $peg - 1]]
    ]
  }

  proc beadgcf {qp circa str Fn Cn Gn Dn An En Bn} {
    puts ""
    puts [format "\t%s" "$qp \b-beadgcf- \b$circa"]
    puts [format "\t%s" [headstock $str $Fn]]
    puts [format "\t%s" [headstock $str $Cn]]
    puts [format "\t%s" [headstock $str $Gn]]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $An]]
    puts [format "\t%s" [headstock $str $En]]
    puts [format "\t%s" [headstock $str $Bn]]
    puts ""
  }

  proc bfbfb {qp circa str Fn Bn} {
    puts ""
    puts [format "\t%s" "$qp \b-bfbfb- \b$circa"]
    puts [format "\t%s" [headstock $str $Bn]]
    puts [format "\t%s" [headstock $str $Fn]]
    puts [format "\t%s" [headstock $str $Bn]]
    puts [format "\t%s" [headstock $str $Fn]]
    puts [format "\t%s" [headstock $str $Bn]]
    puts ""
  }

  proc cgdae {qp circa str Cn Gn Dn An En} {
    puts ""
    puts [format "\t%s" "$qp \b-cgdae- \b$circa"]
    puts [format "\t%s" [headstock $str $En]]
    puts [format "\t%s" [headstock $str $An]]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $Gn]]
    puts [format "\t%s" [headstock $str $Cn]]
    puts ""
  }

  proc eadgbe {qp circa str Cn Gn Dn An En Bn} {
    puts ""
    puts [format "\t%s" "$qp \b-eadgbe- \b$circa"]
    puts [format "\t%s" [headstock $str $En]]
    puts [format "\t%s" [headstock $str $Bn]]
    puts [format "\t%s" [headstock $str $Gn]]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $An]]
    puts [format "\t%s" [headstock $str $En]]
    puts ""
  }

  proc fkbjdn {qp circa str Bj Dn Fk} {
    puts ""
    puts [format "\t%s" "$qp \b-fkbjdn- \b$circa"]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $Bj]]
    puts [format "\t%s" [headstock $str $Fk]]
    puts [format "\t%s" [headstock $str $Dn]]
    puts [format "\t%s" [headstock $str $Bj]]
    puts [format "\t%s" [headstock $str $Fk]]
    puts ""
  }

  puts ""

  eadgbe $qp $circa $str $Cn $Gn $Dn $An $En $Bn

  cgdae $qp $circa $str $Cn $Gn $Dn $An $En

#  bfbfb $qp $circa $str $Fn $Bn

#  beadgcf $qp $circa $str $Fn $Cn $Gn $Dn $An $En $Bn

#  fkbjdn $qp $circa $str $Bj $Dn $Fk

  puts ""

  unset circa Bj Fn Cn Gn Dn An En Bn Fk

}

