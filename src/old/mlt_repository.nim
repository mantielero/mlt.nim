## *
##  \file mlt_repository.h
##  \brief provides a map between service and shared objects
##  \see mlt_repository_s
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
  mlt_types, mlt_profile

## * This callback is the main entry point into a module, which must be exported
##   with the symbol "mlt_register".
##
##   Inside the callback, the module registers the additional callbacks below.
##

type
  mlt_repository_callback* = proc (a1: mlt_repository) {.cdecl.}

type
  mlt_properties_s {.bycopy.} = object
    child*: pointer            ## *< \private the object of a subclass
    local*: pointer            ## *< \private instance object
                  ## * the destructor virtual function
    close*: mlt_destructor
    close_object*: pointer     ## *< the object supplied to the close virtual function
  mlt_properties = ptr mlt_properties_s
## * The callback function that modules implement to construct a service.
##

type
  mlt_register_callback* = proc (a1: mlt_profile; a2: mlt_service_type; a3: cstring;
                              a4: pointer): pointer {.cdecl.}

## * The callback function that modules implement to supply metadata as a properties list.
##

type
  mlt_metadata_callback* = proc (a1: mlt_service_type; a2: cstring; a3: pointer): mlt_properties {.
      cdecl.}

## * A convenience macro to create an entry point for service registration.
##  #define MLT_REPOSITORY void mlt_register( mlt_repository repository )
## * A convenience macro to a register service in a more declarative manner.

template MLT_REGISTER*(`type`, service, symbol: untyped): untyped =
  (mlt_repository_register(repository, (`type`), (service),
                           (mlt_register_callback)(symbol)))

## * A convenience macro to a register metadata in a more declarative manner.

template MLT_REGISTER_METADATA*(`type`, service, callback, data: untyped): untyped =
  (mlt_repository_register_metadata(repository, (`type`), (service),
                                    (mlt_metadata_callback)(callback), (data)))

proc mlt_repository_init*(directory: cstring): mlt_repository {.cdecl,
    importc: "mlt_repository_init", dynlib: libName.}
proc mlt_repository_register*(self: mlt_repository; service_type: mlt_service_type;
                             service: cstring; a4: mlt_register_callback) {.cdecl,
    importc: "mlt_repository_register", dynlib: libName.}
proc mlt_repository_create*(self: mlt_repository; profile: mlt_profile;
                           `type`: mlt_service_type; service: cstring; arg: pointer): pointer {.
    cdecl, importc: "mlt_repository_create", dynlib: libName.}
proc mlt_repository_close*(self: mlt_repository) {.cdecl,
    importc: "mlt_repository_close", dynlib: libName.}
proc mlt_repository_consumers*(self: mlt_repository): mlt_properties {.cdecl,
    importc: "mlt_repository_consumers", dynlib: libName.}
proc mlt_repository_filters*(self: mlt_repository): mlt_properties {.cdecl,
    importc: "mlt_repository_filters", dynlib: libName.}
proc mlt_repository_producers*(self: mlt_repository): mlt_properties {.cdecl,
    importc: "mlt_repository_producers", dynlib: libName.}
proc mlt_repository_transitions*(self: mlt_repository): mlt_properties {.cdecl,
    importc: "mlt_repository_transitions", dynlib: libName.}
proc mlt_repository_register_metadata*(self: mlt_repository;
                                      `type`: mlt_service_type; service: cstring;
                                      a4: mlt_metadata_callback;
                                      callback_data: pointer) {.cdecl,
    importc: "mlt_repository_register_metadata", dynlib: libName.}
proc mlt_repository_metadata*(self: mlt_repository; `type`: mlt_service_type;
                             service: cstring): mlt_properties {.cdecl,
    importc: "mlt_repository_metadata", dynlib: libName.}
proc mlt_repository_languages*(self: mlt_repository): mlt_properties {.cdecl,
    importc: "mlt_repository_languages", dynlib: libName.}
proc mlt_repository_presets*(): mlt_properties {.cdecl,
    importc: "mlt_repository_presets", dynlib: libName.}