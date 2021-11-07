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
  AnimationItemS* {.importc: "mlt_animation_item_s", header: "mlt_animation.h",
                   bycopy.} = object
    isKey* {.importc: "is_key".}: cint ## *< a boolean of whether this is a key frame or an interpolated item
    frame* {.importc: "frame".}: cint ## *< the frame number for this instance of the property
    property* {.importc: "property".}: Property ## *< the property for this point in time
    keyframeType* {.importc: "keyframe_type".}: KeyframeType ## *< the method of interpolation for this key frame

  AnimationItem* = ptr AnimationItemS

## *< pointer to an animation item

proc animationNew*(): Animation {.cdecl, importc: "mlt_animation_new", dynlib: mltlib.}
proc animationParse*(self: Animation; data: cstring; length: cint; fps: cdouble;
                    locale: LocaleT): cint {.cdecl, importc: "mlt_animation_parse",
    dynlib: mltlib.}
proc animationRefresh*(self: Animation; data: cstring; length: cint): cint {.cdecl,
    importc: "mlt_animation_refresh", dynlib: mltlib.}
proc animationGetLength*(self: Animation): cint {.cdecl,
    importc: "mlt_animation_get_length", dynlib: mltlib.}
proc animationSetLength*(self: Animation; length: cint) {.cdecl,
    importc: "mlt_animation_set_length", dynlib: mltlib.}
proc animationParseItem*(self: Animation; item: AnimationItem; data: cstring): cint {.
    cdecl, importc: "mlt_animation_parse_item", dynlib: mltlib.}
proc animationGetItem*(self: Animation; item: AnimationItem; position: cint): cint {.
    cdecl, importc: "mlt_animation_get_item", dynlib: mltlib.}
proc animationInsert*(self: Animation; item: AnimationItem): cint {.cdecl,
    importc: "mlt_animation_insert", dynlib: mltlib.}
proc animationRemove*(self: Animation; position: cint): cint {.cdecl,
    importc: "mlt_animation_remove", dynlib: mltlib.}
proc animationInterpolate*(self: Animation) {.cdecl,
    importc: "mlt_animation_interpolate", dynlib: mltlib.}
proc animationNextKey*(self: Animation; item: AnimationItem; position: cint): cint {.
    cdecl, importc: "mlt_animation_next_key", dynlib: mltlib.}
proc animationPrevKey*(self: Animation; item: AnimationItem; position: cint): cint {.
    cdecl, importc: "mlt_animation_prev_key", dynlib: mltlib.}
proc animationSerializeCutTf*(self: Animation; `in`: cint; `out`: cint; a4: TimeFormat): cstring {.
    cdecl, importc: "mlt_animation_serialize_cut_tf", dynlib: mltlib.}
proc animationSerializeCut*(self: Animation; `in`: cint; `out`: cint): cstring {.cdecl,
    importc: "mlt_animation_serialize_cut", dynlib: mltlib.}
proc animationSerializeTf*(self: Animation; a2: TimeFormat): cstring {.cdecl,
    importc: "mlt_animation_serialize_tf", dynlib: mltlib.}
proc animationSerialize*(self: Animation): cstring {.cdecl,
    importc: "mlt_animation_serialize", dynlib: mltlib.}
proc animationKeyCount*(self: Animation): cint {.cdecl,
    importc: "mlt_animation_key_count", dynlib: mltlib.}
proc animationKeyGet*(self: Animation; item: AnimationItem; index: cint): cint {.cdecl,
    importc: "mlt_animation_key_get", dynlib: mltlib.}
proc animationClose*(self: Animation) {.cdecl, importc: "mlt_animation_close",
                                     dynlib: mltlib.}
proc animationKeySetType*(self: Animation; index: cint; `type`: KeyframeType): cint {.
    cdecl, importc: "mlt_animation_key_set_type", dynlib: mltlib.}
proc animationKeySetFrame*(self: Animation; index: cint; frame: cint): cint {.cdecl,
    importc: "mlt_animation_key_set_frame", dynlib: mltlib.}
proc animationShiftFrames*(self: Animation; shift: cint) {.cdecl,
    importc: "mlt_animation_shift_frames", dynlib: mltlib.}
proc animationGetString*(self: Animation): cstring {.cdecl,
    importc: "mlt_animation_get_string", dynlib: mltlib.}