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
  ProducerS* {.importc: "mlt_producer_s", header: "mlt_producer.h", bycopy.} = object
    parent* {.importc: "parent".}: ServiceS ## * A producer is a service.
    ## * Get a frame of data (virtual function).
    ##
    ##  \param mlt_producer a producer
    ##  \param mlt_frame_ptr a frame pointer by reference
    ##  \param int an index
    ##  \return true if there was an error
    ##
    getFrame* {.importc: "get_frame".}: proc (a1: Producer; a2: ptr Frame; a3: cint): cint {.
        cdecl.} ## * Seek to a specified position (virtual function).
               ##
               ##  \param mlt_producer a producer
               ##  \param position set the "play head" position of the producer
               ##  \return false
               ##
    seek* {.importc: "seek".}: proc (a1: Producer; a2: Position): cint {.cdecl.} ## * Set the in and out points.
                                                                       ##
                                                                       ##  \param
                                                                       ## mlt_producer a producer
                                                                       ##  \param
                                                                       ## mlt_position the relative starting time; a negative value is the same as 0
                                                                       ##  \param
                                                                       ## mlt_position the relative ending time; a negative value is the same as length - 1
                                                                       ##  \return false
                                                                       ##
    setInAndOut* {.importc: "set_in_and_out".}: proc (a1: Producer; a2: Position;
        a3: Position): cint {.cdecl.} ## * the destructor virtual function
    close* {.importc: "close".}: Destructor
    closeObject* {.importc: "close_object".}: pointer ## *< the object supplied to the close virtual function
    local* {.importc: "local".}: pointer ## *< \private instance object
    child* {.importc: "child".}: pointer ## *< \private the object of a subclass


##
##   Public final methods
##

template mlt_Producer_Service*(producer: untyped): untyped =
  (addr((producer).parent))

template mlt_Producer_Properties*(producer: untyped): untyped =
  mlt_Service_Properties(mlt_Producer_Service(producer))

proc producerInit*(self: Producer; child: pointer): cint {.cdecl,
    importc: "mlt_producer_init", dynlib: mltlib.}
proc producerNew*(a1: Profile): Producer {.cdecl, importc: "mlt_producer_new",
                                       dynlib: mltlib.}
proc producerService*(self: Producer): Service {.cdecl,
    importc: "mlt_producer_service", dynlib: mltlib.}
proc producerProperties*(self: Producer): Properties {.cdecl,
    importc: "mlt_producer_properties", dynlib: mltlib.}
proc producerSeek*(self: Producer; position: Position): cint {.cdecl,
    importc: "mlt_producer_seek", dynlib: mltlib.}
proc producerSeekTime*(self: Producer; time: cstring): cint {.cdecl,
    importc: "mlt_producer_seek_time", dynlib: mltlib.}
proc producerPosition*(self: Producer): Position {.cdecl,
    importc: "mlt_producer_position", dynlib: mltlib.}
proc producerFrame*(self: Producer): Position {.cdecl, importc: "mlt_producer_frame",
    dynlib: mltlib.}
proc producerFrameTime*(self: Producer; a2: TimeFormat): cstring {.cdecl,
    importc: "mlt_producer_frame_time", dynlib: mltlib.}
proc producerSetSpeed*(self: Producer; speed: cdouble): cint {.cdecl,
    importc: "mlt_producer_set_speed", dynlib: mltlib.}
proc producerGetSpeed*(self: Producer): cdouble {.cdecl,
    importc: "mlt_producer_get_speed", dynlib: mltlib.}
proc producerGetFps*(self: Producer): cdouble {.cdecl,
    importc: "mlt_producer_get_fps", dynlib: mltlib.}
proc producerSetInAndOut*(self: Producer; `in`: Position; `out`: Position): cint {.
    cdecl, importc: "mlt_producer_set_in_and_out", dynlib: mltlib.}
proc producerClear*(self: Producer): cint {.cdecl, importc: "mlt_producer_clear",
                                        dynlib: mltlib.}
proc producerGetIn*(self: Producer): Position {.cdecl,
    importc: "mlt_producer_get_in", dynlib: mltlib.}
proc producerGetOut*(self: Producer): Position {.cdecl,
    importc: "mlt_producer_get_out", dynlib: mltlib.}
proc producerGetPlaytime*(self: Producer): Position {.cdecl,
    importc: "mlt_producer_get_playtime", dynlib: mltlib.}
proc producerGetLength*(self: Producer): Position {.cdecl,
    importc: "mlt_producer_get_length", dynlib: mltlib.}
proc producerGetLengthTime*(self: Producer; a2: TimeFormat): cstring {.cdecl,
    importc: "mlt_producer_get_length_time", dynlib: mltlib.}
proc producerPrepareNext*(self: Producer) {.cdecl,
    importc: "mlt_producer_prepare_next", dynlib: mltlib.}
proc producerAttach*(self: Producer; filter: Filter): cint {.cdecl,
    importc: "mlt_producer_attach", dynlib: mltlib.}
proc producerDetach*(self: Producer; filter: Filter): cint {.cdecl,
    importc: "mlt_producer_detach", dynlib: mltlib.}
proc producerFilter*(self: Producer; index: cint): Filter {.cdecl,
    importc: "mlt_producer_filter", dynlib: mltlib.}
proc producerCut*(self: Producer; `in`: cint; `out`: cint): Producer {.cdecl,
    importc: "mlt_producer_cut", dynlib: mltlib.}
proc producerIsCut*(self: Producer): cint {.cdecl, importc: "mlt_producer_is_cut",
                                        dynlib: mltlib.}
proc producerIsMix*(self: Producer): cint {.cdecl, importc: "mlt_producer_is_mix",
                                        dynlib: mltlib.}
proc producerIsBlank*(self: Producer): cint {.cdecl,
    importc: "mlt_producer_is_blank", dynlib: mltlib.}
proc producerCutParent*(self: Producer): Producer {.cdecl,
    importc: "mlt_producer_cut_parent", dynlib: mltlib.}
proc producerOptimise*(self: Producer): cint {.cdecl,
    importc: "mlt_producer_optimise", dynlib: mltlib.}
proc producerClose*(self: Producer) {.cdecl, importc: "mlt_producer_close",
                                   dynlib: mltlib.}
proc producerGetCreationTime*(self: Producer): int {.cdecl,
    importc: "mlt_producer_get_creation_time", dynlib: mltlib.}
proc producerSetCreationTime*(self: Producer; creationTime: int) {.cdecl,
    importc: "mlt_producer_set_creation_time", dynlib: mltlib.}