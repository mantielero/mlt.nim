import ../wrapper/mlt
import typs, os, std/strformat


proc connect*(self: Multitrack; producer: Producer; track: int) =
  let res = mlt_multitrack_connect(self.data, producer.data, track.cint)
  if res > 0:
    quit("""unable to connect multitrack and producer """)  

#[
proc mlt_multitrack_init*(): mlt_multitrack {.importc, cdecl, impmltDyn.}
proc mlt_multitrack_producer*(self: mlt_multitrack): mlt_producer {.importc,
    cdecl, impmltDyn.}
proc mlt_multitrack_service*(self: mlt_multitrack): mlt_service {.importc,
    cdecl, impmltDyn.}
proc mlt_multitrack_properties*(self: mlt_multitrack): mlt_properties {.importc,
    cdecl, impmltDyn.}

proc mlt_multitrack_insert*(self: mlt_multitrack; producer: mlt_producer;
                            track: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_multitrack_disconnect*(self: mlt_multitrack; track: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_multitrack_clip*(self: mlt_multitrack; whence: mlt_whence; index: cint): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_multitrack_close*(self: mlt_multitrack) {.importc, cdecl, impmltDyn.}
proc mlt_multitrack_count*(self: mlt_multitrack): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_multitrack_refresh*(self: mlt_multitrack) {.importc, cdecl, impmltDyn.}
proc mlt_multitrack_track*(self: mlt_multitrack; track: cint): mlt_producer {.
    importc, cdecl, impmltDyn.}    
]#