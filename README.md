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

    source estrilda.tcl; Estrilda::surname

Estrilda::oscines holds an array of key-value pairs.

    parray Estrilda::oscines

Retrieve key signs and store them in a sorted list.

    set clefs [lsort [array names Estrilda::oscines]]

Estrilda::signboard takes a list argument of which  
it sorts and prints contents formatted to screen.

    Estrilda::signboard $clefs

Estrilda::research takes two arguments;  
The first is a list to be searched through  
and the second is a pattern to search for.

    Estrilda::research $clefs {j?k*[xy]}

Estrilda::correlate takes two arguments;  
The first is a pattern to search for  
and the second is a boolean switch.

    Estrilda::correlate HgAu true

Boolean false for nonmetallic symbols is default.

    Estrilda::correlate vu false

Retrieve and store string value of selected key sign.

    set harminor $Estrilda::oscines(j36)

Estrilda::transits is a list of substring pairs.

    set pairs $Estrilda::transits

Replace substrings in harminor based on pairs.

    string map $pairs $harminor

Evaluate contents of ploceus.tcl as a script.

    source ploceus.tcl; Ploceus::surname

Ploceus::machines holds a list of tunings.

    foreach tuned $Ploceus::machines {puts $tuned}

Assignment composition of key and tuning.

    set sign n0; set harp eadgbe

Ploceus::sequence holds the current time as an integer  
which represents seconds milliseconds or microseconds.

    set Ploceus::sequence [clock milliseconds]

Ploceus::fingerboard takes two arguments;  
The first is the selected tuning, and the  
second is the key denoting accidentals.

    Ploceus::fingerboard $harp $sign

Ploceus::metallic stores a boolean value.

    set Ploceus::metallic true

This switch facilitates symbolic transition.

    Ploceus::fingerboard $harp $sign

Toggle betwixt cloaks by flipping Ploceus::metallic boolean.

    set Ploceus::metallic false

Ploceus::tributes holds state set by fingerboard call.

    parray Ploceus::tributes

Ploceus::utensils stores mapping of pitch to numeric indices  
used by string range tuners held by Ploceus::tributes(pegs)

    parray Ploceus::utensils

Ploceus::monotonic takes a pitch argument that pairs with a  
numeric value in utensils which will be used as a range index  
to splice and concatenate the copied value of tributes(crow).

    foreach peg [lsort [array names Ploceus::utensils]] {
      puts [string cat $peg: '[Ploceus::monotonic $peg]']
    }

Ploceus::headstock takes an argument which represents pitch and  
returns an altered copy of the value in Ploceus::tributes(crow)

    Ploceus::headstock En

Ploceus::layout takes no arguments but acquires values stored in  
tributes and sequence of which it formats and prints to screen.

    Ploceus::layout

Evaluate contents of syrinx.tcl as a script.

    source syrinx.tcl; Syrinx::surname

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
a formatted menu of key signs to screen.

    Syrinx::atrium

Leave interactive session.

    exit

---

### Distribution
MIT License

