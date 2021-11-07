## *
##  \file mlt_geometry.h
##  \brief geometry animation API (deprecated)
##  \deprecated use mlt_animation_s instead
##
##  Copyright (C) 2004-2014 Meltytech, LLC
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

## * geometry animation item (deprecated)
##  \deprecated use mlt_animation_s instead
##

type
  mlt_geometry_item_s* {.bycopy.} = object
    key*: cint                 ##  Will be 1 when this is a key frame
    ##  The actual frame this corresponds to
    frame*: cint               ##  Distort
    distort*: cint             ##  x,y are upper left
    x*: cfloat
    y*: cfloat
    w*: cfloat
    h*: cfloat
    mix*: cfloat               ##  Indicates which values are fixed
    f*: array[5, cint]


## * geometry object (deprecated)
##  \deprecated use mlt_animation_s instead
##

type
  mlt_geometry_s* {.bycopy.} = object
    local*: pointer


##  Create a new geometry structure

proc mlt_geometry_init*(): mlt_geometry {.cdecl, importc: "mlt_geometry_init",
                                       dynlib: libName.}
##  Parse the geometry specification for a given length and normalised width/height (-1 for default)

proc mlt_geometry_parse*(self: mlt_geometry; data: cstring; length: cint; nw: cint;
                        nh: cint): cint {.cdecl, importc: "mlt_geometry_parse",
                                       dynlib: libName.}
##  Conditionally refresh the geometry if it's modified

proc mlt_geometry_refresh*(self: mlt_geometry; data: cstring; length: cint; nw: cint;
                          nh: cint): cint {.cdecl, importc: "mlt_geometry_refresh",
    dynlib: libName.}
##  Get and set the length

proc mlt_geometry_get_length*(self: mlt_geometry): cint {.cdecl,
    importc: "mlt_geometry_get_length", dynlib: libName.}
proc mlt_geometry_set_length*(self: mlt_geometry; length: cint) {.cdecl,
    importc: "mlt_geometry_set_length", dynlib: libName.}
##  Parse an item - doesn't affect the geometry itself but uses current information for evaluation
##  (item->frame should be specified if not included in the data itself)

proc mlt_geometry_parse_item*(self: mlt_geometry; item: mlt_geometry_item;
                             data: cstring): cint {.cdecl,
    importc: "mlt_geometry_parse_item", dynlib: libName.}
##  Fetch a geometry item for an absolute position

proc mlt_geometry_fetch*(self: mlt_geometry; item: mlt_geometry_item;
                        position: cfloat): cint {.cdecl,
    importc: "mlt_geometry_fetch", dynlib: libName.}
##  Specify a geometry item at an absolute position

proc mlt_geometry_insert*(self: mlt_geometry; item: mlt_geometry_item): cint {.cdecl,
    importc: "mlt_geometry_insert", dynlib: libName.}
##  Remove the key at the specified position

proc mlt_geometry_remove*(self: mlt_geometry; position: cint): cint {.cdecl,
    importc: "mlt_geometry_remove", dynlib: libName.}
##  Typically, re-interpolate after a series of insertions or removals.

proc mlt_geometry_interpolate*(self: mlt_geometry) {.cdecl,
    importc: "mlt_geometry_interpolate", dynlib: libName.}
##  Get the key at the position or the next following

proc mlt_geometry_next_key*(self: mlt_geometry; item: mlt_geometry_item;
                           position: cint): cint {.cdecl,
    importc: "mlt_geometry_next_key", dynlib: libName.}
proc mlt_geometry_prev_key*(self: mlt_geometry; item: mlt_geometry_item;
                           position: cint): cint {.cdecl,
    importc: "mlt_geometry_prev_key", dynlib: libName.}
##  Serialise the current geometry

proc mlt_geometry_serialise_cut*(self: mlt_geometry; `in`: cint; `out`: cint): cstring {.
    cdecl, importc: "mlt_geometry_serialise_cut", dynlib: libName.}
proc mlt_geometry_serialise*(self: mlt_geometry): cstring {.cdecl,
    importc: "mlt_geometry_serialise", dynlib: libName.}
##  Close the geometry

proc mlt_geometry_close*(self: mlt_geometry) {.cdecl, importc: "mlt_geometry_close",
    dynlib: libName.}