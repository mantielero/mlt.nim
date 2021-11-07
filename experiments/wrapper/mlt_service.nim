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
##  \event \em property-changed a property's value changed; the event data is a string for the name of the property
##  \properties \em mlt_type identifies the subclass
##  \properties \em _mlt_service_hidden a flag that indicates whether to hide the mlt_service
##  \properties \em mlt_service is the name of the implementation of the service
##  \properties \em resource is either the stream identifier or grandchild-class
##  \properties \em in when to start, what is started is service-specific
##  \properties \em out when to stop
##  \properties \em _filter_private Set this on a service to ensure that attached filters are handled privately.
##  See modules/core/filter_watermark.c for example.
##  \properties \em _profile stores the mlt_profile for a service
##  \properties \em _unique_id is a unique identifier
##  \properties \em _need_previous_next boolean that instructs producers to get
##  preceding and following frames inside of \p mlt_service_get_frame
##

type
  ServiceS* {.importc: "mlt_service_s", header: "mlt_service.h", bycopy.} = object
    parent* {.importc: "parent".}: PropertiesS ## *< \private A service extends properties.
                                           ## * Get a frame of data (virtual function).
                                           ##
                                           ##  \param mlt_producer a producer
                                           ##  \param mlt_frame_ptr a frame pointer by reference
                                           ##  \param int an index
                                           ##  \return true if there was an error
                                           ##
    getFrame* {.importc: "get_frame".}: proc (self: Service; frame: ptr Frame;
        index: cint): cint {.cdecl.} ## * the destructor virtual function
    close* {.importc: "close".}: Destructor
    closeObject* {.importc: "close_object".}: pointer ## *< the object supplied to the close virtual function
    local* {.importc: "local".}: pointer ## *< \private instance object
    child* {.importc: "child".}: pointer ## *< \private the object of a subclass


template mlt_Service_Properties*(service: untyped): untyped =
  (addr((service).parent))

proc serviceInit*(self: Service; child: pointer): cint {.cdecl,
    importc: "mlt_service_init", dynlib: mltlib.}
proc serviceLock*(self: Service) {.cdecl, importc: "mlt_service_lock", dynlib: mltlib.}
proc serviceUnlock*(self: Service) {.cdecl, importc: "mlt_service_unlock",
                                  dynlib: mltlib.}
proc serviceIdentify*(self: Service): ServiceType {.cdecl,
    importc: "mlt_service_identify", dynlib: mltlib.}
proc serviceConnectProducer*(self: Service; producer: Service; index: cint): cint {.
    cdecl, importc: "mlt_service_connect_producer", dynlib: mltlib.}
proc serviceInsertProducer*(self: Service; producer: Service; index: cint): cint {.
    cdecl, importc: "mlt_service_insert_producer", dynlib: mltlib.}
proc serviceDisconnectProducer*(self: Service; index: cint): cint {.cdecl,
    importc: "mlt_service_disconnect_producer", dynlib: mltlib.}
proc serviceDisconnectAllProducers*(self: Service): cint {.cdecl,
    importc: "mlt_service_disconnect_all_producers", dynlib: mltlib.}
proc serviceGetProducer*(self: Service): Service {.cdecl,
    importc: "mlt_service_get_producer", dynlib: mltlib.}
proc serviceGetFrame*(self: Service; frame: ptr Frame; index: cint): cint {.cdecl,
    importc: "mlt_service_get_frame", dynlib: mltlib.}
proc serviceProperties*(self: Service): Properties {.cdecl,
    importc: "mlt_service_properties", dynlib: mltlib.}
proc serviceConsumer*(self: Service): Service {.cdecl,
    importc: "mlt_service_consumer", dynlib: mltlib.}
proc serviceProducer*(self: Service): Service {.cdecl,
    importc: "mlt_service_producer", dynlib: mltlib.}
proc serviceAttach*(self: Service; filter: Filter): cint {.cdecl,
    importc: "mlt_service_attach", dynlib: mltlib.}
proc serviceDetach*(self: Service; filter: Filter): cint {.cdecl,
    importc: "mlt_service_detach", dynlib: mltlib.}
proc serviceApplyFilters*(self: Service; frame: Frame; index: cint) {.cdecl,
    importc: "mlt_service_apply_filters", dynlib: mltlib.}
proc serviceFilterCount*(self: Service): cint {.cdecl,
    importc: "mlt_service_filter_count", dynlib: mltlib.}
proc serviceMoveFilter*(self: Service; `from`: cint; to: cint): cint {.cdecl,
    importc: "mlt_service_move_filter", dynlib: mltlib.}
proc serviceFilter*(self: Service; index: cint): Filter {.cdecl,
    importc: "mlt_service_filter", dynlib: mltlib.}
proc serviceProfile*(self: Service): Profile {.cdecl, importc: "mlt_service_profile",
    dynlib: mltlib.}
proc serviceSetProfile*(self: Service; profile: Profile) {.cdecl,
    importc: "mlt_service_set_profile", dynlib: mltlib.}
proc serviceClose*(self: Service) {.cdecl, importc: "mlt_service_close",
                                 dynlib: mltlib.}
proc serviceCachePut*(self: Service; name: cstring; data: pointer; size: cint;
                     destructor: Destructor) {.cdecl,
    importc: "mlt_service_cache_put", dynlib: mltlib.}
proc serviceCacheGet*(self: Service; name: cstring): CacheItem {.cdecl,
    importc: "mlt_service_cache_get", dynlib: mltlib.}
proc serviceCacheSetSize*(self: Service; name: cstring; size: cint) {.cdecl,
    importc: "mlt_service_cache_set_size", dynlib: mltlib.}
proc serviceCacheGetSize*(self: Service; name: cstring): cint {.cdecl,
    importc: "mlt_service_cache_get_size", dynlib: mltlib.}
proc serviceCachePurge*(self: Service) {.cdecl, importc: "mlt_service_cache_purge",
                                      dynlib: mltlib.}