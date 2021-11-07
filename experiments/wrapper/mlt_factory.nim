## *
##  \file mlt_factory.h
##  \brief the factory method interfaces
##
##  Copyright (C) 2003-2021 Meltytech, LLC
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

## *
##  \envvar \em MLT_PRODUCER the name of a default producer often used by other services, defaults to "loader"
##  \envvar \em MLT_CONSUMER the name of a default consumer, defaults to "sdl2" followed by "sdl"
##  \envvar \em MLT_TEST_CARD the name of a producer or file to be played when nothing is available (all tracks blank)
##  \envvar \em MLT_DATA overrides the default full path to the MLT and module supplemental data files, defaults to \p PREFIX_DATA
##  \envvar \em MLT_PROFILE selects the default mlt_profile_s, defaults to "dv_pal"
##  \envvar \em MLT_REPOSITORY overrides the default location of the plugin modules, defaults to \p PREFIX_LIB.
##  MLT_REPOSITORY is ignored on Windows and OS X relocatable builds.
##  \envvar \em MLT_PRESETS_PATH overrides the default full path to the properties preset files, defaults to \p MLT_DATA/presets
##  \event \em producer-create-request fired when mlt_factory_producer is called;
##    the event data is a pointer to mlt_factory_event_data
##  \event \em producer-create-done fired when a producer registers itself;
## 	 the event data is a pointer to mlt_factory_event_data
##  \event \em filter-create-request fired when mlt_factory_filter is called;
##    the event data is a pointer to mlt_factory_event_data
##  \event \em filter-create-done fired when a filter registers itself;
##    the event data is a pointer to mlt_factory_event_data
##  \event \em transition-create-request fired when mlt_factory_transition is called;
##    the event data is a pointer to mlt_factory_event_data
##  \event \em transition-create-done fired when a transition registers itself;
##    the event data is a pointer to mlt_factory_event_data
##  \event \em consumer-create-request fired when mlt_factory_consumer is called;
##    the event data is a pointer to mlt_factory_event_data
##  \event \em consumer-create-done fired when a consumer registers itself;
##    the event data is a pointer to mlt_factory_event_data
##  \event \em link-create-request fired when mlt_factory_link is called;
##    the event data is a pointer to mlt_factory_event_data
##  \event \em link-create-done fired when a link registers itself;
##    the event data is a pointer to mlt_factory_event_data
##

proc factoryInit*(directory: cstring): Repository {.cdecl,
    importc: "mlt_factory_init(@)", dynlib: mltlib.}
proc factoryRepository*(): Repository {.cdecl, importc: "mlt_factory_repository",
                                     dynlib: mltlib.}
proc factoryDirectory*(): cstring {.cdecl, importc: "mlt_factory_directory",
                                 dynlib: mltlib.}
proc environment*(name: cstring): cstring {.cdecl, importc: "mlt_environment",
                                        dynlib: mltlib.}
proc environmentSet*(name: cstring; value: cstring): cint {.cdecl,
    importc: "mlt_environment_set", dynlib: mltlib.}
proc factoryEventObject*(): Properties {.cdecl, importc: "mlt_factory_event_object",
                                      dynlib: mltlib.}
proc factoryProducer*(profile: Profile; service: cstring; resource: pointer): Producer {.
    cdecl, importc: "mlt_factory_producer", dynlib: mltlib.}
proc factoryFilter*(profile: Profile; name: cstring; input: pointer): Filter {.cdecl,
    importc: "mlt_factory_filter", dynlib: mltlib.}
proc factoryLink*(name: cstring; input: pointer): Link {.cdecl,
    importc: "mlt_factory_link", dynlib: mltlib.}
proc factoryTransition*(profile: Profile; name: cstring; input: pointer): Transition {.
    cdecl, importc: "mlt_factory_transition", dynlib: mltlib.}
proc factoryConsumer*(profile: Profile; name: cstring; input: pointer): Consumer {.
    cdecl, importc: "mlt_factory_consumer", dynlib: mltlib.}
proc factoryConsumer*(): Consumer {.
    cdecl, importc: "mlt_factory_consumer(NULL, NULL)", dynlib: mltlib.}
proc factoryRegisterForCleanUp*(`ptr`: pointer; destructor: Destructor) {.cdecl,
    importc: "mlt_factory_register_for_clean_up", dynlib: mltlib.}
proc factoryClose*() {.cdecl, importc: "mlt_factory_close", dynlib: mltlib.}
proc globalProperties*(): Properties {.cdecl, importc: "mlt_global_properties",
                                    dynlib: mltlib.}
## * The event data for all factory-related events

type
  FactoryEventData* {.importc: "mlt_factory_event_data", header: "mlt_factory.h",
                     bycopy.} = object
    name* {.importc: "name".}: cstring ## *< the name of the service requested
    input* {.importc: "input".}: pointer ## *< an argument supplied to initialize the service, typically a string
    service* {.importc: "service".}: pointer ## *< the service being created

