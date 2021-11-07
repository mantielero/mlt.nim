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

## * This callback is the main entry point into a module, which must be exported
##   with the symbol "mlt_register".
##
##   Inside the callback, the module registers the additional callbacks below.
##

type
  RepositoryCallback* = proc (a1: Repository) {.cdecl.}

## * The callback function that modules implement to construct a service.
##

type
  RegisterCallback* = proc (a1: Profile; a2: ServiceType; a3: cstring; a4: pointer): pointer {.
      cdecl.}

## * The callback function that modules implement to supply metadata as a properties list.
##

type
  MetadataCallback* = proc (a1: ServiceType; a2: cstring; a3: pointer): Properties {.cdecl.}

## * A convenience macro to create an entry point for service registration.
##  #define MLT_REPOSITORY void mlt_register( mlt_repository repository )
##
##  /** A convenience macro to a register service in a more declarative manner. */
##  #define MLT_REGISTER( type, service, symbol  ) ( mlt_repository_register( repository, (type), (service), ( mlt_register_callback )(symbol) ) )
##
##  /** A convenience macro to a register metadata in a more declarative manner. */
##  #define MLT_REGISTER_METADATA( type, service, callback, data ) ( mlt_repository_register_metadata( repository, (type), (service), ( mlt_metadata_callback )(callback), (data) ) )

proc repositoryInit*(directory: cstring): Repository {.cdecl,
    importc: "mlt_repository_init", dynlib: mltlib.}
proc repositoryRegister*(self: Repository; serviceType: ServiceType;
                        service: cstring; a4: RegisterCallback) {.cdecl,
    importc: "mlt_repository_register", dynlib: mltlib.}
proc repositoryCreate*(self: Repository; profile: Profile; `type`: ServiceType;
                      service: cstring; arg: pointer): pointer {.cdecl,
    importc: "mlt_repository_create", dynlib: mltlib.}
proc repositoryClose*(self: Repository) {.cdecl, importc: "mlt_repository_close",
                                       dynlib: mltlib.}
proc repositoryConsumers*(self: Repository): Properties {.cdecl,
    importc: "mlt_repository_consumers", dynlib: mltlib.}
proc repositoryFilters*(self: Repository): Properties {.cdecl,
    importc: "mlt_repository_filters", dynlib: mltlib.}
proc repositoryLinks*(self: Repository): Properties {.cdecl,
    importc: "mlt_repository_links", dynlib: mltlib.}
proc repositoryProducers*(self: Repository): Properties {.cdecl,
    importc: "mlt_repository_producers", dynlib: mltlib.}
proc repositoryTransitions*(self: Repository): Properties {.cdecl,
    importc: "mlt_repository_transitions", dynlib: mltlib.}
proc repositoryRegisterMetadata*(self: Repository; `type`: ServiceType;
                                service: cstring; a4: MetadataCallback;
                                callbackData: pointer) {.cdecl,
    importc: "mlt_repository_register_metadata", dynlib: mltlib.}
proc repositoryMetadata*(self: Repository; `type`: ServiceType; service: cstring): Properties {.
    cdecl, importc: "mlt_repository_metadata", dynlib: mltlib.}
proc repositoryLanguages*(self: Repository): Properties {.cdecl,
    importc: "mlt_repository_languages", dynlib: mltlib.}
proc repositoryPresets*(): Properties {.cdecl, importc: "mlt_repository_presets",
                                     dynlib: mltlib.}