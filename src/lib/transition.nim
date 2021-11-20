import ../wrapper/mlt
import typs, os, std/strformat


proc close*(self:Transition) =
  mlt_transition_close(self.data)


converter toProperties*(self:Transition):Properties =
  result.data = mlt_transition_properties(self.data)

#[
proc mlt_transition_init*(self: mlt_transition; child: pointer): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_new*(): mlt_transition {.importc, cdecl, impmltDyn.}
proc mlt_transition_service*(self: mlt_transition): mlt_service {.importc,
    cdecl, impmltDyn.}

proc mlt_transition_connect*(self: mlt_transition; producer: mlt_service;
                             a_track: cint; b_track: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_set_in_and_out*(self: mlt_transition; `in`: mlt_position;
                                    `out`: mlt_position) {.importc, cdecl,
    impmltDyn.}
proc mlt_transition_set_tracks*(self: mlt_transition; a_track: cint;
                                b_track: cint) {.importc, cdecl, impmltDyn.}
proc mlt_transition_get_a_track*(self: mlt_transition): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_transition_get_b_track*(self: mlt_transition): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_transition_get_in*(self: mlt_transition): mlt_position {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_get_out*(self: mlt_transition): mlt_position {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_get_length*(self: mlt_transition): mlt_position {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_get_position*(self: mlt_transition; frame: mlt_frame): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_transition_get_progress*(self: mlt_transition; frame: mlt_frame): cdouble {.
    importc, cdecl, impmltDyn.}
proc mlt_transition_get_progress_delta*(self: mlt_transition; frame: mlt_frame): cdouble {.
    importc, cdecl, impmltDyn.}
proc mlt_transition_process*(self: mlt_transition; a_frame: mlt_frame;
                             b_frame: mlt_frame): mlt_frame {.importc, cdecl,
    impmltDyn.}
  
]#