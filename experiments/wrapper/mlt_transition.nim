## *
##  \file mlt_transition.h
##  \brief abstraction for all transition services
##  \see mlt_transition_s
##
##  Copyright (C) 2003-2015 Meltytech, LLC
##
##  This library is free software; you can redistribute it and/or
##  modify it under the terms of the GNU Lesser General Public
##  License as published by the Free Software Foundation; either
##  version 2.1 of the License, or (at your option) any later version.
##
##  This library is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
##  Lesser General Public License for more details.
##
##  You should have received a copy of the GNU Lesser General Public
##  License along with this library; if not, write to the Free Software
##  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
##

## * \brief Transition abstract service class
##
##  A transition may modify the output of a producer based on the output of a second producer.
##
##  \extends mlt_service_s
##  \properties \em a_track the track index (0-based) of a multitrack of the first producer
##  \properties \em b_track the track index (0-based) of a multitrack of the second producer
##  \properties \em accepts_blanks a flag to indicate if the transition should accept blank frames
##  \properties \em always_active a flag to indicate that the in and out points do not apply
##  \properties \em _transition_type 1 for video, 2 for audio, 3 for both audio and video
##  \properties \em disable Set this to disable the transition while keeping it in the object model.
##

type
  TransitionS* {.importc: "mlt_transition_s", header: "mlt_transition.h", bycopy.} = object
    parent* {.importc: "parent".}: ServiceS ## * We're implementing service here
    ## * public virtual
    close* {.importc: "close".}: proc (a1: Transition) {.cdecl.} ## * protected transition method
    process* {.importc: "process".}: proc (a1: Transition; a2: Frame; a3: Frame): Frame {.
        cdecl.}               ## * Protected
    child* {.importc: "child".}: pointer ## * track and in/out points
    producer* {.importc: "producer".}: Service ## * Private
    frames* {.importc: "frames".}: ptr Frame
    held* {.importc: "held".}: cint


template mlt_Transition_Service*(transition: untyped): untyped =
  (addr((transition).parent))

template mlt_Transition_Properties*(transition: untyped): untyped =
  mlt_Service_Properties(mlt_Transition_Service(transition))

proc transitionInit*(self: Transition; child: pointer): cint {.cdecl,
    importc: "mlt_transition_init", dynlib: mltlib.}
proc transitionNew*(): Transition {.cdecl, importc: "mlt_transition_new",
                                 dynlib: mltlib.}
proc transitionService*(self: Transition): Service {.cdecl,
    importc: "mlt_transition_service", dynlib: mltlib.}
proc transitionProperties*(self: Transition): Properties {.cdecl,
    importc: "mlt_transition_properties", dynlib: mltlib.}
proc transitionConnect*(self: Transition; producer: Service; aTrack: cint; bTrack: cint): cint {.
    cdecl, importc: "mlt_transition_connect", dynlib: mltlib.}
proc transitionSetInAndOut*(self: Transition; `in`: Position; `out`: Position) {.cdecl,
    importc: "mlt_transition_set_in_and_out", dynlib: mltlib.}
proc transitionSetTracks*(self: Transition; aTrack: cint; bTrack: cint) {.cdecl,
    importc: "mlt_transition_set_tracks", dynlib: mltlib.}
proc transitionGetATrack*(self: Transition): cint {.cdecl,
    importc: "mlt_transition_get_a_track", dynlib: mltlib.}
proc transitionGetBTrack*(self: Transition): cint {.cdecl,
    importc: "mlt_transition_get_b_track", dynlib: mltlib.}
proc transitionGetIn*(self: Transition): Position {.cdecl,
    importc: "mlt_transition_get_in", dynlib: mltlib.}
proc transitionGetOut*(self: Transition): Position {.cdecl,
    importc: "mlt_transition_get_out", dynlib: mltlib.}
proc transitionGetLength*(self: Transition): Position {.cdecl,
    importc: "mlt_transition_get_length", dynlib: mltlib.}
proc transitionGetPosition*(self: Transition; frame: Frame): Position {.cdecl,
    importc: "mlt_transition_get_position", dynlib: mltlib.}
proc transitionGetProgress*(self: Transition; frame: Frame): cdouble {.cdecl,
    importc: "mlt_transition_get_progress", dynlib: mltlib.}
proc transitionGetProgressDelta*(self: Transition; frame: Frame): cdouble {.cdecl,
    importc: "mlt_transition_get_progress_delta", dynlib: mltlib.}
proc transitionProcess*(self: Transition; aFrame: Frame; bFrame: Frame): Frame {.cdecl,
    importc: "mlt_transition_process", dynlib: mltlib.}
proc transitionClose*(self: Transition) {.cdecl, importc: "mlt_transition_close",
                                       dynlib: mltlib.}