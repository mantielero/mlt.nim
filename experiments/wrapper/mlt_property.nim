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
type
  LocaleT* = cstring
  

##  #include "mlt_types.h"
##
##  #if defined(__FreeBSD__)
##  /* This header has existed since 1994 and defines __FreeBSD_version below. */
##  #include <sys/param.h>
##  #endif
##
##  #if (defined(__GLIBC__) && !defined(__APPLE__)) || defined(HAVE_LOCALE_H)
##  #  include <locale.h>
##  #elif defined(__APPLE__) || (defined(__FreeBSD_version) && __FreeBSD_version >= 900506)
##  #  include <xlocale.h>
##  #elif defined(__OpenBSD__)
##  /* XXX matches __nop_locale glue in libc++ */
##  typedef void* locale_t;
##  #else
##  typedef char* locale_t;
##  #endif

proc propertyInit*(): Property {.cdecl, importc: "mlt_property_init", dynlib: mltlib.}
proc propertyClear*(self: Property) {.cdecl, importc: "mlt_property_clear",
                                   dynlib: mltlib.}
proc propertyIsClear*(self: Property): cint {.cdecl,
    importc: "mlt_property_is_clear", dynlib: mltlib.}
proc propertySetInt*(self: Property; value: cint): cint {.cdecl,
    importc: "mlt_property_set_int", dynlib: mltlib.}
proc propertySetDouble*(self: Property; value: cdouble): cint {.cdecl,
    importc: "mlt_property_set_double", dynlib: mltlib.}
proc propertySetPosition*(self: Property; value: Position): cint {.cdecl,
    importc: "mlt_property_set_position", dynlib: mltlib.}
proc propertySetInt64*(self: Property; value: int): cint {.cdecl,
    importc: "mlt_property_set_int64", dynlib: mltlib.}
proc propertySetString*(self: Property; value: cstring): cint {.cdecl,
    importc: "mlt_property_set_string", dynlib: mltlib.}
proc propertySetData*(self: Property; value: pointer; length: cint;
                     destructor: Destructor; serialiser: Serialiser): cint {.cdecl,
    importc: "mlt_property_set_data", dynlib: mltlib.}
proc propertyGetInt*(self: Property; fps: cdouble; a3: LocaleT): cint {.cdecl,
    importc: "mlt_property_get_int", dynlib: mltlib.}
proc propertyGetDouble*(self: Property; fps: cdouble; a3: LocaleT): cdouble {.cdecl,
    importc: "mlt_property_get_double", dynlib: mltlib.}
proc propertyGetPosition*(self: Property; fps: cdouble; a3: LocaleT): Position {.cdecl,
    importc: "mlt_property_get_position", dynlib: mltlib.}
proc propertyGetInt64*(self: Property): int {.cdecl,
    importc: "mlt_property_get_int64", dynlib: mltlib.}
proc propertyGetStringTf*(self: Property; a2: TimeFormat): cstring {.cdecl,
    importc: "mlt_property_get_string_tf", dynlib: mltlib.}
proc propertyGetString*(self: Property): cstring {.cdecl,
    importc: "mlt_property_get_string", dynlib: mltlib.}
proc propertyGetStringLTf*(self: Property; a2: LocaleT; a3: TimeFormat): cstring {.
    cdecl, importc: "mlt_property_get_string_l_tf", dynlib: mltlib.}
proc propertyGetStringL*(self: Property; a2: LocaleT): cstring {.cdecl,
    importc: "mlt_property_get_string_l", dynlib: mltlib.}
proc propertyGetData*(self: Property; length: ptr cint): pointer {.cdecl,
    importc: "mlt_property_get_data", dynlib: mltlib.}
proc propertyClose*(self: Property) {.cdecl, importc: "mlt_property_close",
                                   dynlib: mltlib.}
proc propertyPass*(self: Property; that: Property) {.cdecl,
    importc: "mlt_property_pass", dynlib: mltlib.}
proc propertyGetTime*(self: Property; a2: TimeFormat; fps: cdouble; a4: LocaleT): cstring {.
    cdecl, importc: "mlt_property_get_time", dynlib: mltlib.}
proc propertyInterpolate*(self: Property; points: ptr Property; progress: cdouble;
                         fps: cdouble; locale: LocaleT; interp: KeyframeType): cint {.
    cdecl, importc: "mlt_property_interpolate", dynlib: mltlib.}
proc propertyAnimGetDouble*(self: Property; fps: cdouble; locale: LocaleT;
                           position: cint; length: cint): cdouble {.cdecl,
    importc: "mlt_property_anim_get_double", dynlib: mltlib.}
proc propertyAnimGetInt*(self: Property; fps: cdouble; locale: LocaleT; position: cint;
                        length: cint): cint {.cdecl,
    importc: "mlt_property_anim_get_int", dynlib: mltlib.}
proc propertyAnimGetString*(self: Property; fps: cdouble; locale: LocaleT;
                           position: cint; length: cint): cstring {.cdecl,
    importc: "mlt_property_anim_get_string", dynlib: mltlib.}
proc propertyAnimSetDouble*(self: Property; value: cdouble; fps: cdouble;
                           locale: LocaleT; position: cint; length: cint;
                           keyframeType: KeyframeType): cint {.cdecl,
    importc: "mlt_property_anim_set_double", dynlib: mltlib.}
proc propertyAnimSetInt*(self: Property; value: cint; fps: cdouble; locale: LocaleT;
                        position: cint; length: cint; keyframeType: KeyframeType): cint {.
    cdecl, importc: "mlt_property_anim_set_int", dynlib: mltlib.}
proc propertyAnimSetString*(self: Property; value: cstring; fps: cdouble;
                           locale: LocaleT; position: cint; length: cint): cint {.
    cdecl, importc: "mlt_property_anim_set_string", dynlib: mltlib.}
proc propertyGetAnimation*(self: Property): Animation {.cdecl,
    importc: "mlt_property_get_animation", dynlib: mltlib.}
proc propertySetRect*(self: Property; value: Rect): cint {.cdecl,
    importc: "mlt_property_set_rect", dynlib: mltlib.}
proc propertyGetRect*(self: Property; locale: LocaleT): Rect {.cdecl,
    importc: "mlt_property_get_rect", dynlib: mltlib.}
proc propertyAnimSetRect*(self: Property; value: Rect; fps: cdouble; locale: LocaleT;
                         position: cint; length: cint; keyframeType: KeyframeType): cint {.
    cdecl, importc: "mlt_property_anim_set_rect", dynlib: mltlib.}
proc propertyAnimGetRect*(self: Property; fps: cdouble; locale: LocaleT;
                         position: cint; length: cint): Rect {.cdecl,
    importc: "mlt_property_anim_get_rect", dynlib: mltlib.}