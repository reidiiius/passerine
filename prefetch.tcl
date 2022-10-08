
# prefetch.tcl

  # initialization
  apply { {dateline} {
    variable songbird
    variable tuners

    if {[namespace exists ::Estrilda]} {
      namespace import ::Estrilda::*
      namespace upvar ::Estrilda oscines temps

      array set songbird [array get temps]
    } else {
      puts stderr "Estrilda absent! $dateline"
      exit 1
    }

    if {[namespace exists ::Ploceus]} {
      namespace import ::Ploceus::fingerboard
      namespace upvar ::Ploceus machines temps

      set tuners $temps
    } else {
      puts stderr "Ploceus absent! $dateline"
      exit 1
    }

    if {[namespace exists ::Sturnus]} {
      namespace import ::Sturnus::*

    } else {
      puts stderr "Sturnus absent! $dateline"
      exit 1
    }
  }} $dateline

