import ../wrapper/mlt
import typs

proc newProfile*(name:string):Profile =
  mlt_profile_init(name.cstring)

proc newProfile*():Profile =
  mlt_profile_init(nil)



#[
proc mlt_profile_init*(name: cstring): mlt_profile 
proc mlt_profile_load_file*(file: cstring): mlt_profile 
proc mlt_profile_load_properties*(properties: mlt_properties): mlt_profile 
proc mlt_profile_load_string*(string: cstring): mlt_profile 
proc mlt_profile_fps*(profile: mlt_profile): cdouble 
proc mlt_profile_sar*(profile: mlt_profile): cdouble 
proc mlt_profile_dar*(profile: mlt_profile): cdouble 
proc mlt_profile_close*(profile: mlt_profile) 
proc mlt_profile_clone*(profile: mlt_profile): mlt_profile 
proc mlt_profile_list*(): mlt_properties
proc mlt_profile_from_producer*(profile: mlt_profile; producer: mlt_producer) 
proc mlt_profile_lumas_dir*(profile: mlt_profile): cstring 
proc mlt_profile_scale_width*(profile: mlt_profile; width: cint): cdouble 
proc mlt_profile_scale_height*(profile: mlt_profile; height: cint): cdouble 
]#