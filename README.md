# Passerine
Ornithography

---

### Download

    git clone https://github.com/reidiiius/passerine.git

---

### Usage
command-line

    cd passerine/

:

    tclsh syrinx.tcl

:

    tclsh syrinx.tcl help

:

    tclsh syrinx.tcl eadgbe n0 j3

search example

    tclsh syrinx.tcl 56

screenful view

    tclsh syrinx.tcl eadgbe flock | sensible-pager

Tcl interactive shell (patchLevel 8.6.10)

    tclsh

:

    source estrilda.tcl; source ploceus.tcl

:

    Estrilda::signboard {}

:

    foreach tuned $Ploceus::machines { puts $tuned }

:

    set harp eadgbe; set sign n0

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

