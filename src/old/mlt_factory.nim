## *
##  \file mlt_factory.h
##  \brief the factory method interfaces
##
##  Copyright (C) 2003-2018 Meltytech, LLC
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
  mlt_types, mlt_profile, mlt_repository

type
  mlt_properties_s {.bycopy.} = object
    child*: pointer            ## *< \private the object of a subclass
    local*: pointer            ## *< \private instance object
                  ## * the destructor virtual function
    close*: mlt_destructor
    close_object*: pointer     ## *< the object supplied to the close virtual function
  mlt_properties = ptr mlt_properties_s
## *
##  \envvar \em MLT_PRODUCER the name of a default producer often used by other services, defaults to "loader"
##  \envvar \em MLT_CONSUMER the name of a default consumer, defaults to "sdl2" followed by "sdl"
##  \envvar \em MLT_TEST_CARD the name of a producer or file to be played when nothing is available (all tracks blank)
##  \envvar \em MLT_DATA overrides the default full path to the MLT and module supplemental data files, defaults to \p PREFIX_DATA
##  \envvar \em MLT_PROFILE selects the default mlt_profile_s, defaults to "dv_pal"
##  \envvar \em MLT_REPOSITORY overrides the default location of the plugin modules, defaults to \p PREFIX_LIB.
##  MLT_REPOSITORY is ignored on Windows and OS X relocatable builds.
##  \envvar \em MLT_PRESETS_PATH overrides the default full path to the properties preset files, defaults to \p MLT_DATA/presets
##  \event \em producer-create-request fired when mlt_factory_producer is called
##  \event \em producer-create-done fired when a producer registers itself
##  \event \em filter-create-request fired when mlt_factory_filter is called
##  \event \em filter-create-done fired when a filter registers itself
##  \event \em transition-create-request fired when mlt_factory_transition is called
##  \event \em transition-create-done fired when a transition registers itself
##  \event \em consumer-create-request fired when mlt_factory_consumer is called
##  \event \em consumer-create-done fired when a consumer registers itself
##

proc mlt_factory_init*(directory: cstring): mlt_repository {.cdecl,
    importc: "mlt_factory_init", dynlib: libName.}
proc mlt_factory_repository*(): mlt_repository {.cdecl,
    importc: "mlt_factory_repository", dynlib: libName.}
proc mlt_factory_directory*(): cstring {.cdecl, importc: "mlt_factory_directory",
                                      dynlib: libName.}
proc mlt_environment*(name: cstring): cstring {.cdecl, importc: "mlt_environment",
    dynlib: libName.}
proc mlt_environment_set*(name: cstring; value: cstring): cint {.cdecl,
    importc: "mlt_environment_set", dynlib: libName.}
proc mlt_factory_event_object*(): mlt_properties {.cdecl,
    importc: "mlt_factory_event_object", dynlib: libName.}
proc mlt_factory_producer*(profile: mlt_profile; service: cstring; resource: pointer): mlt_producer {.
    cdecl, importc: "mlt_factory_producer", dynlib: libName.}
proc mlt_factory_filter*(profile: mlt_profile; name: cstring; input: pointer): mlt_filter {.
    cdecl, importc: "mlt_factory_filter", dynlib: libName.}
proc mlt_factory_transition*(profile: mlt_profile; name: cstring; input: pointer): mlt_transition {.
    cdecl, importc: "mlt_factory_transition", dynlib: libName.}
proc mlt_factory_consumer*(profile: mlt_profile; name: cstring; input: pointer): mlt_consumer {.
    cdecl, importc: "mlt_factory_consumer", dynlib: libName.}
proc mlt_factory_register_for_clean_up*(`ptr`: pointer; destructor: mlt_destructor) {.
    cdecl, importc: "mlt_factory_register_for_clean_up", dynlib: libName.}
proc mlt_factory_close*() {.cdecl, importc: "mlt_factory_close", dynlib: libName.}
proc mlt_global_properties*(): mlt_properties {.cdecl,
    importc: "mlt_global_properties", dynlib: libName.}