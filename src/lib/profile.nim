# https://www.mltframework.org/docs/profiles/
# https://en.wikipedia.org/wiki/Pixel_aspect_ratio
#[
PAR=Pixel Aspect Ratio
DAR=Display Aspect Ratio
SAR= Storage Aspect Ratio (ratio of pixels dimensions)

SAR × PAR = DAR.

SAR= 720/360 = 2
DAR= 16/9

PAR = DAR/ SAR = 16/9 /2 = 16 / 18

PAR = (DARn * SARd) / (DARd * SARn) ) 
]#
import ../wrapper/mlt
import typs, strformat

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


proc fromProducer*(p:var Profile; producer:Producer) =
  mlt_profile_from_producer(p.data, producer.data) 


proc clone*(p:Profile):Profile =
  result.data = mlt_profile_clone( p.data )

#-------------
proc description*(p:Profile):string =
  $p.data.description

proc height*(p:Profile):int =
  p.data.height.int

proc width*(p:Profile):int =
  p.data.width.int

proc frameRate*(p:Profile):tuple[num,den:int] =
  (p.data.frame_rate_num.int, p.data.frame_rate_den.int)

proc sampleAspect*(p:Profile):tuple[num,den:int] =
  (p.data.sample_aspect_num.int, p.data.sample_aspect_den.int)

proc displayAspect*(p:Profile):tuple[num,den:int] =
  (p.data.display_aspect_num.int, p.data.display_aspect_den.int)

proc colorSpace*(p:Profile):int =
  p.data.colorspace.int

proc progressive*(p:Profile):bool =
  p.data.progressive.int == 1


proc `$`*(p:Profile):string =
  result = &"Profile: {p.description}\n"
  result &= &"  width x height: {p.width} x {p.height}\n"
  result &= &"  sample aspect: {p.sampleAspect}\n"
  result &= &"  display aspect: {p.displayAspect}\n"  

#[
description=HD 720p 50 fps
frame_rate_num=50
frame_rate_den=1
width=1280
height=720
progressive=1
sample_aspect_num=1
sample_aspect_den=1
display_aspect_num=16
display_aspect_den=9
colorspace=709
]#


proc setDescription*(p:Profile; description:string) =
  p.data.description = description.cstring

proc setHeight*(p:var Profile; height:int) =
  p.data.height = height.cint

proc setWidth*(p:Profile; width:int) =
  p.data.width = width.cint


proc setSampleAspect*(p:Profile; num,den:int) =
  p.data.sample_aspect_num = num.cint
  p.data.sample_aspect_den = den.cint

proc setDisplayAspect*(p:Profile; num,den:int) =
  p.data.display_aspect_num = num.cint
  p.data.display_aspect_den = den.cint


#proc scaleWidth(p:var Profile; width)
#proc mlt_profile_scale_width*(profile: mlt_profile; width: cint): cdouble 
#proc mlt_profile_scale_height*(profile: mlt_profile; height: cint): cdouble 

#[
proc mlt_profile_load_properties*(properties: mlt_properties): mlt_profile 
proc mlt_profile_load_string*(string: cstring): mlt_profile 

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

#[
$ cat /usr/share/mlt-7/profiles/hdv_720_50p 
description=HD 720p 50 fps
frame_rate_num=50
frame_rate_den=1
width=1280
height=720
progressive=1
sample_aspect_num=1
sample_aspect_den=1
display_aspect_num=16
display_aspect_den=9
colorspace=709

]#