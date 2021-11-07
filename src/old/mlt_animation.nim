## *
##  \file mlt_animation.h
##  \brief Property Animation class declaration
##  \see mlt_animation_s
##
##  Copyright (C) 2004-2018 Meltytech, LLC
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
  mlt_types, mlt_property

## * \brief Animation class
##
##  Once an animation has been constructed using mlt_properties_s, this interface
##  provides a to query and manipulate the animation except for values. One must
##  use mlt_properties_s still to get, set, and change values.
##
##  \envvar \em MLT_ANIMATION_TIME_FORMAT the time value string format to use,
##  defaults to mlt_time_frames. Use the numeric value of mlt_time_format as
##  the value of this variable.
##
## * \brief An animation item that represents a keyframe-property combination.

type
  mlt_animation_item_s* {.bycopy.} = object
    is_key*: cint              ## *< a boolean of whether this is a key frame or an interpolated item
    frame*: cint               ## *< the frame number for this instance of the property
    property*: mlt_property    ## *< the property for this point in time
    keyframe_type*: mlt_keyframe_type ## *< the method of interpolation for this key frame

  mlt_animation_item* = ptr mlt_animation_item_s

## *< pointer to an animation item

proc mlt_animation_new*(): mlt_animation {.cdecl, importc: "mlt_animation_new",
                                        dynlib: libName.}
proc mlt_animation_parse*(self: mlt_animation; data: cstring; length: cint;
                         fps: cdouble; locale: locale_t): cint {.cdecl,
    importc: "mlt_animation_parse", dynlib: libName.}
proc mlt_animation_refresh*(self: mlt_animation; data: cstring; length: cint): cint {.
    cdecl, importc: "mlt_animation_refresh", dynlib: libName.}
proc mlt_animation_get_length*(self: mlt_animation): cint {.cdecl,
    importc: "mlt_animation_get_length", dynlib: libName.}
proc mlt_animation_set_length*(self: mlt_animation; length: cint) {.cdecl,
    importc: "mlt_animation_set_length", dynlib: libName.}
proc mlt_animation_parse_item*(self: mlt_animation; item: mlt_animation_item;
                              data: cstring): cint {.cdecl,
    importc: "mlt_animation_parse_item", dynlib: libName.}
proc mlt_animation_get_item*(self: mlt_animation; item: mlt_animation_item;
                            position: cint): cint {.cdecl,
    importc: "mlt_animation_get_item", dynlib: libName.}
proc mlt_animation_insert*(self: mlt_animation; item: mlt_animation_item): cint {.
    cdecl, importc: "mlt_animation_insert", dynlib: libName.}
proc mlt_animation_remove*(self: mlt_animation; position: cint): cint {.cdecl,
    importc: "mlt_animation_remove", dynlib: libName.}
proc mlt_animation_interpolate*(self: mlt_animation) {.cdecl,
    importc: "mlt_animation_interpolate", dynlib: libName.}
proc mlt_animation_next_key*(self: mlt_animation; item: mlt_animation_item;
                            position: cint): cint {.cdecl,
    importc: "mlt_animation_next_key", dynlib: libName.}
proc mlt_animation_prev_key*(self: mlt_animation; item: mlt_animation_item;
                            position: cint): cint {.cdecl,
    importc: "mlt_animation_prev_key", dynlib: libName.}
proc mlt_animation_serialize_cut_tf*(self: mlt_animation; `in`: cint; `out`: cint;
                                    a4: mlt_time_format): cstring {.cdecl,
    importc: "mlt_animation_serialize_cut_tf", dynlib: libName.}
proc mlt_animation_serialize_cut*(self: mlt_animation; `in`: cint; `out`: cint): cstring {.
    cdecl, importc: "mlt_animation_serialize_cut", dynlib: libName.}
proc mlt_animation_serialize_tf*(self: mlt_animation; a2: mlt_time_format): cstring {.
    cdecl, importc: "mlt_animation_serialize_tf", dynlib: libName.}
proc mlt_animation_serialize*(self: mlt_animation): cstring {.cdecl,
    importc: "mlt_animation_serialize", dynlib: libName.}
proc mlt_animation_key_count*(self: mlt_animation): cint {.cdecl,
    importc: "mlt_animation_key_count", dynlib: libName.}
proc mlt_animation_key_get*(self: mlt_animation; item: mlt_animation_item;
                           index: cint): cint {.cdecl,
    importc: "mlt_animation_key_get", dynlib: libName.}
proc mlt_animation_close*(self: mlt_animation) {.cdecl,
    importc: "mlt_animation_close", dynlib: libName.}
proc mlt_animation_key_set_type*(self: mlt_animation; index: cint;
                                `type`: mlt_keyframe_type): cint {.cdecl,
    importc: "mlt_animation_key_set_type", dynlib: libName.}
proc mlt_animation_key_set_frame*(self: mlt_animation; index: cint; frame: cint): cint {.
    cdecl, importc: "mlt_animation_key_set_frame", dynlib: libName.}