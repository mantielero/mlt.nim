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
  mlt_types

proc mlt_field_init*(): mlt_field {.cdecl, importc: "mlt_field_init", dynlib: libName.}
proc mlt_field_new*(multitrack: mlt_multitrack; tractor: mlt_tractor): mlt_field {.
    cdecl, importc: "mlt_field_new", dynlib: libName.}
proc mlt_field_service*(self: mlt_field): mlt_service {.cdecl,
    importc: "mlt_field_service", dynlib: libName.}
proc mlt_field_tractor*(self: mlt_field): mlt_tractor {.cdecl,
    importc: "mlt_field_tractor", dynlib: libName.}
proc mlt_field_multitrack*(self: mlt_field): mlt_multitrack {.cdecl,
    importc: "mlt_field_multitrack", dynlib: libName.}
proc mlt_field_properties*(self: mlt_field): mlt_properties {.cdecl,
    importc: "mlt_field_properties", dynlib: libName.}
proc mlt_field_plant_filter*(self: mlt_field; that: mlt_filter; track: cint): cint {.
    cdecl, importc: "mlt_field_plant_filter", dynlib: libName.}
proc mlt_field_plant_transition*(self: mlt_field; that: mlt_transition;
                                a_track: cint; b_track: cint): cint {.cdecl,
    importc: "mlt_field_plant_transition", dynlib: libName.}
proc mlt_field_close*(self: mlt_field) {.cdecl, importc: "mlt_field_close",
                                      dynlib: libName.}
proc mlt_field_disconnect_service*(self: mlt_field; service: mlt_service) {.cdecl,
    importc: "mlt_field_disconnect_service", dynlib: libName.}