import ../wrapper/mlt
import typs, os, std/strformat




proc set*(self:Properties; name:string; value:float) =
  let res = mlt_properties_set_double(self, name.cstring, value.cdouble)
  if res > 0:
    quit("""unable to set property "{name}" """)

proc set*(self:Properties; name, value:string) =
  let res = mlt_properties_set_string(self, name.cstring, value.cstring)
  if res > 0:
    quit("""unable to set property "{name}" """)

proc `[]=`*[T:float|string](self:Properties; name:string; value:T) =
  set(self, name, value)

#[
proc mlt_properties_init*(a1: mlt_properties; child: pointer): cint
proc mlt_properties_new*(): mlt_properties
proc mlt_properties_set_lcnumeric*(a1: mlt_properties; locale: cstring): cint
proc mlt_properties_get_lcnumeric*(self: mlt_properties): cstring
proc mlt_properties_load*(file: cstring): mlt_properties
proc mlt_properties_preset*(self: mlt_properties; name: cstring): cint
proc mlt_properties_inc_ref*(self: mlt_properties): cint
proc mlt_properties_dec_ref*(self: mlt_properties): cint
proc mlt_properties_ref_count*(self: mlt_properties): cint
proc mlt_properties_mirror*(self: mlt_properties; that: mlt_properties)
proc mlt_properties_inherit*(self: mlt_properties; that: mlt_properties): cint
proc mlt_properties_pass*(self: mlt_properties; that: mlt_properties;
                          prefix: cstring): cint
proc mlt_properties_pass_property*(self: mlt_properties; that: mlt_properties;
                                   name: cstring)
proc mlt_properties_pass_list*(self: mlt_properties; that: mlt_properties;
                               list: cstring): cint
proc mlt_properties_set*(self: mlt_properties; name: cstring; value: cstring): cint
proc mlt_properties_set_or_default*(self: mlt_properties; name: cstring;
                                    value: cstring; def: cstring): cint

proc mlt_properties_parse*(self: mlt_properties; namevalue: cstring): cint
proc mlt_properties_get*(self: mlt_properties; name: cstring): cstring
proc mlt_properties_get_name*(self: mlt_properties; index: cint): cstring
proc mlt_properties_get_value_tf*(self: mlt_properties; index: cint;
                                  a3: mlt_time_format): cstring
proc mlt_properties_get_value*(self: mlt_properties; index: cint): cstring
proc mlt_properties_get_data_at*(self: mlt_properties; index: cint;
                                 size: ptr cint): pointer
proc mlt_properties_get_int*(self: mlt_properties; name: cstring): cint
proc mlt_properties_set_int*(self: mlt_properties; name: cstring; value: cint): cint
proc mlt_properties_get_int64*(self: mlt_properties; name: cstring): int64
proc mlt_properties_set_int64*(self: mlt_properties; name: cstring; value: int64): cint
proc mlt_properties_get_double*(self: mlt_properties; name: cstring): cdouble

proc mlt_properties_get_position*(self: mlt_properties; name: cstring): mlt_position
proc mlt_properties_set_position*(self: mlt_properties; name: cstring;
                                  value: mlt_position): cint
proc mlt_properties_set_data*(self: mlt_properties; name: cstring;
                              value: pointer; length: cint; a5: mlt_destructor;
                              a6: mlt_serialiser): cint
proc mlt_properties_get_data*(self: mlt_properties; name: cstring;
                              length: ptr cint): pointer
proc mlt_properties_rename*(self: mlt_properties; source: cstring; dest: cstring): cint
proc mlt_properties_count*(self: mlt_properties): cint
proc mlt_properties_dump*(self: mlt_properties; output: File)
proc mlt_properties_debug*(self: mlt_properties; title: cstring; output: File)
proc mlt_properties_save*(a1: mlt_properties; a2: cstring): cint
proc mlt_properties_dir_list*(a1: mlt_properties; a2: cstring; a3: cstring;
                              a4: cint): cint
proc mlt_properties_close*(self: mlt_properties)
proc mlt_properties_is_sequence*(self: mlt_properties): cint
proc mlt_properties_parse_yaml*(file: cstring): mlt_properties
proc mlt_properties_serialise_yaml*(self: mlt_properties): cstring
proc mlt_properties_lock*(self: mlt_properties)
proc mlt_properties_unlock*(self: mlt_properties)
proc mlt_properties_clear*(self: mlt_properties; name: cstring)
proc mlt_properties_exists*(self: mlt_properties; name: cstring): cint
proc mlt_properties_get_time*(a1: mlt_properties; name: cstring;
                              a3: mlt_time_format): cstring
proc mlt_properties_frames_to_time*(a1: mlt_properties; a2: mlt_position;
                                    a3: mlt_time_format): cstring
proc mlt_properties_time_to_frames*(a1: mlt_properties; time: cstring): mlt_position
proc mlt_properties_get_color*(a1: mlt_properties; name: cstring): mlt_color
proc mlt_properties_set_color*(a1: mlt_properties; name: cstring;
                               value: mlt_color): cint
proc mlt_properties_anim_get*(self: mlt_properties; name: cstring;
                              position: cint; length: cint): cstring
proc mlt_properties_anim_set*(self: mlt_properties; name: cstring;
                              value: cstring; position: cint; length: cint): cint
proc mlt_properties_anim_get_int*(self: mlt_properties; name: cstring;
                                  position: cint; length: cint): cint
proc mlt_properties_anim_set_int*(self: mlt_properties; name: cstring;
                                  value: cint; position: cint; length: cint;
                                  keyframe_type: mlt_keyframe_type): cint
proc mlt_properties_anim_get_double*(self: mlt_properties; name: cstring;
                                     position: cint; length: cint): cdouble
proc mlt_properties_anim_set_double*(self: mlt_properties; name: cstring;
                                     value: cdouble; position: cint;
                                     length: cint;
                                     keyframe_type: mlt_keyframe_type): cint
proc mlt_properties_get_animation*(self: mlt_properties; name: cstring): mlt_animation
proc mlt_properties_set_rect*(self: mlt_properties; name: cstring;
                              value: mlt_rect): cint
proc mlt_properties_get_rect*(self: mlt_properties; name: cstring): mlt_rect
proc mlt_properties_anim_set_rect*(self: mlt_properties; name: cstring;
                                   value: mlt_rect; position: cint;
                                   length: cint;
                                   keyframe_type: mlt_keyframe_type): cint
proc mlt_properties_anim_get_rect*(self: mlt_properties; name: cstring;
                                   position: cint; length: cint): mlt_rect
proc mlt_properties_from_utf8*(properties: mlt_properties; name_from: cstring;
                               name_to: cstring): cint
proc mlt_properties_to_utf8*(properties: mlt_properties; name_from: cstring;
                             name_to: cstring): cint
proc mlt_properties_set_properties*(self: mlt_properties; name: cstring;
                                    properties: mlt_properties): cint
proc mlt_properties_get_properties*(self: mlt_properties; name: cstring): mlt_properties
proc mlt_properties_get_properties_at*(self: mlt_properties; index: cint): mlt_properties

]#