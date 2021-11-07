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

## * \brief Tractor class
##
##  The tractor is a convenience class that works with the field class
##  to manage a multitrack, track filters, and transitions.
##
##  \extends mlt_producer_s
##  \properties \em multitrack holds a reference to the mulitrack object that a tractor manages
##  \properties \em field holds a reference to the field object that a tractor manages
##  \properties \em producer holds a reference to an encapsulated producer
##

type
  TractorS* {.importc: "mlt_tractor_s", header: "mlt_tractor.h", bycopy.} = object
    parent* {.importc: "parent".}: ProducerS
    producer* {.importc: "producer".}: Service


template mlt_Tractor_Producer*(tractor: untyped): untyped =
  (addr((tractor).parent))

template mlt_Tractor_Service*(tractor: untyped): untyped =
  mlt_Producer_Service(mlt_Tractor_Producer(tractor))

template mlt_Tractor_Properties*(tractor: untyped): untyped =
  mlt_Service_Properties(mlt_Tractor_Service(tractor))

proc tractorInit*(): Tractor {.cdecl, importc: "mlt_tractor_init", dynlib: mltlib.}
proc tractorNew*(): Tractor {.cdecl, importc: "mlt_tractor_new", dynlib: mltlib.}
proc tractorService*(self: Tractor): Service {.cdecl, importc: "mlt_tractor_service",
    dynlib: mltlib.}
proc tractorProducer*(self: Tractor): Producer {.cdecl,
    importc: "mlt_tractor_producer", dynlib: mltlib.}
proc tractorProperties*(self: Tractor): Properties {.cdecl,
    importc: "mlt_tractor_properties", dynlib: mltlib.}
proc tractorField*(self: Tractor): Field {.cdecl, importc: "mlt_tractor_field",
                                       dynlib: mltlib.}
proc tractorMultitrack*(self: Tractor): Multitrack {.cdecl,
    importc: "mlt_tractor_multitrack", dynlib: mltlib.}
proc tractorConnect*(self: Tractor; service: Service): cint {.cdecl,
    importc: "mlt_tractor_connect", dynlib: mltlib.}
proc tractorRefresh*(self: Tractor) {.cdecl, importc: "mlt_tractor_refresh",
                                   dynlib: mltlib.}
proc tractorSetTrack*(self: Tractor; producer: Producer; index: cint): cint {.cdecl,
    importc: "mlt_tractor_set_track", dynlib: mltlib.}
proc tractorInsertTrack*(self: Tractor; producer: Producer; index: cint): cint {.cdecl,
    importc: "mlt_tractor_insert_track", dynlib: mltlib.}
proc tractorRemoveTrack*(self: Tractor; index: cint): cint {.cdecl,
    importc: "mlt_tractor_remove_track", dynlib: mltlib.}
proc tractorGetTrack*(self: Tractor; index: cint): Producer {.cdecl,
    importc: "mlt_tractor_get_track", dynlib: mltlib.}
proc tractorClose*(self: Tractor) {.cdecl, importc: "mlt_tractor_close",
                                 dynlib: mltlib.}