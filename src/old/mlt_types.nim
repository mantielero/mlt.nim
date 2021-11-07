## *
##  \file mlt_types.h
##  \brief Provides forward definitions of all public types
##
##  Copyright (C) 2003-2019 Meltytech, LLC
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
  mlt_pool

## * The set of supported image formats

type
  mlt_image_format* {.size: sizeof(cint).} = enum
    mlt_image_none = 0,         ## *< image not available
    mlt_image_rgb24,          ## *< 8-bit RGB
    mlt_image_rgb24a,         ## *< 8-bit RGB with alpha channel
    mlt_image_yuv422,         ## *< 8-bit YUV 4:2:2 packed
    mlt_image_yuv420p,        ## *< 8-bit YUV 4:2:0 planar
    mlt_image_opengl,         ## *< (deprecated) suitable for OpenGL texture
    mlt_image_glsl,           ## *< for opengl module internal use only
    mlt_image_glsl_texture,   ## *< an OpenGL texture name
    mlt_image_yuv422p16,      ## *< planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    mlt_image_invalid


## * The set of supported audio formats

type
  mlt_audio_format* {.size: sizeof(cint).} = enum
    mlt_audio_none = 0,         ## *< audio not available
    mlt_audio_pcm = 1,          ## *< \deprecated signed 16-bit interleaved PCM
    mlt_audio_s32,            ## *< signed 32-bit non-interleaved PCM
    mlt_audio_float,          ## *< 32-bit non-interleaved floating point
    mlt_audio_s32le,          ## *< signed 32-bit interleaved PCM
    mlt_audio_f32le,          ## *< 32-bit interleaved floating point
    mlt_audio_u8              ## *< unsigned 8-bit interleaved PCM
  mlt_channel_layout* {.size: sizeof(cint).} = enum
    mlt_channel_auto = 0,       ## *< MLT will determine the default configuration based on channel number
    mlt_channel_independent,  ## *< channels are not related
    mlt_channel_mono, mlt_channel_stereo, mlt_channel_2p1, mlt_channel_3p0,
    mlt_channel_3p0_back, mlt_channel_4p0, mlt_channel_quad_back,
    mlt_channel_quad_side, mlt_channel_3p1, mlt_channel_5p0_back, mlt_channel_5p0,
    mlt_channel_4p1, mlt_channel_5p1_back, mlt_channel_5p1, mlt_channel_6p0,
    mlt_channel_6p0_front, mlt_channel_hexagonal, mlt_channel_6p1,
    mlt_channel_6p1_back, mlt_channel_6p1_front, mlt_channel_7p0,
    mlt_channel_7p0_front, mlt_channel_7p1, mlt_channel_7p1_wide_side,
    mlt_channel_7p1_wide_back

const
  mlt_audio_s16 = mlt_audio_pcm


## * The time string formats

type
  mlt_time_format* {.size: sizeof(cint).} = enum
    mlt_time_frames = 0,        ## *< frame count
    mlt_time_clock,           ## *< SMIL clock-value as [[hh:]mm:]ss[.fraction]
    mlt_time_smpte_df,        ## *< SMPTE timecode as [[[hh:]mm:]ss{:|;}]frames
    mlt_time_smpte_ndf        ## *< SMPTE NDF timecode as [[[hh:]mm:]ss:]frames

const
  mlt_time_smpte = mlt_time_smpte_df

## * Interpolation methods for animation keyframes

type
  mlt_keyframe_type* {.size: sizeof(cint).} = enum
    mlt_keyframe_discrete = 0,  ## *< non-interpolated; value changes instantaneously at the key frame
    mlt_keyframe_linear,      ## *< simple, constant pace from this key frame to the next
    mlt_keyframe_smooth       ## *< eased pacing from this keyframe to the next using a Catmull-Rom spline


## * The relative time qualifiers

type
  mlt_whence* {.size: sizeof(cint).} = enum
    mlt_whence_relative_start = 0, ## *< relative to the beginning
    mlt_whence_relative_current, ## *< relative to the current position
    mlt_whence_relative_end   ## *< relative to the end


## * The recognized subclasses of mlt_service

type
  mlt_service_type* {.size: sizeof(cint).} = enum
    invalid_type = 0,           ## *< invalid service
    unknown_type,             ## *< unknown class
    producer_type,            ## *< Producer class
    tractor_type,             ## *< Tractor class
    playlist_type,            ## *< Playlist class
    multitrack_type,          ## *< Multitrack class
    filter_type,              ## *< Filter class
    transition_type,          ## *< Transition class
    consumer_type,            ## *< Consumer class
    field_type                ## *< Field class


##  I don't want to break anyone's applications without warning. -Zach

when defined(DOUBLE_MLT_POSITION):
  const
    MLT_POSITION_FMT* = "%f"
  template MLT_POSITION_MOD*(A, B: untyped): untyped =
    (A - B * ((int)(A div B)))

  type
    mlt_position* = cdouble
else:
  template MLT_POSITION_MOD*(A, B: untyped): untyped =
    A mod B

  const
    MLT_POSITION_FMT* = "%d"
  type
    mlt_position* = cint #int32_t   # TODO

## * A rectangle type with coordinates, size, and opacity

type
  mlt_rect* {.bycopy.} = object
    x*: cdouble                ## *< X coordinate
    y*: cdouble                ## *< Y coordinate
    w*: cdouble                ## *< width
    h*: cdouble                ## *< height
    o*: cdouble                ## *< opacity / mix-level


## * A tuple of color components

type
  mlt_color* {.bycopy.} = object
    r*: uint8 #uint8_t                ## *< red    # TODO
    g*: uint8 #uint8_t                ## *< green  # TODO
    b*: uint8 #uint8_t                ## *< blue   # TODO
    a*: uint8 #uint8_t                ## *< alpha  # TODO

  mlt_property_s* {.bycopy.}= object  # TODO
  mlt_property* = ptr mlt_property_s

## *< pointer to Property object


#type
  #mlt_properties_s* {.bycopy.}= object  # TODO
  #mlt_properties* = ptr mlt_properties_s

## *< pointer to Properties object

type
  mlt_event_struct* {.bycopy.}= object  # TODO
  mlt_event* = ptr mlt_event_struct

## *< pointer to Event object

type
  mlt_service_s* {.bycopy.}= object  # TODO
  mlt_service* = ptr mlt_service_s

## *< pointer to Service object

type
  mlt_producer_s* {.bycopy.}= object  # TODO  
  mlt_producer* = ptr mlt_producer_s

## *< pointer to Producer object

type
  mlt_playlist_s* {.bycopy.}= object  # TODO  
  mlt_playlist* = ptr mlt_playlist_s

## *< pointer to Playlist object

type
  mlt_multitrack_s* {.bycopy.}= object  # TODO   
  mlt_multitrack* = ptr mlt_multitrack_s

## *< pointer to Multitrack object

type
  mlt_filter_s* {.bycopy.}= object  # TODO    
  mlt_filter* = ptr mlt_filter_s

## *< pointer to Filter object

type
  mlt_transition_s* {.bycopy.}= object  # TODO     
  mlt_transition* = ptr mlt_transition_s

## *< pointer to Transition object

type
  mlt_tractor_s* {.bycopy.}= object  # TODO    
  mlt_tractor* = ptr mlt_tractor_s

## *< pointer to Tractor object

type
  mlt_field_s* {.bycopy.}= object  # TODO      
  mlt_field* = ptr mlt_field_s

## *< pointer to Field object

type
  mlt_consumer_s* {.bycopy.}= object  # TODO   
  mlt_consumer* = ptr mlt_consumer_s

## *< pointer to Consumer object

type
  mlt_parser_s* {.bycopy.}= object  # TODO   
  mlt_parser* = ptr mlt_parser_s

## *< pointer to Properties object

type
  mlt_deque_s* {.bycopy.}= object  # TODO   
  mlt_deque* = ptr mlt_deque_s

## *< pointer to Deque object

type
  mlt_geometry_s* {.bycopy.}= object  # TODO   
  mlt_geometry* = ptr mlt_geometry_s

## *< pointer to Geometry object

type
  mlt_geometry_item_s* {.bycopy.}= object  # TODO   
  mlt_geometry_item* = ptr mlt_geometry_item_s

## *< pointer to Geometry Item object

type
  mlt_profile_s* {.bycopy.}= object  # TODO   
  mlt_profile* = ptr mlt_profile_s

## *< pointer to Profile object

type
  mlt_repository_s* {.bycopy.}= object  # TODO   
  mlt_repository* = ptr mlt_repository_s

## *< pointer to Repository object

type
  mlt_cache_s* {.bycopy.}= object  # TODO   
  mlt_cache* = ptr mlt_cache_s

## *< pointer to Cache object

type
  mlt_cache_item_s* {.bycopy.}= object  # TODO   
  mlt_cache_item* = ptr mlt_cache_item_s

## *< pointer to CacheItem object

type
  mlt_animation_s* {.bycopy.}= object  # TODO   
  mlt_animation* = ptr mlt_animation_s

## *< pointer to Property Animation object

type
  mlt_slices_s* {.bycopy.}= object  # TODO   
  mlt_slices* = ptr mlt_slices_s

## *< pointer to Sliced processing context object

type  
  mlt_destructor* = proc (a1: pointer) {.cdecl.}

## *< pointer to destructor function

type
  mlt_serialiser* = proc (a1: pointer; length: cint): cstring {.cdecl.}

## *< pointer to serialization function

template MLT_SERVICE*(x: untyped): untyped =
  ((mlt_service)(x))          ## *< Cast to a Service pointer

template MLT_PRODUCER*(x: untyped): untyped =
  ((mlt_producer)(x))         ## *< Cast to a Producer pointer

template MLT_MULTITRACK*(x: untyped): untyped =
  ((mlt_multitrack)(x))       ## *< Cast to a Multitrack pointer

template MLT_PLAYLIST*(x: untyped): untyped =
  ((mlt_playlist)(x))         ## *< Cast to a Playlist pointer

template MLT_TRACTOR*(x: untyped): untyped =
  ((mlt_tractor)(x))          ## *< Cast to a Tractor pointer

template MLT_FILTER*(x: untyped): untyped =
  ((mlt_filter)(x))           ## *< Cast to a Filter pointer

template MLT_TRANSITION*(x: untyped): untyped =
  ((mlt_transition)(x))       ## *< Cast to a Transition pointer

template MLT_CONSUMER*(x: untyped): untyped =
  ((mlt_consumer)(x))         ## *< Cast to a Consumer pointer

template MLT_FRAME*(x: untyped): untyped =
  ((mlt_frame)(x))            ## *< Cast to a Frame pointer

when not defined(MIN):
  template MIN*(x, y: untyped): untyped =
    (if (x) < (y): (x) else: (y))

when not defined(MAX):
  template MAX*(x, y: untyped): untyped =
    if x > y: 
      x
    else: 
      y

when not defined(CLAMP):
  template CLAMP*(x, min, max: untyped): untyped =
    if x < min: 
      min 
    elif x > max: 
      max 
    else: 
      x

#[
when defined(_WIN32):
  ##  Win32 compatibility function declarations
  when not defined(__MINGW32__):
    proc usleep*(useconds: cuint): cint {.cdecl, importc: "usleep", dynlib: libName.}
  when not defined(WIN_PTHREADS_TIME_H):
    proc nanosleep*(rqtp: ptr timespec; rmtp: ptr timespec): cint {.cdecl,
        importc: "nanosleep", dynlib: libName.}
  proc setenv*(name: cstring; value: cstring; overwrite: cint): cint {.cdecl,
      importc: "setenv", dynlib: libName.}
  proc getlocale*(): cstring {.cdecl, importc: "getlocale", dynlib: libName.}
  proc win32_fopen*(filename_utf8: cstring; mode_utf8: cstring): ptr FILE {.cdecl,
      importc: "win32_fopen", dynlib: libName.}
  proc strptime*(buf: cstring; fmt: cstring; tm: ptr tm): cstring {.cdecl,
      importc: "strptime", dynlib: libName.}
  const
    mlt_fopen* = win32_fopen
    MLT_DIRLIST_DELIMITER* = ";"
else:
  const
    mlt_fopen* = fopen
    MLT_DIRLIST_DELIMITER* = ":"
]#