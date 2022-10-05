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

search example

    tclsh syrinx.tcl 56

screenful view

    tclsh syrinx.tcl eadgbe flock | sensible-pager

Tcl interactive

    tclsh

:

    string cat $tcl_platform(engine) $tcl_patchLevel

:

    source estrilda.tcl; source ploceus.tcl

:

    Estrilda::signboard {}

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

    Estrilda::signboard [lsearch -all -inline $clefs *k?]

:

    set sign j23k6; set crow $Estrilda::oscines($sign)

:

    Ploceus::fingerboard $sign $crow $harp

:

    exit

---

### Distribution
MIT License

