## *
##  \file mlt_service.h
##  \brief interface declaration for all service classes
##  \see mlt_service_s
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
  mlt_properties, mlt_types

## * \brief Service abstract base class
##
##  \extends mlt_properties
##  The service is the base class for all of the interesting classes and
##  plugins for MLT. A service can have multiple inputs connections to
##  other services called its "producers" but only a single output to another
##  service called its "consumer." A service that has both producer and
##  consumer connections is called a filter. Any service can have zero or more
##  filters "attached" to it. We call any collection of services and their
##  connections a "service network," which is similar to what DirectShow calls
##  a filter graph or what gstreamer calls an element pipeline.
##
##  \event \em service-changed a filter was attached or detached or a transition was connected or disconnected
##  \event \em property-changed
##  \properties \em mlt_type identifies the subclass
##  \properties \em _mlt_service_hidden a flag that indicates whether to hide the mlt_service
##  \properties \em mlt_service is the name of the implementation of the service
##  \properties \em resource is either the stream identifier or grandchild-class
##  \properties \em in when to start, what is started is service-specific
##  \properties \em out when to stop
##  \properties \em _filter_private Set this on a service to ensure that attached filters are handled privately.
##  See modules/core/filter_region.c and modules/core/filter_watermark.c for examples.
##  \properties \em _profile stores the mlt_profile for a service
##  \properties \em _unique_id is a unique identifier
##  \properties \em _need_previous_next boolean that instructs producers to get
##  preceding and following frames inside of \p mlt_service_get_frame
##

type
  mlt_service_s* {.bycopy.} = object
    parent*: mlt_properties_s  ## *< \private A service extends properties.
                            ## * Get a frame of data (virtual function).
                            ##
                            ##  \param mlt_producer a producer
                            ##  \param mlt_frame_ptr a frame pointer by reference
                            ##  \param int an index
                            ##  \return true if there was an error
                            ##
    get_frame*: proc (self: mlt_service; frame: mlt_frame_ptr; index: cint): cint {.cdecl.} ##
                                                                                  ## *
                                                                                  ## the
                                                                                  ## destructor
                                                                                  ## virtual
                                                                                  ## function
    close*: mlt_destructor
    close_object*: pointer     ## *< the object supplied to the close virtual function
    local*: pointer            ## *< \private instance object
    child*: pointer            ## *< \private the object of a subclass


template MLT_SERVICE_PROPERTIES*(service: untyped): untyped =
  (addr((service).parent))

proc mlt_service_init*(self: mlt_service; child: pointer): cint {.cdecl,
    importc: "mlt_service_init", dynlib: libName.}
proc mlt_service_lock*(self: mlt_service) {.cdecl, importc: "mlt_service_lock",
    dynlib: libName.}
proc mlt_service_unlock*(self: mlt_service) {.cdecl, importc: "mlt_service_unlock",
    dynlib: libName.}
proc mlt_service_identify*(self: mlt_service): mlt_service_type {.cdecl,
    importc: "mlt_service_identify", dynlib: libName.}
proc mlt_service_connect_producer*(self: mlt_service; producer: mlt_service;
                                  index: cint): cint {.cdecl,
    importc: "mlt_service_connect_producer", dynlib: libName.}
proc mlt_service_insert_producer*(self: mlt_service; producer: mlt_service;
                                 index: cint): cint {.cdecl,
    importc: "mlt_service_insert_producer", dynlib: libName.}
proc mlt_service_disconnect_producer*(self: mlt_service; index: cint): cint {.cdecl,
    importc: "mlt_service_disconnect_producer", dynlib: libName.}
proc mlt_service_disconnect_all_producers*(self: mlt_service): cint {.cdecl,
    importc: "mlt_service_disconnect_all_producers", dynlib: libName.}
proc mlt_service_get_producer*(self: mlt_service): mlt_service {.cdecl,
    importc: "mlt_service_get_producer", dynlib: libName.}
proc mlt_service_get_frame*(self: mlt_service; frame: mlt_frame_ptr; index: cint): cint {.
    cdecl, importc: "mlt_service_get_frame", dynlib: libName.}
proc mlt_service_properties*(self: mlt_service): mlt_properties {.cdecl,
    importc: "mlt_service_properties", dynlib: libName.}
proc mlt_service_consumer*(self: mlt_service): mlt_service {.cdecl,
    importc: "mlt_service_consumer", dynlib: libName.}
proc mlt_service_producer*(self: mlt_service): mlt_service {.cdecl,
    importc: "mlt_service_producer", dynlib: libName.}
proc mlt_service_attach*(self: mlt_service; filter: mlt_filter): cint {.cdecl,
    importc: "mlt_service_attach", dynlib: libName.}
proc mlt_service_detach*(self: mlt_service; filter: mlt_filter): cint {.cdecl,
    importc: "mlt_service_detach", dynlib: libName.}
proc mlt_service_apply_filters*(self: mlt_service; frame: mlt_frame; index: cint) {.
    cdecl, importc: "mlt_service_apply_filters", dynlib: libName.}
proc mlt_service_filter_count*(self: mlt_service): cint {.cdecl,
    importc: "mlt_service_filter_count", dynlib: libName.}
proc mlt_service_move_filter*(self: mlt_service; `from`: cint; to: cint): cint {.cdecl,
    importc: "mlt_service_move_filter", dynlib: libName.}
proc mlt_service_filter*(self: mlt_service; index: cint): mlt_filter {.cdecl,
    importc: "mlt_service_filter", dynlib: libName.}
proc mlt_service_profile*(self: mlt_service): mlt_profile {.cdecl,
    importc: "mlt_service_profile", dynlib: libName.}
proc mlt_service_set_profile*(self: mlt_service; profile: mlt_profile) {.cdecl,
    importc: "mlt_service_set_profile", dynlib: libName.}
proc mlt_service_close*(self: mlt_service) {.cdecl, importc: "mlt_service_close",
    dynlib: libName.}
proc mlt_service_cache_put*(self: mlt_service; name: cstring; data: pointer;
                           size: cint; destructor: mlt_destructor) {.cdecl,
    importc: "mlt_service_cache_put", dynlib: libName.}
proc mlt_service_cache_get*(self: mlt_service; name: cstring): mlt_cache_item {.cdecl,
    importc: "mlt_service_cache_get", dynlib: libName.}
proc mlt_service_cache_set_size*(self: mlt_service; name: cstring; size: cint) {.cdecl,
    importc: "mlt_service_cache_set_size", dynlib: libName.}
proc mlt_service_cache_get_size*(self: mlt_service; name: cstring): cint {.cdecl,
    importc: "mlt_service_cache_get_size", dynlib: libName.}
proc mlt_service_cache_purge*(self: mlt_service) {.cdecl,
    importc: "mlt_service_cache_purge", dynlib: libName.}