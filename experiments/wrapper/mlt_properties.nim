## *
##  \file mlt_properties.h
##  \brief Properties class declaration
##  \see mlt_properties_s
##
##  Copyright (C) 2003-2020 Meltytech, LLC
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

## * \brief Properties class
##
##  Properties is a combination list/dictionary of name/::mlt_property pairs.
##  It is also a base class for many of the other MLT classes.
##
##  \event \em property-changed a property's value changed;
##    the event data is a string for the name of the property
##

type
  PropertiesS* {.importc: "mlt_properties_s", header: "mlt_properties.h", bycopy.} = object
    child* {.importc: "child".}: pointer ## *< \private the object of a subclass
    local* {.importc: "local".}: pointer ## *< \private instance object
                                     ## * the destructor virtual function
    close* {.importc: "close".}: Destructor
    closeObject* {.importc: "close_object".}: pointer ## *< the object supplied to the close virtual function
  Properties* = ptr PropertiesS


proc propertiesInit*(a1: Properties; child: pointer): cint {.cdecl,
    importc: "mlt_properties_init", dynlib: mltlib.}
proc propertiesNew*(): Properties {.cdecl, importc: "mlt_properties_new",
                                 dynlib: mltlib.}
proc propertiesSetLcnumeric*(a1: Properties; locale: cstring): cint {.cdecl,
    importc: "mlt_properties_set_lcnumeric", dynlib: mltlib.}
proc propertiesGetLcnumeric*(self: Properties): cstring {.cdecl,
    importc: "mlt_properties_get_lcnumeric", dynlib: mltlib.}
proc propertiesLoad*(file: cstring): Properties {.cdecl,
    importc: "mlt_properties_load", dynlib: mltlib.}
proc propertiesPreset*(self: Properties; name: cstring): cint {.cdecl,
    importc: "mlt_properties_preset", dynlib: mltlib.}
proc propertiesIncRef*(self: Properties): cint {.cdecl,
    importc: "mlt_properties_inc_ref", dynlib: mltlib.}
proc propertiesDecRef*(self: Properties): cint {.cdecl,
    importc: "mlt_properties_dec_ref", dynlib: mltlib.}
proc propertiesRefCount*(self: Properties): cint {.cdecl,
    importc: "mlt_properties_ref_count", dynlib: mltlib.}
proc propertiesMirror*(self: Properties; that: Properties) {.cdecl,
    importc: "mlt_properties_mirror", dynlib: mltlib.}
proc propertiesInherit*(self: Properties; that: Properties): cint {.cdecl,
    importc: "mlt_properties_inherit", dynlib: mltlib.}
proc propertiesPass*(self: Properties; that: Properties; prefix: cstring): cint {.cdecl,
    importc: "mlt_properties_pass", dynlib: mltlib.}
proc propertiesPassProperty*(self: Properties; that: Properties; name: cstring) {.
    cdecl, importc: "mlt_properties_pass_property", dynlib: mltlib.}
proc propertiesPassList*(self: Properties; that: Properties; list: cstring): cint {.
    cdecl, importc: "mlt_properties_pass_list", dynlib: mltlib.}
proc propertiesSet*(self: Properties; name: cstring; value: cstring): cint {.cdecl,
    importc: "mlt_properties_set", dynlib: mltlib.}
proc propertiesSetOrDefault*(self: Properties; name: cstring; value: cstring;
                            def: cstring): cint {.cdecl,
    importc: "mlt_properties_set_or_default", dynlib: mltlib.}
proc propertiesSetString*(self: Properties; name: cstring; value: cstring): cint {.
    cdecl, importc: "mlt_properties_set_string", dynlib: mltlib.}
proc propertiesParse*(self: Properties; namevalue: cstring): cint {.cdecl,
    importc: "mlt_properties_parse", dynlib: mltlib.}
proc propertiesGet*(self: Properties; name: cstring): cstring {.cdecl,
    importc: "mlt_properties_get", dynlib: mltlib.}
proc propertiesGetName*(self: Properties; index: cint): cstring {.cdecl,
    importc: "mlt_properties_get_name", dynlib: mltlib.}
proc propertiesGetValueTf*(self: Properties; index: cint; a3: TimeFormat): cstring {.
    cdecl, importc: "mlt_properties_get_value_tf", dynlib: mltlib.}
proc propertiesGetValue*(self: Properties; index: cint): cstring {.cdecl,
    importc: "mlt_properties_get_value", dynlib: mltlib.}
proc propertiesGetDataAt*(self: Properties; index: cint; size: ptr cint): pointer {.
    cdecl, importc: "mlt_properties_get_data_at", dynlib: mltlib.}
proc propertiesGetInt*(self: Properties; name: cstring): cint {.cdecl,
    importc: "mlt_properties_get_int", dynlib: mltlib.}
proc propertiesSetInt*(self: Properties; name: cstring; value: cint): cint {.cdecl,
    importc: "mlt_properties_set_int", dynlib: mltlib.}
proc propertiesGetInt64*(self: Properties; name: cstring): int {.cdecl,
    importc: "mlt_properties_get_int64", dynlib: mltlib.}
proc propertiesSetInt64*(self: Properties; name: cstring; value: int): cint {.cdecl,
    importc: "mlt_properties_set_int64", dynlib: mltlib.}
proc propertiesGetDouble*(self: Properties; name: cstring): cdouble {.cdecl,
    importc: "mlt_properties_get_double", dynlib: mltlib.}
proc propertiesSetDouble*(self: Properties; name: cstring; value: cdouble): cint {.
    cdecl, importc: "mlt_properties_set_double", dynlib: mltlib.}
proc propertiesGetPosition*(self: Properties; name: cstring): Position {.cdecl,
    importc: "mlt_properties_get_position", dynlib: mltlib.}
proc propertiesSetPosition*(self: Properties; name: cstring; value: Position): cint {.
    cdecl, importc: "mlt_properties_set_position", dynlib: mltlib.}
proc propertiesSetData*(self: Properties; name: cstring; value: pointer; length: cint;
                       a5: Destructor; a6: Serialiser): cint {.cdecl,
    importc: "mlt_properties_set_data", dynlib: mltlib.}
proc propertiesGetData*(self: Properties; name: cstring; length: ptr cint): pointer {.
    cdecl, importc: "mlt_properties_get_data", dynlib: mltlib.}
proc propertiesRename*(self: Properties; source: cstring; dest: cstring): cint {.cdecl,
    importc: "mlt_properties_rename", dynlib: mltlib.}
proc propertiesCount*(self: Properties): cint {.cdecl,
    importc: "mlt_properties_count", dynlib: mltlib.}
proc propertiesDump*(self: Properties; output: ptr File) {.cdecl,
    importc: "mlt_properties_dump", dynlib: mltlib.}
proc propertiesDebug*(self: Properties; title: cstring; output: ptr File) {.cdecl,
    importc: "mlt_properties_debug", dynlib: mltlib.}
proc propertiesSave*(a1: Properties; a2: cstring): cint {.cdecl,
    importc: "mlt_properties_save", dynlib: mltlib.}
proc propertiesDirList*(a1: Properties; a2: cstring; a3: cstring; a4: cint): cint {.cdecl,
    importc: "mlt_properties_dir_list", dynlib: mltlib.}
proc propertiesClose*(self: Properties) {.cdecl, importc: "mlt_properties_close",
                                       dynlib: mltlib.}
proc propertiesIsSequence*(self: Properties): cint {.cdecl,
    importc: "mlt_properties_is_sequence", dynlib: mltlib.}
proc propertiesParseYaml*(file: cstring): Properties {.cdecl,
    importc: "mlt_properties_parse_yaml", dynlib: mltlib.}
proc propertiesSerialiseYaml*(self: Properties): cstring {.cdecl,
    importc: "mlt_properties_serialise_yaml", dynlib: mltlib.}
proc propertiesLock*(self: Properties) {.cdecl, importc: "mlt_properties_lock",
                                      dynlib: mltlib.}
proc propertiesUnlock*(self: Properties) {.cdecl, importc: "mlt_properties_unlock",
                                        dynlib: mltlib.}
proc propertiesClear*(self: Properties; name: cstring) {.cdecl,
    importc: "mlt_properties_clear", dynlib: mltlib.}
proc propertiesExists*(self: Properties; name: cstring): cint {.cdecl,
    importc: "mlt_properties_exists", dynlib: mltlib.}
proc propertiesGetTime*(a1: Properties; name: cstring; a3: TimeFormat): cstring {.cdecl,
    importc: "mlt_properties_get_time", dynlib: mltlib.}
proc propertiesFramesToTime*(a1: Properties; a2: Position; a3: TimeFormat): cstring {.
    cdecl, importc: "mlt_properties_frames_to_time", dynlib: mltlib.}
proc propertiesTimeToFrames*(a1: Properties; time: cstring): Position {.cdecl,
    importc: "mlt_properties_time_to_frames", dynlib: mltlib.}
proc propertiesGetColor*(a1: Properties; name: cstring): Color {.cdecl,
    importc: "mlt_properties_get_color", dynlib: mltlib.}
proc propertiesSetColor*(a1: Properties; name: cstring; value: Color): cint {.cdecl,
    importc: "mlt_properties_set_color", dynlib: mltlib.}
proc propertiesAnimGet*(self: Properties; name: cstring; position: cint; length: cint): cstring {.
    cdecl, importc: "mlt_properties_anim_get", dynlib: mltlib.}
proc propertiesAnimSet*(self: Properties; name: cstring; value: cstring;
                       position: cint; length: cint): cint {.cdecl,
    importc: "mlt_properties_anim_set", dynlib: mltlib.}
proc propertiesAnimGetInt*(self: Properties; name: cstring; position: cint;
                          length: cint): cint {.cdecl,
    importc: "mlt_properties_anim_get_int", dynlib: mltlib.}
proc propertiesAnimSetInt*(self: Properties; name: cstring; value: cint;
                          position: cint; length: cint; keyframeType: KeyframeType): cint {.
    cdecl, importc: "mlt_properties_anim_set_int", dynlib: mltlib.}
proc propertiesAnimGetDouble*(self: Properties; name: cstring; position: cint;
                             length: cint): cdouble {.cdecl,
    importc: "mlt_properties_anim_get_double", dynlib: mltlib.}
proc propertiesAnimSetDouble*(self: Properties; name: cstring; value: cdouble;
                             position: cint; length: cint;
                             keyframeType: KeyframeType): cint {.cdecl,
    importc: "mlt_properties_anim_set_double", dynlib: mltlib.}
proc propertiesGetAnimation*(self: Properties; name: cstring): Animation {.cdecl,
    importc: "mlt_properties_get_animation", dynlib: mltlib.}
proc propertiesSetRect*(self: Properties; name: cstring; value: Rect): cint {.cdecl,
    importc: "mlt_properties_set_rect", dynlib: mltlib.}
proc propertiesGetRect*(self: Properties; name: cstring): Rect {.cdecl,
    importc: "mlt_properties_get_rect", dynlib: mltlib.}
proc propertiesAnimSetRect*(self: Properties; name: cstring; value: Rect;
                           position: cint; length: cint; keyframeType: KeyframeType): cint {.
    cdecl, importc: "mlt_properties_anim_set_rect", dynlib: mltlib.}
proc propertiesAnimGetRect*(self: Properties; name: cstring; position: cint;
                           length: cint): Rect {.cdecl,
    importc: "mlt_properties_anim_get_rect", dynlib: mltlib.}
proc propertiesFromUtf8*(properties: Properties; nameFrom: cstring; nameTo: cstring): cint {.
    cdecl, importc: "mlt_properties_from_utf8", dynlib: mltlib.}
proc propertiesToUtf8*(properties: Properties; nameFrom: cstring; nameTo: cstring): cint {.
    cdecl, importc: "mlt_properties_to_utf8", dynlib: mltlib.}