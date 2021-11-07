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

{.deadCodeElim: on.}
when defined(windows):
  const
    libName* = "mlt.dll"
elif defined(macosx):
  const
    libName* = "libmlt.dylib"
else:
  const
    libName* = "libmlt.so"
import
  mlt_service

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
  mlt_transition_s* {.bycopy.} = object
    parent*: mlt_service_s     ## * We're implementing service here
    ## * public virtual
    close*: proc (a1: mlt_transition) {.cdecl.} ## * protected transition method
    process*: proc (a1: mlt_transition; a2: mlt_frame; a3: mlt_frame): mlt_frame {.cdecl.} ##
                                                                                 ## *
                                                                                 ## Protected
    child*: pointer            ## * track and in/out points
    producer*: mlt_service     ## * Private
    frames*: ptr mlt_frame
    held*: cint


template MLT_TRANSITION_SERVICE*(transition: untyped): untyped =
  (addr((transition).parent))

template MLT_TRANSITION_PROPERTIES*(transition: untyped): untyped =
  MLT_SERVICE_PROPERTIES(MLT_TRANSITION_SERVICE(transition))

proc mlt_transition_init*(self: mlt_transition; child: pointer): cint {.cdecl,
    importc: "mlt_transition_init", dynlib: libName.}
proc mlt_transition_new*(): mlt_transition {.cdecl, importc: "mlt_transition_new",
    dynlib: libName.}
proc mlt_transition_service*(self: mlt_transition): mlt_service {.cdecl,
    importc: "mlt_transition_service", dynlib: libName.}
proc mlt_transition_properties*(self: mlt_transition): mlt_properties {.cdecl,
    importc: "mlt_transition_properties", dynlib: libName.}
proc mlt_transition_connect*(self: mlt_transition; producer: mlt_service;
                            a_track: cint; b_track: cint): cint {.cdecl,
    importc: "mlt_transition_connect", dynlib: libName.}
proc mlt_transition_set_in_and_out*(self: mlt_transition; `in`: mlt_position;
                                   `out`: mlt_position) {.cdecl,
    importc: "mlt_transition_set_in_and_out", dynlib: libName.}
proc mlt_transition_set_tracks*(self: mlt_transition; a_track: cint; b_track: cint) {.
    cdecl, importc: "mlt_transition_set_tracks", dynlib: libName.}
proc mlt_transition_get_a_track*(self: mlt_transition): cint {.cdecl,
    importc: "mlt_transition_get_a_track", dynlib: libName.}
proc mlt_transition_get_b_track*(self: mlt_transition): cint {.cdecl,
    importc: "mlt_transition_get_b_track", dynlib: libName.}
proc mlt_transition_get_in*(self: mlt_transition): mlt_position {.cdecl,
    importc: "mlt_transition_get_in", dynlib: libName.}
proc mlt_transition_get_out*(self: mlt_transition): mlt_position {.cdecl,
    importc: "mlt_transition_get_out", dynlib: libName.}
proc mlt_transition_get_length*(self: mlt_transition): mlt_position {.cdecl,
    importc: "mlt_transition_get_length", dynlib: libName.}
proc mlt_transition_get_position*(self: mlt_transition; frame: mlt_frame): mlt_position {.
    cdecl, importc: "mlt_transition_get_position", dynlib: libName.}
proc mlt_transition_get_progress*(self: mlt_transition; frame: mlt_frame): cdouble {.
    cdecl, importc: "mlt_transition_get_progress", dynlib: libName.}
proc mlt_transition_get_progress_delta*(self: mlt_transition; frame: mlt_frame): cdouble {.
    cdecl, importc: "mlt_transition_get_progress_delta", dynlib: libName.}
proc mlt_transition_process*(self: mlt_transition; a_frame: mlt_frame;
                            b_frame: mlt_frame): mlt_frame {.cdecl,
    importc: "mlt_transition_process", dynlib: libName.}
proc mlt_transition_close*(self: mlt_transition) {.cdecl,
    importc: "mlt_transition_close", dynlib: libName.}