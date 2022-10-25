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

Evaluate contents of estrilda.tcl as a script.

    source estrilda.tcl

Estrilda::oscines holds an array of key-value pairs.

    parray Estrilda::oscines

Retrieve keys signs and store them in a list.

    set clefs [array names Estrilda::oscines]

Estrilda::signboard takes a list argument  
and prints the contents formatted to screen.

    Estrilda::signboard $clefs

Estrilda::research takes two arguments;  
The first is a list to be searched through  
and the second is a pattern to search for.

    Estrilda::research $clefs {j?k*[xy]}

Estrilda::correlate takes two arguments;  
The first is a pattern to search for  
and the second is a boolean switch.

    Estrilda::correlate HgAu true

Transition from metallic symbols is default.

    Estrilda::correlate vu false

Retrieve the string value of selected key sign.

    set harminor $Estrilda::oscines(j36)

Evaluate contents of ploceus.tcl as a script.

    source ploceus.tcl

Ploceus::machines holds a list of tunings.

    puts $Ploceus::machines

Assignment composition of key and tuning.

    set sign n0; set harp eadgbe

Retrieve the string value of selected key sign.

    set crow $Estrilda::oscines($sign)

Ploceus::fingerboard takes three arguments;  
The first is the sign denoting accidentals,  
the second is the string value retrieved,  
and the third is the selected tuning.

    Ploceus::fingerboard $sign $crow $harp

Ploceus::metallic stores a boolean value.

    set Ploceus::metallic true

This switch facilitates symbolic transition.

    Ploceus::fingerboard $sign $crow $harp

Evaluate contents of syrinx.tcl as a script.

    source syrinx.tcl

Syrinx::compendia takes two arguments;  
The 1st being the selected instrument tuning,  
and the 2nd is a list containing key signs.

    Syrinx::compendia cgdae $clefs

Syrinx::atrium is the main entry point;  
Taking a list argument of which the 1st  
item is the selected instrument tuning  
and the remaining items are key signs.

    Syrinx::atrium {cgdae j3 j6 j2 j23}

Syrinx::atrium with no arguments prints  
a formatted menu of keys signs to screen.

    Syrinx::atrium

Leave the interactive environment.

    exit

---

### Distribution
MIT License

