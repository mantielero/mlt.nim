## *
##  \file mlt_producer.h
##  \brief abstraction for all producer services
##  \see mlt_producer_s
##
##  Copyright (C) 2003-2014 Meltytech, LLC
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
  mlt_service, mlt_filter, mlt_profile

## * \brief Producer abstract service class
##
##  A producer is a service that generates audio, video, and metadata.
##  Some day it may also generate text (subtitles). This is not to say
##  a producer "synthesizes," rather that is an origin of data within the
##  service network - that could be through synthesis or reading a stream.
##
##  \extends mlt_service
##  \event \em producer-changed either service-changed was fired or the timing of the producer changed
##  \properties \em mlt_type the name of the service subclass, e.g. mlt_producer
##  \properties \em mlt_service the name of a producer subclass
##  \properties \em _position the current position of the play head, relative to the in point
##  \properties \em _frame the current position of the play head, relative to the beginning of the resource
##  \properties \em _speed the current speed factor, where 1.0 is normal
##  \properties \em aspect_ratio sample aspect ratio
##  \properties \em length the duration of the cut in frames
##  \properties \em eof the end-of-file behavior, one of: pause, continue, loop
##  \properties \em resource the file name, stream address, or the class name in angle brackets
##  \properties \em _cut set if this producer is a "cut" producer
##  \properties \em mlt_mix stores the data for a "mix" producer
##  \properties \em _cut_parent holds a reference to the cut's parent producer
##  \properties \em ignore_points Set this to temporarily disable the in and out points.
##  \properties \em use_clone holds a reference to a clone's producer, as created by mlt_producer_optimise
##  \properties \em _clone is the index of the clone in the list of clones stored on the clone's producer
##  \properties \em _clones is the number of clones of the producer, as created by mlt_producer_optimise
##  \properties \em _clone.{N} holds a reference to the N'th clone of the producer, as created by mlt_producer_optimise
##  \properties \em meta.* holds metadata - there is a loose taxonomy to be defined
##  \properties \em set.* holds properties to set on a frame produced
##  \envvar \em MLT_DEFAULT_PRODUCER_LENGTH - the default duration of the producer in frames, defaults to 15000.
##  Most producers will set the producer length to something appropriate
##  like the real duration of an audio or video clip. However, some other things
##  like still images and generators do not have an intrinsic length besides one
##  or infinity. Those producers tend to not override the default length and one
##  expect the app or user to set the length. The default value of 15000 was chosen
##  to provide something useful - not too long or short and convenient to simply
##  set an out point without necessarily nedding to extend the length.
##  \todo define the media metadata taxonomy
##

type
  mlt_producer_s* {.bycopy.} = object
    parent*: mlt_service_s     ## * A producer is a service.
    ## * Get a frame of data (virtual function).
    ##
    ##  \param mlt_producer a producer
    ##  \param mlt_frame_ptr a frame pointer by reference
    ##  \param int an index
    ##  \return true if there was an error
    ##
    get_frame*: proc (a1: mlt_producer; a2: mlt_frame_ptr; a3: cint): cint {.cdecl.} ## * the
                                                                           ## destructor
                                                                           ## virtual
                                                                           ## function
    close*: mlt_destructor
    close_object*: pointer     ## *< the object supplied to the close virtual function
    local*: pointer            ## *< \private instance object
    child*: pointer            ## *< \private the object of a subclass


##
##   Public final methods
##

template MLT_PRODUCER_SERVICE*(producer: untyped): untyped =
  (addr((producer).parent))

template MLT_PRODUCER_PROPERTIES*(producer: untyped): untyped =
  MLT_SERVICE_PROPERTIES(MLT_PRODUCER_SERVICE(producer))

proc mlt_producer_init*(self: mlt_producer; child: pointer): cint {.cdecl,
    importc: "mlt_producer_init", dynlib: libName.}
proc mlt_producer_new*(a1: mlt_profile): mlt_producer {.cdecl,
    importc: "mlt_producer_new", dynlib: libName.}
proc mlt_producer_service*(self: mlt_producer): mlt_service {.cdecl,
    importc: "mlt_producer_service", dynlib: libName.}
proc mlt_producer_properties*(self: mlt_producer): mlt_properties {.cdecl,
    importc: "mlt_producer_properties", dynlib: libName.}
proc mlt_producer_seek*(self: mlt_producer; position: mlt_position): cint {.cdecl,
    importc: "mlt_producer_seek", dynlib: libName.}
proc mlt_producer_seek_time*(self: mlt_producer; time: cstring): cint {.cdecl,
    importc: "mlt_producer_seek_time", dynlib: libName.}
proc mlt_producer_position*(self: mlt_producer): mlt_position {.cdecl,
    importc: "mlt_producer_position", dynlib: libName.}
proc mlt_producer_frame*(self: mlt_producer): mlt_position {.cdecl,
    importc: "mlt_producer_frame", dynlib: libName.}
proc mlt_producer_frame_time*(self: mlt_producer; a2: mlt_time_format): cstring {.
    cdecl, importc: "mlt_producer_frame_time", dynlib: libName.}
proc mlt_producer_set_speed*(self: mlt_producer; speed: cdouble): cint {.cdecl,
    importc: "mlt_producer_set_speed", dynlib: libName.}
proc mlt_producer_get_speed*(self: mlt_producer): cdouble {.cdecl,
    importc: "mlt_producer_get_speed", dynlib: libName.}
proc mlt_producer_get_fps*(self: mlt_producer): cdouble {.cdecl,
    importc: "mlt_producer_get_fps", dynlib: libName.}
proc mlt_producer_set_in_and_out*(self: mlt_producer; `in`: mlt_position;
                                 `out`: mlt_position): cint {.cdecl,
    importc: "mlt_producer_set_in_and_out", dynlib: libName.}
proc mlt_producer_clear*(self: mlt_producer): cint {.cdecl,
    importc: "mlt_producer_clear", dynlib: libName.}
proc mlt_producer_get_in*(self: mlt_producer): mlt_position {.cdecl,
    importc: "mlt_producer_get_in", dynlib: libName.}
proc mlt_producer_get_out*(self: mlt_producer): mlt_position {.cdecl,
    importc: "mlt_producer_get_out", dynlib: libName.}
proc mlt_producer_get_playtime*(self: mlt_producer): mlt_position {.cdecl,
    importc: "mlt_producer_get_playtime", dynlib: libName.}
proc mlt_producer_get_length*(self: mlt_producer): mlt_position {.cdecl,
    importc: "mlt_producer_get_length", dynlib: libName.}
proc mlt_producer_get_length_time*(self: mlt_producer; a2: mlt_time_format): cstring {.
    cdecl, importc: "mlt_producer_get_length_time", dynlib: libName.}
proc mlt_producer_prepare_next*(self: mlt_producer) {.cdecl,
    importc: "mlt_producer_prepare_next", dynlib: libName.}
proc mlt_producer_attach*(self: mlt_producer; filter: mlt_filter): cint {.cdecl,
    importc: "mlt_producer_attach", dynlib: libName.}
proc mlt_producer_detach*(self: mlt_producer; filter: mlt_filter): cint {.cdecl,
    importc: "mlt_producer_detach", dynlib: libName.}
proc mlt_producer_filter*(self: mlt_producer; index: cint): mlt_filter {.cdecl,
    importc: "mlt_producer_filter", dynlib: libName.}
proc mlt_producer_cut*(self: mlt_producer; `in`: cint; `out`: cint): mlt_producer {.
    cdecl, importc: "mlt_producer_cut", dynlib: libName.}
proc mlt_producer_is_cut*(self: mlt_producer): cint {.cdecl,
    importc: "mlt_producer_is_cut", dynlib: libName.}
proc mlt_producer_is_mix*(self: mlt_producer): cint {.cdecl,
    importc: "mlt_producer_is_mix", dynlib: libName.}
proc mlt_producer_is_blank*(self: mlt_producer): cint {.cdecl,
    importc: "mlt_producer_is_blank", dynlib: libName.}
proc mlt_producer_cut_parent*(self: mlt_producer): mlt_producer {.cdecl,
    importc: "mlt_producer_cut_parent", dynlib: libName.}
proc mlt_producer_optimise*(self: mlt_producer): cint {.cdecl,
    importc: "mlt_producer_optimise", dynlib: libName.}
proc mlt_producer_close*(self: mlt_producer) {.cdecl, importc: "mlt_producer_close",
    dynlib: libName.}
proc mlt_producer_get_creation_time*(self: mlt_producer): int64_t {.cdecl,
    importc: "mlt_producer_get_creation_time", dynlib: libName.}
proc mlt_producer_set_creation_time*(self: mlt_producer; creation_time: int64_t) {.
    cdecl, importc: "mlt_producer_set_creation_time", dynlib: libName.}