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

## * \brief Profile class
##
##  \envvar \em MLT_PROFILES_PATH overrides the default full path to the profile preset files, defaults to \p MLT_DATA/profiles
##  \envvar \em MLT_PROFILE the profile preset to use, defaults to "dv_pal"
##

type
  ProfileS* {.importc: "mlt_profile_s", header: "mlt_profile.h", bycopy.} = object
    description* {.importc: "description".}: cstring ## *< a brief description suitable as a label in UI menu
    frameRateNum* {.importc: "frame_rate_num".}: cint ## *< the numerator of the video frame rate
    frameRateDen* {.importc: "frame_rate_den".}: cint ## *< the denominator of the video frame rate
    width* {.importc: "width".}: cint ## *< the horizontal resolution of the video
    height* {.importc: "height".}: cint ## *< the vertical resolution of the video
    progressive* {.importc: "progressive".}: cint ## *< a flag to indicate if the video is progressive scan, interlace if not set
    sampleAspectNum* {.importc: "sample_aspect_num".}: cint ## *< the numerator of the pixel aspect ratio
    sampleAspectDen* {.importc: "sample_aspect_den".}: cint ## *< the denominator of the pixel aspect ratio
    displayAspectNum* {.importc: "display_aspect_num".}: cint ## *< the numerator of the image aspect ratio in case it can not be simply derived (e.g. ITU-R 601)
    displayAspectDen* {.importc: "display_aspect_den".}: cint ## *< the denominator of the image aspect ratio in case it can not be simply derived (e.g. ITU-R 601)
    colorspace* {.importc: "colorspace".}: cint ## *< the Y'CbCr colorspace standard: =601 for ITU-R 601, =709 for ITU-R 709, or =240 for SMPTE240M
    isExplicit* {.importc: "is_explicit".}: cint ## *< used internally to indicate if the profile was requested explicitly or computed or defaulted


proc profileInit*(name: cstring): Profile {.cdecl, importc: "mlt_profile_init",
                                        dynlib: mltlib.}
proc profileLoadFile*(file: cstring): Profile {.cdecl,
    importc: "mlt_profile_load_file", dynlib: mltlib.}
proc profileLoadProperties*(properties: Properties): Profile {.cdecl,
    importc: "mlt_profile_load_properties", dynlib: mltlib.}
proc profileLoadString*(string: cstring): Profile {.cdecl,
    importc: "mlt_profile_load_string", dynlib: mltlib.}
proc profileFps*(profile: Profile): cdouble {.cdecl, importc: "mlt_profile_fps",
    dynlib: mltlib.}
proc profileSar*(profile: Profile): cdouble {.cdecl, importc: "mlt_profile_sar",
    dynlib: mltlib.}
proc profileDar*(profile: Profile): cdouble {.cdecl, importc: "mlt_profile_dar",
    dynlib: mltlib.}
proc profileClose*(profile: Profile) {.cdecl, importc: "mlt_profile_close",
                                    dynlib: mltlib.}
proc profileClone*(profile: Profile): Profile {.cdecl, importc: "mlt_profile_clone",
    dynlib: mltlib.}
proc profileList*(): Properties {.cdecl, importc: "mlt_profile_list", dynlib: mltlib.}
proc profileFromProducer*(profile: Profile; producer: Producer) {.cdecl,
    importc: "mlt_profile_from_producer", dynlib: mltlib.}
proc profileLumasDir*(profile: Profile): cstring {.cdecl,
    importc: "mlt_profile_lumas_dir", dynlib: mltlib.}
proc profileScaleWidth*(profile: Profile; width: cint): cdouble {.cdecl,
    importc: "mlt_profile_scale_width", dynlib: mltlib.}
proc profileScaleHeight*(profile: Profile; height: cint): cdouble {.cdecl,
    importc: "mlt_profile_scale_height", dynlib: mltlib.}