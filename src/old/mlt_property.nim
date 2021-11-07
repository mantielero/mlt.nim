## *
##  \file mlt_property.h
##  \brief Property class declaration
##  \see mlt_property_s
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
  mlt_types

#[
when defined(__FreeBSD__):
  ##  This header has existed since 1994 and defines __FreeBSD_version below.
when (defined(__GLIBC__) and not defined(__APPLE__)) or defined(HAVE_LOCALE_H):
elif defined(__APPLE__) or
    (defined(__FreeBSD_version) and __FreeBSD_version >= 900506):
elif defined(__OpenBSD__):
  ##  XXX matches __nop_locale glue in libc++
  type
    locale_t* = pointer
else:
  type
    locale_t* = cstring
]#
type
  locale_t* = cstring



proc mlt_property_init*(): mlt_property {.cdecl, importc: "mlt_property_init",
                                       dynlib: libName.}
proc mlt_property_clear*(self: mlt_property) {.cdecl, importc: "mlt_property_clear",
    dynlib: libName.}
proc mlt_property_set_int*(self: mlt_property; value: cint): cint {.cdecl,
    importc: "mlt_property_set_int", dynlib: libName.}
proc mlt_property_set_double*(self: mlt_property; value: cdouble): cint {.cdecl,
    importc: "mlt_property_set_double", dynlib: libName.}
proc mlt_property_set_position*(self: mlt_property; value: mlt_position): cint {.
    cdecl, importc: "mlt_property_set_position", dynlib: libName.}
proc mlt_property_set_int64*(self: mlt_property; value: cint): cint {.cdecl,
    importc: "mlt_property_set_int64", dynlib: libName.}
proc mlt_property_set_string*(self: mlt_property; value: cstring): cint {.cdecl,
    importc: "mlt_property_set_string", dynlib: libName.}
proc mlt_property_set_data*(self: mlt_property; value: pointer; length: cint;
                           destructor: mlt_destructor; serialiser: mlt_serialiser): cint {.
    cdecl, importc: "mlt_property_set_data", dynlib: libName.}
proc mlt_property_get_int*(self: mlt_property; fps: cdouble; a3: locale_t): cint {.
    cdecl, importc: "mlt_property_get_int", dynlib: libName.}
proc mlt_property_get_double*(self: mlt_property; fps: cdouble; a3: locale_t): cdouble {.
    cdecl, importc: "mlt_property_get_double", dynlib: libName.}
proc mlt_property_get_position*(self: mlt_property; fps: cdouble; a3: locale_t): mlt_position {.
    cdecl, importc: "mlt_property_get_position", dynlib: libName.}
proc mlt_property_get_int64*(self: mlt_property): cint {.cdecl,
    importc: "mlt_property_get_int64", dynlib: libName.}
proc mlt_property_get_string_tf*(self: mlt_property; a2: mlt_time_format): cstring {.
    cdecl, importc: "mlt_property_get_string_tf", dynlib: libName.}
proc mlt_property_get_string*(self: mlt_property): cstring {.cdecl,
    importc: "mlt_property_get_string", dynlib: libName.}
proc mlt_property_get_string_l_tf*(self: mlt_property; a2: locale_t;
                                  a3: mlt_time_format): cstring {.cdecl,
    importc: "mlt_property_get_string_l_tf", dynlib: libName.}
proc mlt_property_get_string_l*(self: mlt_property; a2: locale_t): cstring {.cdecl,
    importc: "mlt_property_get_string_l", dynlib: libName.}
proc mlt_property_get_data*(self: mlt_property; length: ptr cint): pointer {.cdecl,
    importc: "mlt_property_get_data", dynlib: libName.}
proc mlt_property_close*(self: mlt_property) {.cdecl, importc: "mlt_property_close",
    dynlib: libName.}
proc mlt_property_pass*(self: mlt_property; that: mlt_property) {.cdecl,
    importc: "mlt_property_pass", dynlib: libName.}
proc mlt_property_get_time*(self: mlt_property; a2: mlt_time_format; fps: cdouble;
                           a4: locale_t): cstring {.cdecl,
    importc: "mlt_property_get_time", dynlib: libName.}
proc mlt_property_interpolate*(self: mlt_property; points: ptr mlt_property;
                              progress: cdouble; fps: cdouble; locale: locale_t;
                              interp: mlt_keyframe_type): cint {.cdecl,
    importc: "mlt_property_interpolate", dynlib: libName.}
proc mlt_property_anim_get_double*(self: mlt_property; fps: cdouble;
                                  locale: locale_t; position: cint; length: cint): cdouble {.
    cdecl, importc: "mlt_property_anim_get_double", dynlib: libName.}
proc mlt_property_anim_get_int*(self: mlt_property; fps: cdouble; locale: locale_t;
                               position: cint; length: cint): cint {.cdecl,
    importc: "mlt_property_anim_get_int", dynlib: libName.}
proc mlt_property_anim_get_string*(self: mlt_property; fps: cdouble;
                                  locale: locale_t; position: cint; length: cint): cstring {.
    cdecl, importc: "mlt_property_anim_get_string", dynlib: libName.}
proc mlt_property_anim_set_double*(self: mlt_property; value: cdouble; fps: cdouble;
                                  locale: locale_t; position: cint; length: cint;
                                  keyframe_type: mlt_keyframe_type): cint {.cdecl,
    importc: "mlt_property_anim_set_double", dynlib: libName.}
proc mlt_property_anim_set_int*(self: mlt_property; value: cint; fps: cdouble;
                               locale: locale_t; position: cint; length: cint;
                               keyframe_type: mlt_keyframe_type): cint {.cdecl,
    importc: "mlt_property_anim_set_int", dynlib: libName.}
proc mlt_property_anim_set_string*(self: mlt_property; value: cstring; fps: cdouble;
                                  locale: locale_t; position: cint; length: cint): cint {.
    cdecl, importc: "mlt_property_anim_set_string", dynlib: libName.}
proc mlt_property_get_animation*(self: mlt_property): mlt_animation {.cdecl,
    importc: "mlt_property_get_animation", dynlib: libName.}
proc mlt_property_set_rect*(self: mlt_property; value: mlt_rect): cint {.cdecl,
    importc: "mlt_property_set_rect", dynlib: libName.}
proc mlt_property_get_rect*(self: mlt_property; locale: locale_t): mlt_rect {.cdecl,
    importc: "mlt_property_get_rect", dynlib: libName.}
proc mlt_property_anim_set_rect*(self: mlt_property; value: mlt_rect; fps: cdouble;
                                locale: locale_t; position: cint; length: cint;
                                keyframe_type: mlt_keyframe_type): cint {.cdecl,
    importc: "mlt_property_anim_set_rect", dynlib: libName.}
proc mlt_property_anim_get_rect*(self: mlt_property; fps: cdouble; locale: locale_t;
                                position: cint; length: cint): mlt_rect {.cdecl,
    importc: "mlt_property_anim_get_rect", dynlib: libName.}