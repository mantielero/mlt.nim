## *
##  \file mlt_frame.h
##  \brief interface for all frame classes
##  \see mlt_frame_s
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
  mlt_properties, mlt_deque, mlt_service

## * Callback function to get video data.
##
##

type
  mlt_get_image* = proc (self: mlt_frame; buffer: ptr ptr uint8_t;
                      format: ptr mlt_image_format; width: ptr cint; height: ptr cint;
                      writable: cint): cint {.cdecl.}

## * Callback function to get audio data.
##
##

type
  mlt_get_audio* = proc (self: mlt_frame; buffer: ptr pointer;
                      format: ptr mlt_audio_format; frequency: ptr cint;
                      channels: ptr cint; samples: ptr cint): cint {.cdecl.}

## * \brief Frame class
##
##  The frame is the primary data object that gets passed around to and through services.
##
##  \extends mlt_properties
##  \properties \em test_image set if the frame holds a "test card" image
##  \properties \em test_audio set if the frame holds "test card" audio
##  \properties \em _producer holds a reference to the frame's end producer
##  \properties \em _speed the current speed of the producer that generated the frame
##  \properties \em _position the position of the frame
##  \properties \em meta.* holds metadata
##  \properties \em hide set to 1 to hide the video, 2 to mute the audio
##  \properties \em last_track a flag to indicate an end-of-tracks frame
##  \properties \em previous \em frame a reference to the unfiltered preceding frame
##  (no speed factor applied, only available when \em _need_previous_next is set on the producer)
##  \properties \em next \em frame a reference to the unfiltered following frame
##  (no speed factor applied, only available when \em _need_previous_next is set on the producer)
##  \properties \em colorspace the standard for the YUV coefficients
##  \properties \em force_full_luma luma range handling, set to -1 for pass-through, 1 for full range, 0 for scaling
##  \properties \em color_trc the color transfer characteristic (gamma)
##  \properties \em audio_frequency the sample rate of the audio
##  \properties \em audio_channels the number of audio channels
##  \properties \em audio_samples the number of audio samples
##  \properties \em audio_format the mlt_audio_format for the audio on this frame
##  \properties \em format the mlt_image_format of the image on this frame
##  \properties \em width the horizontal resolution of the image
##  \properties \em height the vertical resolution of the image
##  \properties \em aspect_ratio the sample aspect ratio of the image
##

type
  mlt_frame_s* {.bycopy.} = object
    parent*: mlt_properties_s  ## *< \private A frame extends properties.
                            ## * Get the alpha channel (callback function).
                            ##  \param self a frame
                            ##  \return the 8-bit alpha channel
                            ##
    get_alpha_mask*: proc (self: mlt_frame): ptr uint8_t {.cdecl.} ## * Convert the image format (callback function).
                                                            ##  \param self a frame
                                                            ##  \param[in,out] image a buffer of image data
                                                            ##  \param[in,out] input the image format of supplied image data
                                                            ##  \param output the image format to which to convert
                                                            ##  \return true if error
                                                            ##
    convert_image*: proc (self: mlt_frame; image: ptr ptr uint8_t;
                        input: ptr mlt_image_format; output: mlt_image_format): cint {.
        cdecl.} ## * Convert the audio format (callback function).
               ##  \param self a frame
               ##  \param[in,out] audio a buffer of audio data
               ##  \param[in,out] input the audio format of supplied data
               ##  \param output the audio format to which to convert
               ##  \return true if error
               ##
    convert_audio*: proc (self: mlt_frame; audio: ptr pointer;
                        input: ptr mlt_audio_format; output: mlt_audio_format): cint {.
        cdecl.}
    stack_image*: mlt_deque    ## *< \private the image processing stack of operations and data
    stack_audio*: mlt_deque    ## *< \private the audio processing stack of operations and data
    stack_service*: mlt_deque  ## *< \private a general purpose data stack
    is_processing*: cint       ## *< \private indicates if a frame is or was processed by the parallel consumer


template MLT_FRAME_PROPERTIES*(frame: untyped): untyped =
  (addr((frame).parent))

template MLT_FRAME_SERVICE_STACK*(frame: untyped): untyped =
  ((frame).stack_service)

template MLT_FRAME_IMAGE_STACK*(frame: untyped): untyped =
  ((frame).stack_image)

template MLT_FRAME_AUDIO_STACK*(frame: untyped): untyped =
  ((frame).stack_audio)

proc mlt_frame_init*(service: mlt_service): mlt_frame {.cdecl,
    importc: "mlt_frame_init", dynlib: libName.}
proc mlt_frame_properties*(self: mlt_frame): mlt_properties {.cdecl,
    importc: "mlt_frame_properties", dynlib: libName.}
proc mlt_frame_is_test_card*(self: mlt_frame): cint {.cdecl,
    importc: "mlt_frame_is_test_card", dynlib: libName.}
proc mlt_frame_is_test_audio*(self: mlt_frame): cint {.cdecl,
    importc: "mlt_frame_is_test_audio", dynlib: libName.}
proc mlt_frame_get_aspect_ratio*(self: mlt_frame): cdouble {.cdecl,
    importc: "mlt_frame_get_aspect_ratio", dynlib: libName.}
proc mlt_frame_set_aspect_ratio*(self: mlt_frame; value: cdouble): cint {.cdecl,
    importc: "mlt_frame_set_aspect_ratio", dynlib: libName.}
proc mlt_frame_get_position*(self: mlt_frame): mlt_position {.cdecl,
    importc: "mlt_frame_get_position", dynlib: libName.}
proc mlt_frame_original_position*(self: mlt_frame): mlt_position {.cdecl,
    importc: "mlt_frame_original_position", dynlib: libName.}
proc mlt_frame_set_position*(self: mlt_frame; value: mlt_position): cint {.cdecl,
    importc: "mlt_frame_set_position", dynlib: libName.}
proc mlt_frame_set_image*(self: mlt_frame; image: ptr uint8_t; size: cint;
                         destroy: mlt_destructor): cint {.cdecl,
    importc: "mlt_frame_set_image", dynlib: libName.}
proc mlt_frame_set_alpha*(self: mlt_frame; alpha: ptr uint8_t; size: cint;
                         destroy: mlt_destructor): cint {.cdecl,
    importc: "mlt_frame_set_alpha", dynlib: libName.}
proc mlt_frame_replace_image*(self: mlt_frame; image: ptr uint8_t;
                             format: mlt_image_format; width: cint; height: cint) {.
    cdecl, importc: "mlt_frame_replace_image", dynlib: libName.}
proc mlt_frame_get_image*(self: mlt_frame; buffer: ptr ptr uint8_t;
                         format: ptr mlt_image_format; width: ptr cint;
                         height: ptr cint; writable: cint): cint {.cdecl,
    importc: "mlt_frame_get_image", dynlib: libName.}
proc mlt_frame_get_alpha_mask*(self: mlt_frame): ptr uint8_t {.cdecl,
    importc: "mlt_frame_get_alpha_mask", dynlib: libName.}
proc mlt_frame_get_alpha*(self: mlt_frame): ptr uint8_t {.cdecl,
    importc: "mlt_frame_get_alpha", dynlib: libName.}
proc mlt_frame_get_audio*(self: mlt_frame; buffer: ptr pointer;
                         format: ptr mlt_audio_format; frequency: ptr cint;
                         channels: ptr cint; samples: ptr cint): cint {.cdecl,
    importc: "mlt_frame_get_audio", dynlib: libName.}
proc mlt_frame_set_audio*(self: mlt_frame; buffer: pointer; a3: mlt_audio_format;
                         size: cint; a5: mlt_destructor): cint {.cdecl,
    importc: "mlt_frame_set_audio", dynlib: libName.}
proc mlt_frame_get_waveform*(self: mlt_frame; w: cint; h: cint): ptr cuchar {.cdecl,
    importc: "mlt_frame_get_waveform", dynlib: libName.}
proc mlt_frame_push_get_image*(self: mlt_frame; get_image: mlt_get_image): cint {.
    cdecl, importc: "mlt_frame_push_get_image", dynlib: libName.}
proc mlt_frame_pop_get_image*(self: mlt_frame): mlt_get_image {.cdecl,
    importc: "mlt_frame_pop_get_image", dynlib: libName.}
proc mlt_frame_push_frame*(self: mlt_frame; that: mlt_frame): cint {.cdecl,
    importc: "mlt_frame_push_frame", dynlib: libName.}
proc mlt_frame_pop_frame*(self: mlt_frame): mlt_frame {.cdecl,
    importc: "mlt_frame_pop_frame", dynlib: libName.}
proc mlt_frame_push_service*(self: mlt_frame; that: pointer): cint {.cdecl,
    importc: "mlt_frame_push_service", dynlib: libName.}
proc mlt_frame_pop_service*(self: mlt_frame): pointer {.cdecl,
    importc: "mlt_frame_pop_service", dynlib: libName.}
proc mlt_frame_push_service_int*(self: mlt_frame; that: cint): cint {.cdecl,
    importc: "mlt_frame_push_service_int", dynlib: libName.}
proc mlt_frame_pop_service_int*(self: mlt_frame): cint {.cdecl,
    importc: "mlt_frame_pop_service_int", dynlib: libName.}
proc mlt_frame_push_audio*(self: mlt_frame; that: pointer): cint {.cdecl,
    importc: "mlt_frame_push_audio", dynlib: libName.}
proc mlt_frame_pop_audio*(self: mlt_frame): pointer {.cdecl,
    importc: "mlt_frame_pop_audio", dynlib: libName.}
proc mlt_frame_service_stack*(self: mlt_frame): mlt_deque {.cdecl,
    importc: "mlt_frame_service_stack", dynlib: libName.}
proc mlt_frame_get_original_producer*(self: mlt_frame): mlt_producer {.cdecl,
    importc: "mlt_frame_get_original_producer", dynlib: libName.}
proc mlt_frame_close*(self: mlt_frame) {.cdecl, importc: "mlt_frame_close",
                                      dynlib: libName.}
proc mlt_frame_unique_properties*(self: mlt_frame; service: mlt_service): mlt_properties {.
    cdecl, importc: "mlt_frame_unique_properties", dynlib: libName.}
proc mlt_frame_get_unique_properties*(self: mlt_frame; service: mlt_service): mlt_properties {.
    cdecl, importc: "mlt_frame_get_unique_properties", dynlib: libName.}
proc mlt_frame_clone*(self: mlt_frame; is_deep: cint): mlt_frame {.cdecl,
    importc: "mlt_frame_clone", dynlib: libName.}
##  convenience functions

proc mlt_sample_calculator*(fps: cfloat; frequency: cint; position: int64_t): cint {.
    cdecl, importc: "mlt_sample_calculator", dynlib: libName.}
proc mlt_sample_calculator_to_now*(fps: cfloat; frequency: cint; position: int64_t): int64_t {.
    cdecl, importc: "mlt_sample_calculator_to_now", dynlib: libName.}
proc mlt_image_format_name*(format: mlt_image_format): cstring {.cdecl,
    importc: "mlt_image_format_name", dynlib: libName.}
proc mlt_image_format_size*(format: mlt_image_format; width: cint; height: cint;
                           bpp: ptr cint): cint {.cdecl,
    importc: "mlt_image_format_size", dynlib: libName.}
proc mlt_audio_format_name*(format: mlt_audio_format): cstring {.cdecl,
    importc: "mlt_audio_format_name", dynlib: libName.}
proc mlt_audio_format_size*(format: mlt_audio_format; samples: cint; channels: cint): cint {.
    cdecl, importc: "mlt_audio_format_size", dynlib: libName.}
proc mlt_frame_write_ppm*(frame: mlt_frame) {.cdecl, importc: "mlt_frame_write_ppm",
    dynlib: libName.}
proc mlt_image_format_planes*(format: mlt_image_format; width: cint; height: cint;
                             data: pointer; planes: array[4, ptr cuchar];
                             strides: array[4, cint]): cint {.cdecl,
    importc: "mlt_image_format_planes", dynlib: libName.}
proc mlt_image_format_id*(name: cstring): mlt_image_format {.cdecl,
    importc: "mlt_image_format_id", dynlib: libName.}
proc mlt_channel_layout_name*(layout: mlt_channel_layout): cstring {.cdecl,
    importc: "mlt_channel_layout_name", dynlib: libName.}
proc mlt_channel_layout_id*(name: cstring): mlt_channel_layout {.cdecl,
    importc: "mlt_channel_layout_id", dynlib: libName.}
proc mlt_channel_layout_channels*(layout: mlt_channel_layout): cint {.cdecl,
    importc: "mlt_channel_layout_channels", dynlib: libName.}
proc mlt_channel_layout_default*(channels: cint): mlt_channel_layout {.cdecl,
    importc: "mlt_channel_layout_default", dynlib: libName.}