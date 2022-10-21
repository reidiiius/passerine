# Passerine
Ornithography

---

### Download

    git clone https://github.com/reidiiius/passerine.git

---

### Usage
command-line

    cd passerine/

Tcl8.6.10

    tclsh syrinx.tcl

:

    tclsh syrinx.tcl help

:

    tclsh syrinx.tcl eadgbe n0 j3

search examples

    tclsh syrinx.tcl 56

:

    tclsh syrinx.tcl yq

screenful view

    tclsh syrinx.tcl eadgbe flock | sensible-pager

Tcl interactive

    tclsh

:

    string cat $tcl_platform(engine) $tcl_patchLevel

:

    source estrilda.tcl; source ploceus.tcl

:

    Estrilda::signboard

:

    foreach tuned $Ploceus::machines { puts $tuned }

:

    set sign n0; set harp eadgbe

:

    set crow $Estrilda::oscines($sign)

:

    Ploceus::fingerboard $sign $crow $harp

:

    set clefs [lsort [array names Estrilda::oscines]]

:

    Estrilda::research $clefs *k?

:

    Estrilda::correlate wt 0

:

    Estrilda::correlate PbSn 1

:

    set sign j23k6; set crow $Estrilda::oscines($sign)

:

    Ploceus::fingerboard $sign $crow $harp

:

    source syrinx.tcl

:

    Syrinx::dateline

:

    Syrinx::compendia cgdae {n0 k6}

:

    Syrinx::atrium {cgdae j3 j6 j2 j23}

:

    Syrinx::atrium

:

    puts $Ploceus::machines

:

    exit

---

### Distribution
MIT License

