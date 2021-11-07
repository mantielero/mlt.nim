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
  mlt_producer

## * \brief Track class used by mlt_multitrack_s
##

type
  mlt_track_s* {.bycopy.} = object
    producer*: mlt_producer
    event*: mlt_event

  mlt_track* = ptr mlt_track_s

## * \brief Multitrack class
##
##  A multitrack is a parallel container of producers that acts a single producer.
##
##  \extends mlt_producer_s
##  \properties \em log_id not currently used, but sets it to "mulitrack"
##

type
  mlt_multitrack_s* {.bycopy.} = object
    parent*: mlt_producer_s    ## * We're extending producer here
    list*: ptr mlt_track
    size*: cint
    count*: cint


template MLT_MULTITRACK_PRODUCER*(multitrack: untyped): untyped =
  (addr((multitrack).parent))

template MLT_MULTITRACK_SERVICE*(multitrack: untyped): untyped =
  MLT_PRODUCER_SERVICE(MLT_MULTITRACK_PRODUCER(multitrack))

template MLT_MULTITRACK_PROPERTIES*(multitrack: untyped): untyped =
  MLT_SERVICE_PROPERTIES(MLT_MULTITRACK_SERVICE(multitrack))

proc mlt_multitrack_init*(): mlt_multitrack {.cdecl, importc: "mlt_multitrack_init",
    dynlib: libName.}
proc mlt_multitrack_producer*(self: mlt_multitrack): mlt_producer {.cdecl,
    importc: "mlt_multitrack_producer", dynlib: libName.}
proc mlt_multitrack_service*(self: mlt_multitrack): mlt_service {.cdecl,
    importc: "mlt_multitrack_service", dynlib: libName.}
proc mlt_multitrack_properties*(self: mlt_multitrack): mlt_properties {.cdecl,
    importc: "mlt_multitrack_properties", dynlib: libName.}
proc mlt_multitrack_connect*(self: mlt_multitrack; producer: mlt_producer;
                            track: cint): cint {.cdecl,
    importc: "mlt_multitrack_connect", dynlib: libName.}
proc mlt_multitrack_insert*(self: mlt_multitrack; producer: mlt_producer; track: cint): cint {.
    cdecl, importc: "mlt_multitrack_insert", dynlib: libName.}
proc mlt_multitrack_disconnect*(self: mlt_multitrack; track: cint): cint {.cdecl,
    importc: "mlt_multitrack_disconnect", dynlib: libName.}
proc mlt_multitrack_clip*(self: mlt_multitrack; whence: mlt_whence; index: cint): mlt_position {.
    cdecl, importc: "mlt_multitrack_clip", dynlib: libName.}
proc mlt_multitrack_close*(self: mlt_multitrack) {.cdecl,
    importc: "mlt_multitrack_close", dynlib: libName.}
proc mlt_multitrack_count*(self: mlt_multitrack): cint {.cdecl,
    importc: "mlt_multitrack_count", dynlib: libName.}
proc mlt_multitrack_refresh*(self: mlt_multitrack) {.cdecl,
    importc: "mlt_multitrack_refresh", dynlib: libName.}
proc mlt_multitrack_track*(self: mlt_multitrack; track: cint): mlt_producer {.cdecl,
    importc: "mlt_multitrack_track", dynlib: libName.}