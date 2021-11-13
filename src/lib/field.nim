import ../wrapper/mlt
import typs, os, std/strformat


proc plantTransition*(self: Field; that: Transition; a_track, b_track: int) =
  let res = mlt_field_plant_transition(self, that, a_track.cint, b_track.cint)
  if res > 0:
    quit("""unable to plant transition""")

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
proc mlt_field_plant_filter*(self: mlt_field; that: mlt_filter; track: cint): cint {.
    importc, cdecl, impmltDyn.}

proc mlt_field_close*(self: mlt_field) {.importc, cdecl, impmltDyn.}
proc mlt_field_disconnect_service*(self: mlt_field; service: mlt_service) {.
    importc, cdecl, impmltDyn.}
]#