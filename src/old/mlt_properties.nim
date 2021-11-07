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
  mlt_types, mlt_events

## * \brief Properties class
##
##  Properties is a combination list/dictionary of name/::mlt_property pairs.
##  It is also a base class for many of the other MLT classes.
##

type
  mlt_properties_s* {.bycopy.} = object
    child*: pointer            ## *< \private the object of a subclass
    local*: pointer            ## *< \private instance object
                  ## * the destructor virtual function
    close*: mlt_destructor
    close_object*: pointer     ## *< the object supplied to the close virtual function
  mlt_properties* = ptr mlt_properties_s

proc mlt_properties_init*(a1: mlt_properties; child: pointer): cint {.cdecl,
    importc: "mlt_properties_init", dynlib: libName.}
proc mlt_properties_new*(): mlt_properties {.cdecl, importc: "mlt_properties_new",
    dynlib: libName.}
proc mlt_properties_set_lcnumeric*(a1: mlt_properties; locale: cstring): cint {.cdecl,
    importc: "mlt_properties_set_lcnumeric", dynlib: libName.}
proc mlt_properties_get_lcnumeric*(self: mlt_properties): cstring {.cdecl,
    importc: "mlt_properties_get_lcnumeric", dynlib: libName.}
proc mlt_properties_load*(file: cstring): mlt_properties {.cdecl,
    importc: "mlt_properties_load", dynlib: libName.}
proc mlt_properties_preset*(self: mlt_properties; name: cstring): cint {.cdecl,
    importc: "mlt_properties_preset", dynlib: libName.}
proc mlt_properties_inc_ref*(self: mlt_properties): cint {.cdecl,
    importc: "mlt_properties_inc_ref", dynlib: libName.}
proc mlt_properties_dec_ref*(self: mlt_properties): cint {.cdecl,
    importc: "mlt_properties_dec_ref", dynlib: libName.}
proc mlt_properties_ref_count*(self: mlt_properties): cint {.cdecl,
    importc: "mlt_properties_ref_count", dynlib: libName.}
proc mlt_properties_mirror*(self: mlt_properties; that: mlt_properties) {.cdecl,
    importc: "mlt_properties_mirror", dynlib: libName.}
proc mlt_properties_inherit*(self: mlt_properties; that: mlt_properties): cint {.
    cdecl, importc: "mlt_properties_inherit", dynlib: libName.}
proc mlt_properties_pass*(self: mlt_properties; that: mlt_properties; prefix: cstring): cint {.
    cdecl, importc: "mlt_properties_pass", dynlib: libName.}
proc mlt_properties_pass_property*(self: mlt_properties; that: mlt_properties;
                                  name: cstring) {.cdecl,
    importc: "mlt_properties_pass_property", dynlib: libName.}
proc mlt_properties_pass_list*(self: mlt_properties; that: mlt_properties;
                              list: cstring): cint {.cdecl,
    importc: "mlt_properties_pass_list", dynlib: libName.}
proc mlt_properties_set*(self: mlt_properties; name: cstring; value: cstring): cint {.
    cdecl, importc: "mlt_properties_set", dynlib: libName.}
proc mlt_properties_set_or_default*(self: mlt_properties; name: cstring;
                                   value: cstring; def: cstring): cint {.cdecl,
    importc: "mlt_properties_set_or_default", dynlib: libName.}
proc mlt_properties_set_string*(self: mlt_properties; name: cstring; value: cstring): cint {.
    cdecl, importc: "mlt_properties_set_string", dynlib: libName.}
proc mlt_properties_parse*(self: mlt_properties; namevalue: cstring): cint {.cdecl,
    importc: "mlt_properties_parse", dynlib: libName.}
proc mlt_properties_get*(self: mlt_properties; name: cstring): cstring {.cdecl,
    importc: "mlt_properties_get", dynlib: libName.}
proc mlt_properties_get_name*(self: mlt_properties; index: cint): cstring {.cdecl,
    importc: "mlt_properties_get_name", dynlib: libName.}
proc mlt_properties_get_value_tf*(self: mlt_properties; index: cint;
                                 a3: mlt_time_format): cstring {.cdecl,
    importc: "mlt_properties_get_value_tf", dynlib: libName.}
proc mlt_properties_get_value*(self: mlt_properties; index: cint): cstring {.cdecl,
    importc: "mlt_properties_get_value", dynlib: libName.}
proc mlt_properties_get_data_at*(self: mlt_properties; index: cint; size: ptr cint): pointer {.
    cdecl, importc: "mlt_properties_get_data_at", dynlib: libName.}
proc mlt_properties_get_int*(self: mlt_properties; name: cstring): cint {.cdecl,
    importc: "mlt_properties_get_int", dynlib: libName.}
proc mlt_properties_set_int*(self: mlt_properties; name: cstring; value: cint): cint {.
    cdecl, importc: "mlt_properties_set_int", dynlib: libName.}
proc mlt_properties_get_int64*(self: mlt_properties; name: cstring): cint {.cdecl,
    importc: "mlt_properties_get_int64", dynlib: libName.}
proc mlt_properties_set_int64*(self: mlt_properties; name: cstring; value: cint): cint {.
    cdecl, importc: "mlt_properties_set_int64", dynlib: libName.}
proc mlt_properties_get_double*(self: mlt_properties; name: cstring): cdouble {.cdecl,
    importc: "mlt_properties_get_double", dynlib: libName.}
proc mlt_properties_set_double*(self: mlt_properties; name: cstring; value: cdouble): cint {.
    cdecl, importc: "mlt_properties_set_double", dynlib: libName.}
proc mlt_properties_get_position*(self: mlt_properties; name: cstring): mlt_position {.
    cdecl, importc: "mlt_properties_get_position", dynlib: libName.}
proc mlt_properties_set_position*(self: mlt_properties; name: cstring;
                                 value: mlt_position): cint {.cdecl,
    importc: "mlt_properties_set_position", dynlib: libName.}
proc mlt_properties_set_data*(self: mlt_properties; name: cstring; value: pointer;
                             length: cint; a5: mlt_destructor; a6: mlt_serialiser): cint {.
    cdecl, importc: "mlt_properties_set_data", dynlib: libName.}
proc mlt_properties_get_data*(self: mlt_properties; name: cstring; length: ptr cint): pointer {.
    cdecl, importc: "mlt_properties_get_data", dynlib: libName.}
proc mlt_properties_rename*(self: mlt_properties; source: cstring; dest: cstring): cint {.
    cdecl, importc: "mlt_properties_rename", dynlib: libName.}
proc mlt_properties_count*(self: mlt_properties): cint {.cdecl,
    importc: "mlt_properties_count", dynlib: libName.}
proc mlt_properties_dump*(self: mlt_properties; output: ptr FILE) {.cdecl,
    importc: "mlt_properties_dump", dynlib: libName.}
proc mlt_properties_debug*(self: mlt_properties; title: cstring; output: ptr FILE) {.
    cdecl, importc: "mlt_properties_debug", dynlib: libName.}
proc mlt_properties_save*(a1: mlt_properties; a2: cstring): cint {.cdecl,
    importc: "mlt_properties_save", dynlib: libName.}
proc mlt_properties_dir_list*(a1: mlt_properties; a2: cstring; a3: cstring; a4: cint): cint {.
    cdecl, importc: "mlt_properties_dir_list", dynlib: libName.}
proc mlt_properties_close*(self: mlt_properties) {.cdecl,
    importc: "mlt_properties_close", dynlib: libName.}
proc mlt_properties_is_sequence*(self: mlt_properties): cint {.cdecl,
    importc: "mlt_properties_is_sequence", dynlib: libName.}
proc mlt_properties_parse_yaml*(file: cstring): mlt_properties {.cdecl,
    importc: "mlt_properties_parse_yaml", dynlib: libName.}
proc mlt_properties_serialise_yaml*(self: mlt_properties): cstring {.cdecl,
    importc: "mlt_properties_serialise_yaml", dynlib: libName.}
proc mlt_properties_lock*(self: mlt_properties) {.cdecl,
    importc: "mlt_properties_lock", dynlib: libName.}
proc mlt_properties_unlock*(self: mlt_properties) {.cdecl,
    importc: "mlt_properties_unlock", dynlib: libName.}
proc mlt_properties_clear*(self: mlt_properties; name: cstring) {.cdecl,
    importc: "mlt_properties_clear", dynlib: libName.}
proc mlt_properties_get_time*(a1: mlt_properties; name: cstring; a3: mlt_time_format): cstring {.
    cdecl, importc: "mlt_properties_get_time", dynlib: libName.}
proc mlt_properties_frames_to_time*(a1: mlt_properties; a2: mlt_position;
                                   a3: mlt_time_format): cstring {.cdecl,
    importc: "mlt_properties_frames_to_time", dynlib: libName.}
proc mlt_properties_time_to_frames*(a1: mlt_properties; time: cstring): mlt_position {.
    cdecl, importc: "mlt_properties_time_to_frames", dynlib: libName.}
proc mlt_properties_get_color*(a1: mlt_properties; name: cstring): mlt_color {.cdecl,
    importc: "mlt_properties_get_color", dynlib: libName.}
proc mlt_properties_set_color*(a1: mlt_properties; name: cstring; value: mlt_color): cint {.
    cdecl, importc: "mlt_properties_set_color", dynlib: libName.}
proc mlt_properties_anim_get*(self: mlt_properties; name: cstring; position: cint;
                             length: cint): cstring {.cdecl,
    importc: "mlt_properties_anim_get", dynlib: libName.}
proc mlt_properties_anim_set*(self: mlt_properties; name: cstring; value: cstring;
                             position: cint; length: cint): cint {.cdecl,
    importc: "mlt_properties_anim_set", dynlib: libName.}
proc mlt_properties_anim_get_int*(self: mlt_properties; name: cstring;
                                 position: cint; length: cint): cint {.cdecl,
    importc: "mlt_properties_anim_get_int", dynlib: libName.}
proc mlt_properties_anim_set_int*(self: mlt_properties; name: cstring; value: cint;
                                 position: cint; length: cint;
                                 keyframe_type: mlt_keyframe_type): cint {.cdecl,
    importc: "mlt_properties_anim_set_int", dynlib: libName.}
proc mlt_properties_anim_get_double*(self: mlt_properties; name: cstring;
                                    position: cint; length: cint): cdouble {.cdecl,
    importc: "mlt_properties_anim_get_double", dynlib: libName.}
proc mlt_properties_anim_set_double*(self: mlt_properties; name: cstring;
                                    value: cdouble; position: cint; length: cint;
                                    keyframe_type: mlt_keyframe_type): cint {.
    cdecl, importc: "mlt_properties_anim_set_double", dynlib: libName.}
proc mlt_properties_get_animation*(self: mlt_properties; name: cstring): mlt_animation {.
    cdecl, importc: "mlt_properties_get_animation", dynlib: libName.}
proc mlt_properties_set_rect*(self: mlt_properties; name: cstring; value: mlt_rect): cint {.
    cdecl, importc: "mlt_properties_set_rect", dynlib: libName.}
proc mlt_properties_get_rect*(self: mlt_properties; name: cstring): mlt_rect {.cdecl,
    importc: "mlt_properties_get_rect", dynlib: libName.}
proc mlt_properties_anim_set_rect*(self: mlt_properties; name: cstring;
                                  value: mlt_rect; position: cint; length: cint;
                                  keyframe_type: mlt_keyframe_type): cint {.cdecl,
    importc: "mlt_properties_anim_set_rect", dynlib: libName.}
proc mlt_properties_anim_get_rect*(self: mlt_properties; name: cstring;
                                  position: cint; length: cint): mlt_rect {.cdecl,
    importc: "mlt_properties_anim_get_rect", dynlib: libName.}
proc mlt_properties_from_utf8*(properties: mlt_properties; name_from: cstring;
                              name_to: cstring): cint {.cdecl,
    importc: "mlt_properties_from_utf8", dynlib: libName.}
proc mlt_properties_to_utf8*(properties: mlt_properties; name_from: cstring;
                            name_to: cstring): cint {.cdecl,
    importc: "mlt_properties_to_utf8", dynlib: libName.}