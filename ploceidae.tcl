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

  set circa [clock milliseconds]

  proc headstock {str peg} {
    set tran {
      __ _ Ag s Au u Cu r Fe q Hg v Mn p Np y Pb w Pu z Sn t Ti o Ur x
    }
    return [
      string map $tran [
        concat [string range $str $peg end] [
          string range $str 0 [expr $peg - 1]
        ]
      ]
    ]
  }

  proc layout {kid oud circa str tuned} {
    puts "\n"
    puts [format "\t%s-%s-i%u" $kid $oud $circa]
    foreach pitch $tuned {
      puts [format "\t%s" [headstock $str $pitch]]
    }
    puts "\n"
  }

  switch $oud {
    beadgcf {
      set tuned [lreverse "$Bn $En $An $Dn $Gn $Cn $Fn"]
      layout $kid $oud $circa $str $tuned
    }
    bfbfb {
      set tuned "$Bn $Fn $Bn $Fn $Bn"
      layout $kid $oud $circa $str $tuned
    }
    cgdae {
      set tuned [lreverse "$Cn $Gn $Dn $An $En"]
      layout $kid $oud $circa $str $tuned
    }
    eadgbe {
      set tuned [lreverse "$En $An $Dn $Gn $Bn $En"]
      layout $kid $oud $circa $str $tuned
    }
    fkbjdn {
      set tuned [lreverse "$Fk $Bj $Dn $Fk $Bj $Dn"]
      layout $kid $oud $circa $str $tuned
    }
    default {
      set harp {beadgcf bfbfb cgdae eadgbe fkbjdn}
      set xmpl "tclsh $::argv0 $kid eadgbe"

      puts [
        format "\nTunning:\n\t%s\n\nExample:\n\t%s\n" $harp $xmpl
      ]
      unset harp xmpl
    }
  }

  unset circa Bj Fn Cn Gn Dn An En Bn Fk

}

