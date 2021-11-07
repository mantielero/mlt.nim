## *
##  \file mlt_field.h
##  \brief a field for planting multiple transitions and services
##  \see mlt_field_s
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

proc fieldInit*(): Field {.cdecl, importc: "mlt_field_init", dynlib: mltlib.}
proc fieldNew*(multitrack: Multitrack; tractor: Tractor): Field {.cdecl,
    importc: "mlt_field_new", dynlib: mltlib.}
proc fieldService*(self: Field): Service {.cdecl, importc: "mlt_field_service",
                                       dynlib: mltlib.}
proc fieldTractor*(self: Field): Tractor {.cdecl, importc: "mlt_field_tractor",
                                       dynlib: mltlib.}
proc fieldMultitrack*(self: Field): Multitrack {.cdecl,
    importc: "mlt_field_multitrack", dynlib: mltlib.}
proc fieldProperties*(self: Field): Properties {.cdecl,
    importc: "mlt_field_properties", dynlib: mltlib.}
proc fieldPlantFilter*(self: Field; that: Filter; track: cint): cint {.cdecl,
    importc: "mlt_field_plant_filter", dynlib: mltlib.}
proc fieldPlantTransition*(self: Field; that: Transition; aTrack: cint; bTrack: cint): cint {.
    cdecl, importc: "mlt_field_plant_transition", dynlib: mltlib.}
proc fieldClose*(self: Field) {.cdecl, importc: "mlt_field_close", dynlib: mltlib.}
proc fieldDisconnectService*(self: Field; service: Service) {.cdecl,
    importc: "mlt_field_disconnect_service", dynlib: mltlib.}