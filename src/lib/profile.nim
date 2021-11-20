# https://www.mltframework.org/docs/profiles/
import ../wrapper/mlt
import typs

proc newProfile*(name:string):Profile =
  result.data = mlt_profile_init(name.cstring)

proc newProfile*():Profile =
  result.data = mlt_profile_init(nil)


proc loadProfile*(filename:string):Profile =
  result.data = mlt_profile_load_file(filename.cstring)


proc fps*(p:Profile):float =
  mlt_profile_fps(p.data)

proc sar*(p:Profile):float =
  mlt_profile_sar(p.data)

proc dar*(p:Profile):float =
  mlt_profile_dar(p.data)

proc close*(p:Profile) =
  mlt_profile_close(p.data)

proc profileList*():Properties =
  result.data = mlt_profile_list()

#[
proc mlt_profile_load_properties*(properties: mlt_properties): mlt_profile 
proc mlt_profile_load_string*(string: cstring): mlt_profile 

proc 
proc mlt_profile_clone*(profile: mlt_profile): mlt_profile 

proc mlt_profile_from_producer*(profile: mlt_profile; producer: mlt_producer) 
proc mlt_profile_lumas_dir*(profile: mlt_profile): cstring 
proc mlt_profile_scale_width*(profile: mlt_profile; width: cint): cdouble 
proc mlt_profile_scale_height*(profile: mlt_profile; height: cint): cdouble 
]#


#[
description=DV PAL
frame_rate_num=25
frame_rate_den=1
width=720
height=576
progressive=0
sample_aspect_num=59
sample_aspect_den=54
display_aspect_num=4
display_aspect_den=3
colorspace=601  
]#
#[
num = numerator
den = denominator
Description is optional, but recommended
A num/den lets you specify a fraction without rounding errors introduced by floating point.
A “name” can be specified. Normally, name is the basename of the filename, typically equivalent to MLT_PROFILE. However, if an application is setting profiles through a properties object or string, then it should include a “name” property.
When you specify a document to load from the system directory of profiles, you use the document’s file name without its path (basename).
The system profiles directory is $prefix/share/mlt/profiles 
]#