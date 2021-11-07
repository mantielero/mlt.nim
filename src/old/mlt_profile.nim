## *
##  \file mlt_profile.h
##  \brief video output definition
##  \see mlt_profile_s
##
##  Copyright (C) 2007-2018 Meltytech, LLC
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
type
  mlt_properties_s {.bycopy.} = object
    child*: pointer            ## *< \private the object of a subclass
    local*: pointer            ## *< \private instance object
                  ## * the destructor virtual function
    close*: mlt_destructor
    close_object*: pointer     ## *< the object supplied to the close virtual function
  mlt_properties = ptr mlt_properties_s
## * \brief Profile class
##
##  \envvar \em MLT_PROFILES_PATH overrides the default full path to the profile preset files, defaults to \p MLT_DATA/profiles
##  \envvar \em MLT_PROFILE the profile preset to use, defaults to "dv_pal"
##

type
  mlt_profile_s* {.bycopy.} = object
    description*: cstring      ## *< a brief description suitable as a label in UI menu
    frame_rate_num*: cint      ## *< the numerator of the video frame rate
    frame_rate_den*: cint      ## *< the denominator of the video frame rate
    width*: cint               ## *< the horizontal resolution of the video
    height*: cint              ## *< the vertical resolution of the video
    progressive*: cint         ## *< a flag to indicate if the video is progressive scan, interlace if not set
    sample_aspect_num*: cint   ## *< the numerator of the pixel aspect ratio
    sample_aspect_den*: cint   ## *< the denominator of the pixel aspect ratio
    display_aspect_num*: cint  ## *< the numerator of the image aspect ratio in case it can not be simply derived (e.g. ITU-R 601)
    display_aspect_den*: cint  ## *< the denominator of the image aspect ratio in case it can not be simply derived (e.g. ITU-R 601)
    colorspace*: cint          ## *< the Y'CbCr colorspace standard: =601 for ITU-R 601, =709 for ITU-R 709, or =240 for SMPTE240M
    is_explicit*: cint         ## *< used internally to indicate if the profile was requested explicitly or computed or defaulted


proc mlt_profile_init*(name: cstring): mlt_profile {.cdecl,
    importc: "mlt_profile_init", dynlib: libName.}
proc mlt_profile_load_file*(file: cstring): mlt_profile {.cdecl,
    importc: "mlt_profile_load_file", dynlib: libName.}
proc mlt_profile_load_properties*(properties: mlt_properties): mlt_profile {.cdecl,
    importc: "mlt_profile_load_properties", dynlib: libName.}
proc mlt_profile_load_string*(string: cstring): mlt_profile {.cdecl,
    importc: "mlt_profile_load_string", dynlib: libName.}
proc mlt_profile_fps*(profile: mlt_profile): cdouble {.cdecl,
    importc: "mlt_profile_fps", dynlib: libName.}
proc mlt_profile_sar*(profile: mlt_profile): cdouble {.cdecl,
    importc: "mlt_profile_sar", dynlib: libName.}
proc mlt_profile_dar*(profile: mlt_profile): cdouble {.cdecl,
    importc: "mlt_profile_dar", dynlib: libName.}
proc mlt_profile_close*(profile: mlt_profile) {.cdecl, importc: "mlt_profile_close",
    dynlib: libName.}
proc mlt_profile_clone*(profile: mlt_profile): mlt_profile {.cdecl,
    importc: "mlt_profile_clone", dynlib: libName.}
proc mlt_profile_list*(): mlt_properties {.cdecl, importc: "mlt_profile_list",
                                        dynlib: libName.}
proc mlt_profile_from_producer*(profile: mlt_profile; producer: mlt_producer) {.
    cdecl, importc: "mlt_profile_from_producer", dynlib: libName.}
proc mlt_profile_lumas_dir*(profile: mlt_profile): cstring {.cdecl,
    importc: "mlt_profile_lumas_dir", dynlib: libName.}
proc mlt_profile_scale_width*(profile: mlt_profile; width: cint): cdouble {.cdecl,
    importc: "mlt_profile_scale_width", dynlib: libName.}
proc mlt_profile_scale_height*(profile: mlt_profile; height: cint): cdouble {.cdecl,
    importc: "mlt_profile_scale_height", dynlib: libName.}