## *
##  \file mlt_tractor.h
##  \brief tractor service class
##  \see mlt_tractor_s
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

## * \brief Tractor class
##
##  The tractor is a convenience class that works with the field class
##  to manage a multitrack, track filters, and transitions.
##
##  \extends mlt_producer_s
##  \properties \em multitrack holds a reference to the mulitrack object that a tractor manages
##  \properties \em field holds a reference to the field object that a tractor manages
##  \properties \em producer holds a reference to an encapsulated producer
##  \properties \em global_feed a flag to indicate whether this tractor feeds to the consumer or stops here
##  \properties \em global_queue is something for the data_feed functionality in the core module
##  \properties \em data_queue is something for the data_feed functionality in the core module
##

type
  mlt_tractor_s* {.bycopy.} = object
    parent*: mlt_producer_s
    producer*: mlt_service


template MLT_TRACTOR_PRODUCER*(tractor: untyped): untyped =
  (addr((tractor).parent))

template MLT_TRACTOR_SERVICE*(tractor: untyped): untyped =
  MLT_PRODUCER_SERVICE(MLT_TRACTOR_PRODUCER(tractor))

template MLT_TRACTOR_PROPERTIES*(tractor: untyped): untyped =
  MLT_SERVICE_PROPERTIES(MLT_TRACTOR_SERVICE(tractor))

proc mlt_tractor_init*(): mlt_tractor {.cdecl, importc: "mlt_tractor_init",
                                     dynlib: libName.}
proc mlt_tractor_new*(): mlt_tractor {.cdecl, importc: "mlt_tractor_new",
                                    dynlib: libName.}
proc mlt_tractor_service*(self: mlt_tractor): mlt_service {.cdecl,
    importc: "mlt_tractor_service", dynlib: libName.}
proc mlt_tractor_producer*(self: mlt_tractor): mlt_producer {.cdecl,
    importc: "mlt_tractor_producer", dynlib: libName.}
proc mlt_tractor_properties*(self: mlt_tractor): mlt_properties {.cdecl,
    importc: "mlt_tractor_properties", dynlib: libName.}
proc mlt_tractor_field*(self: mlt_tractor): mlt_field {.cdecl,
    importc: "mlt_tractor_field", dynlib: libName.}
proc mlt_tractor_multitrack*(self: mlt_tractor): mlt_multitrack {.cdecl,
    importc: "mlt_tractor_multitrack", dynlib: libName.}
proc mlt_tractor_connect*(self: mlt_tractor; service: mlt_service): cint {.cdecl,
    importc: "mlt_tractor_connect", dynlib: libName.}
proc mlt_tractor_refresh*(self: mlt_tractor) {.cdecl,
    importc: "mlt_tractor_refresh", dynlib: libName.}
proc mlt_tractor_set_track*(self: mlt_tractor; producer: mlt_producer; index: cint): cint {.
    cdecl, importc: "mlt_tractor_set_track", dynlib: libName.}
proc mlt_tractor_insert_track*(self: mlt_tractor; producer: mlt_producer; index: cint): cint {.
    cdecl, importc: "mlt_tractor_insert_track", dynlib: libName.}
proc mlt_tractor_remove_track*(self: mlt_tractor; index: cint): cint {.cdecl,
    importc: "mlt_tractor_remove_track", dynlib: libName.}
proc mlt_tractor_get_track*(self: mlt_tractor; index: cint): mlt_producer {.cdecl,
    importc: "mlt_tractor_get_track", dynlib: libName.}
proc mlt_tractor_close*(self: mlt_tractor) {.cdecl, importc: "mlt_tractor_close",
    dynlib: libName.}