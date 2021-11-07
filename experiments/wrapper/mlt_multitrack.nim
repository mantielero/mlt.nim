## *
##  \file mlt_multitrack.h
##  \brief multitrack service class
##  \see mlt_multitrack_s
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

## * \brief Track class used by mlt_multitrack_s
##

type
  TrackS* {.importc: "mlt_track_s", header: "mlt_multitrack.h", bycopy.} = object
    producer* {.importc: "producer".}: Producer
    event* {.importc: "event".}: Event

  Track* = ptr TrackS

## * \brief Multitrack class
##
##  A multitrack is a parallel container of producers that acts a single producer.
##
##  \extends mlt_producer_s
##  \properties \em log_id not currently used, but sets it to "mulitrack"
##

type
  MultiTrackS* {.importc: "mlt_multitrack_s", header: "mlt_multitrack.h", bycopy.} = object
    parent* {.importc: "parent".}: ProducerS ## * We're extending producer here
    list* {.importc: "list".}: ptr Track
    size* {.importc: "size".}: cint
    count* {.importc: "count".}: cint


template mlt_Multitrack_Producer*(multitrack: untyped): untyped =
  (addr((multitrack).parent))

template mlt_Multitrack_Service*(multitrack: untyped): untyped =
  mlt_Producer_Service(mlt_Multitrack_Producer(multitrack))

template mlt_Multitrack_Properties*(multitrack: untyped): untyped =
  mlt_Service_Properties(mlt_Multitrack_Service(multitrack))

proc multitrackInit*(): Multitrack {.cdecl, importc: "mlt_multitrack_init",
                                  dynlib: mltlib.}
proc multitrackProducer*(self: Multitrack): Producer {.cdecl,
    importc: "mlt_multitrack_producer", dynlib: mltlib.}
proc multiTrackService*(self: Multitrack): Service {.cdecl,
    importc: "mlt_multitrack_service", dynlib: mltlib.}
proc multitrackProperties*(self: Multitrack): Properties {.cdecl,
    importc: "mlt_multitrack_properties", dynlib: mltlib.}
proc multitrackConnect*(self: Multitrack; producer: Producer; track: cint): cint {.
    cdecl, importc: "mlt_multitrack_connect", dynlib: mltlib.}
proc multitrackInsert*(self: Multitrack; producer: Producer; track: cint): cint {.cdecl,
    importc: "mlt_multitrack_insert", dynlib: mltlib.}
proc multitrackDisconnect*(self: Multitrack; track: cint): cint {.cdecl,
    importc: "mlt_multitrack_disconnect", dynlib: mltlib.}
proc multitrackClip*(self: Multitrack; whence: Whence; index: cint): Position {.cdecl,
    importc: "mlt_multitrack_clip", dynlib: mltlib.}
proc multitrackClose*(self: Multitrack) {.cdecl, importc: "mlt_multitrack_close",
                                       dynlib: mltlib.}
proc multitrackCount*(self: Multitrack): cint {.cdecl,
    importc: "mlt_multitrack_count", dynlib: mltlib.}
proc multitrackRefresh*(self: Multitrack) {.cdecl,
    importc: "mlt_multitrack_refresh", dynlib: mltlib.}
proc multitrackTrack*(self: Multitrack; track: cint): Producer {.cdecl,
    importc: "mlt_multitrack_track", dynlib: mltlib.}