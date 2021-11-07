## *
##  \file mlt_filter.h
##  \brief abstraction for all filter services
##  \see mlt_filter_s
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

## * \brief Filter abstract service class
##
##  A filter is a service that may modify the output of a single producer.
##
##  \extends mlt_service_s
##  \properties \em track the index of the track of a multitrack on which the filter is applied
##  \properties \em service a reference to the service to which this filter is attached.
##  \properties \em disable Set this to disable the filter while keeping it in the object model.
##  Currently this is not cleared when the filter is detached.
##

type
  FilterS* {.importc: "mlt_filter_s", header: "mlt_filter.h", bycopy.} = object
    parent* {.importc: "parent".}: ServiceS ## * We're implementing service here
    ## * public virtual
    close* {.importc: "close".}: proc (a1: Filter) {.cdecl.} ## * protected filter method
    process* {.importc: "process".}: proc (a1: Filter; a2: Frame): Frame {.cdecl.} ## *
                                                                         ## Protected
    child* {.importc: "child".}: pointer


template mlt_Filter_Service*(filter: untyped): untyped =
  (addr((filter).parent))

template mlt_Filter_Properties*(filter: untyped): untyped =
  mlt_Service_Properties(mlt_Filter_Service(filter))

proc filterInit*(self: Filter; child: pointer): cint {.cdecl,
    importc: "mlt_filter_init", dynlib: mltlib.}
proc filterNew*(): Filter {.cdecl, importc: "mlt_filter_new", dynlib: mltlib.}
proc filterService*(self: Filter): Service {.cdecl, importc: "mlt_filter_service",
    dynlib: mltlib.}
proc filterProperties*(self: Filter): Properties {.cdecl,
    importc: "mlt_filter_properties", dynlib: mltlib.}
proc filterProcess*(self: Filter; that: Frame): Frame {.cdecl,
    importc: "mlt_filter_process", dynlib: mltlib.}
proc filterConnect*(self: Filter; producer: Service; index: cint): cint {.cdecl,
    importc: "mlt_filter_connect", dynlib: mltlib.}
proc filterSetInAndOut*(self: Filter; `in`: Position; `out`: Position) {.cdecl,
    importc: "mlt_filter_set_in_and_out", dynlib: mltlib.}
proc filterGetTrack*(self: Filter): cint {.cdecl, importc: "mlt_filter_get_track",
                                       dynlib: mltlib.}
proc filterGetIn*(self: Filter): Position {.cdecl, importc: "mlt_filter_get_in",
                                        dynlib: mltlib.}
proc filterGetOut*(self: Filter): Position {.cdecl, importc: "mlt_filter_get_out",
    dynlib: mltlib.}
proc filterGetLength*(self: Filter): Position {.cdecl,
    importc: "mlt_filter_get_length", dynlib: mltlib.}
proc filterGetLength2*(self: Filter; frame: Frame): Position {.cdecl,
    importc: "mlt_filter_get_length2", dynlib: mltlib.}
proc filterGetPosition*(self: Filter; frame: Frame): Position {.cdecl,
    importc: "mlt_filter_get_position", dynlib: mltlib.}
proc filterGetProgress*(self: Filter; frame: Frame): cdouble {.cdecl,
    importc: "mlt_filter_get_progress", dynlib: mltlib.}
proc filterClose*(a1: Filter) {.cdecl, importc: "mlt_filter_close", dynlib: mltlib.}