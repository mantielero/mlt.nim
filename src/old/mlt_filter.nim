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
  mlt_filter_s* {.bycopy.} = object
    parent*: mlt_service_s     ## * We're implementing service here
    ## * public virtual
    close*: proc (a1: mlt_filter) {.cdecl.} ## * protected filter method
    process*: proc (a1: mlt_filter; a2: mlt_frame): mlt_frame {.cdecl.} ## * Protected
    child*: pointer


template MLT_FILTER_SERVICE*(filter: untyped): untyped =
  (addr((filter).parent))

template MLT_FILTER_PROPERTIES*(filter: untyped): untyped =
  MLT_SERVICE_PROPERTIES(MLT_FILTER_SERVICE(filter))

proc mlt_filter_init*(self: mlt_filter; child: pointer): cint {.cdecl,
    importc: "mlt_filter_init", dynlib: libName.}
proc mlt_filter_new*(): mlt_filter {.cdecl, importc: "mlt_filter_new", dynlib: libName.}
proc mlt_filter_service*(self: mlt_filter): mlt_service {.cdecl,
    importc: "mlt_filter_service", dynlib: libName.}
proc mlt_filter_properties*(self: mlt_filter): mlt_properties {.cdecl,
    importc: "mlt_filter_properties", dynlib: libName.}
proc mlt_filter_process*(self: mlt_filter; that: mlt_frame): mlt_frame {.cdecl,
    importc: "mlt_filter_process", dynlib: libName.}
proc mlt_filter_connect*(self: mlt_filter; producer: mlt_service; index: cint): cint {.
    cdecl, importc: "mlt_filter_connect", dynlib: libName.}
proc mlt_filter_set_in_and_out*(self: mlt_filter; `in`: mlt_position;
                               `out`: mlt_position) {.cdecl,
    importc: "mlt_filter_set_in_and_out", dynlib: libName.}
proc mlt_filter_get_track*(self: mlt_filter): cint {.cdecl,
    importc: "mlt_filter_get_track", dynlib: libName.}
proc mlt_filter_get_in*(self: mlt_filter): mlt_position {.cdecl,
    importc: "mlt_filter_get_in", dynlib: libName.}
proc mlt_filter_get_out*(self: mlt_filter): mlt_position {.cdecl,
    importc: "mlt_filter_get_out", dynlib: libName.}
proc mlt_filter_get_length*(self: mlt_filter): mlt_position {.cdecl,
    importc: "mlt_filter_get_length", dynlib: libName.}
proc mlt_filter_get_length2*(self: mlt_filter; frame: mlt_frame): mlt_position {.
    cdecl, importc: "mlt_filter_get_length2", dynlib: libName.}
proc mlt_filter_get_position*(self: mlt_filter; frame: mlt_frame): mlt_position {.
    cdecl, importc: "mlt_filter_get_position", dynlib: libName.}
proc mlt_filter_get_progress*(self: mlt_filter; frame: mlt_frame): cdouble {.cdecl,
    importc: "mlt_filter_get_progress", dynlib: libName.}
proc mlt_filter_close*(a1: mlt_filter) {.cdecl, importc: "mlt_filter_close",
                                      dynlib: libName.}