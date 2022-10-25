# Passerine
Ornithography

---

### Download

    git clone https://github.com/reidiiius/passerine.git

---

### Usage
Command-line interface

    cd passerine/

Print formatted menu of key signs.

    tclsh syrinx.tcl

Print available tunings with example.

    tclsh syrinx.tcl help

First argument denotes instrument tuning,  
consecutive arguments portray key signs.

    tclsh syrinx.tcl eadgbe n0 j3

Numerical search through keys.

    tclsh syrinx.tcl 56

Alphabetic search through values.

    tclsh syrinx.tcl yq

Print all and pipe through terminal pager.

    tclsh syrinx.tcl eadgbe flock | sensible-pager

Tcl interactive session

    tclsh

Evaluate contents of estrilda.tcl as a script.

    source estrilda.tcl

Estrilda::oscines holds an array of key-value pairs.

    parray Estrilda::oscines

Retrieve keys signs and store them in a sorted list.

    set clefs [lsort [array names Estrilda::oscines]]

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

Estrilda::transits is a list of substring pairs.

    set pairs $Estrilda::transits

Replace substrings in harminor based on pairs.

    string map $pairs $harminor

Evaluate contents of ploceus.tcl as a script.

    source ploceus.tcl

Ploceus::machines holds a list of tunings.

    foreach tuned $Ploceus::machines {puts $tuned}

Assignment composition of key and tuning.

    set sign n0; set harp eadgbe

Ploceus::sequence holds the current time as an integer  
which represents seconds milliseconds or microseconds.

    set Ploceus::sequence [clock milliseconds]

Retrieve and store string value of selected key sign.

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

Ploceus::tributes holds state set by fingerboard call.

    parray Ploceus::tributes

Ploceus::utensils stores mapping of pitch to numeric indices  
used by string range tunings held in Ploceus::tributes(pegs)

    parray Ploceus::utensils

Ploceus::headstock takes an argument which represents pitch  
and returns an altered string from Ploceus::tributes(crow)

    Ploceus::headstock En

Toggle betwixt cloaks by flipping Ploceus::metallic boolean.

    set Ploceus::metallic false

Ploceus::concord provides the ability of transposition.

    set crow [Ploceus::concord Bj]

Call fingerboard to updated state and print to screen.

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

    Syrinx::atrium {beadgcf n0 k6 j3 j6 j2}

Syrinx::atrium with no arguments prints  
a formatted menu of keys signs to screen.

    Syrinx::atrium

Leave the interactive environment.

    exit

---

### Distribution
MIT License

