##[
The field is a convenience class that works with the tractor and multitrack classes to manage track filters and transitions.
]##
import ../wrapper/mlt
import typs, os, std/strformat


proc plant*(self: Field; that: Transition; a_track, b_track: int) =
  ##[
  Plant a transition.
  ]##
  let res = mlt_field_plant_transition(self.data, that.data, a_track.cint, b_track.cint)
  if res > 0:
    quit("""unable to plant transition""")

proc plant*(self: Field; that: Filter; track: int) =
  ##[
  Plant a filter.
  ]##
  let res = mlt_field_plant_filter(self.data, that.data, track.cint)
  if res > 0:
    quit("""unable to plant filter""")


proc close*(self: Field) =
  mlt_field_close(self.data)

#[
proc mlt_field_init*(): mlt_field {.importc, cdecl, impmltDyn.}
proc mlt_field_new*(multitrack: mlt_multitrack; tractor: mlt_tractor): mlt_field {.
    importc, cdecl, impmltDyn.}
proc mlt_field_service*(self: mlt_field): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_field_tractor*(self: mlt_field): mlt_tractor {.importc, cdecl,
    impmltDyn.}
proc mlt_field_multitrack*(self: mlt_field): mlt_multitrack {.importc, cdecl,
    impmltDyn.}

proc mlt_field_properties*(self: mlt_field): mlt_properties {.importc, cdecl,
    impmltDyn.}


proc mlt_field_disconnect_service*(self: mlt_field; service: mlt_service) {.
    importc, cdecl, impmltDyn.}
]#