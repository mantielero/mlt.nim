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

## * Callback function to get video data.
##
##

type
  GetImage* = proc (self: Frame; buffer: ptr ptr uint8; format: ptr ImageFormat;
                 width: ptr cint; height: ptr cint; writable: cint): cint {.cdecl.}

## * Callback function to get audio data.
##
##

type
  GetAudio* = proc (self: Frame; buffer: ptr pointer; format: ptr AudioFormat;
                 frequency: ptr cint; channels: ptr cint; samples: ptr cint): cint {.cdecl.}

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
  FrameS* {.importc: "mlt_frame_s", header: "mlt_frame.h", bycopy.} = object
    parent* {.importc: "parent".}: PropertiesS ## *< \private A frame extends properties.
                                           ## * Convert the image format (callback function).
                                           ##  \param self a frame
                                           ##  \param[in,out] image a buffer of image data
                                           ##  \param[in,out] input the image format of supplied image data
                                           ##  \param output the image format to which to convert
                                           ##  \return true if error
                                           ##
    convertImage* {.importc: "convert_image".}: proc (self: Frame;
        image: ptr ptr uint8; input: ptr ImageFormat; output: ImageFormat): cint {.cdecl.} ##
                                                                                 ## *
                                                                                 ## Convert
                                                                                 ## the
                                                                                 ## audio
                                                                                 ## format
                                                                                 ## (callback
                                                                                 ## function).
                                                                                 ##
                                                                                 ## \param
                                                                                 ## self
                                                                                 ## a
                                                                                 ## frame
                                                                                 ##
                                                                                 ## \param[in,out]
                                                                                 ## audio
                                                                                 ## a
                                                                                 ## buffer
                                                                                 ## of
                                                                                 ## audio
                                                                                 ## data
                                                                                 ##
                                                                                 ## \param[in,out]
                                                                                 ## input
                                                                                 ## the
                                                                                 ## audio
                                                                                 ## format
                                                                                 ## of
                                                                                 ## supplied
                                                                                 ## data
                                                                                 ##
                                                                                 ## \param
                                                                                 ## output
                                                                                 ## the
                                                                                 ## audio
                                                                                 ## format
                                                                                 ## to
                                                                                 ## which
                                                                                 ## to
                                                                                 ## convert
                                                                                 ##
                                                                                 ## \return
                                                                                 ## true
                                                                                 ## if
                                                                                 ## error
                                                                                 ##
    convertAudio* {.importc: "convert_audio".}: proc (self: Frame; audio: ptr pointer;
        input: ptr AudioFormat; output: AudioFormat): cint {.cdecl.}
    stackImage* {.importc: "stack_image".}: Deque ## *< \private the image processing stack of operations and data
    stackAudio* {.importc: "stack_audio".}: Deque ## *< \private the audio processing stack of operations and data
    stackService* {.importc: "stack_service".}: Deque ## *< \private a general purpose data stack
    isProcessing* {.importc: "is_processing".}: cint ## *< \private indicates if a frame is or was processed by the parallel consumer


##  #define MLT_FRAME_PROPERTIES( frame )		( &( frame )->parent )
##  #define MLT_FRAME_SERVICE_STACK( frame )	( ( frame )->stack_service )
##  #define MLT_FRAME_IMAGE_STACK( frame )		( ( frame )->stack_image )
##  #define MLT_FRAME_AUDIO_STACK( frame )		( ( frame )->stack_audio )

proc frameInit*(service: Service): Frame {.cdecl, importc: "mlt_frame_init",
                                       dynlib: mltlib.}
proc frameProperties*(self: Frame): Properties {.cdecl,
    importc: "mlt_frame_properties", dynlib: mltlib.}
proc frameIsTestCard*(self: Frame): cint {.cdecl, importc: "mlt_frame_is_test_card",
                                       dynlib: mltlib.}
proc frameIsTestAudio*(self: Frame): cint {.cdecl,
                                        importc: "mlt_frame_is_test_audio",
                                        dynlib: mltlib.}
proc frameGetAspectRatio*(self: Frame): cdouble {.cdecl,
    importc: "mlt_frame_get_aspect_ratio", dynlib: mltlib.}
proc frameSetAspectRatio*(self: Frame; value: cdouble): cint {.cdecl,
    importc: "mlt_frame_set_aspect_ratio", dynlib: mltlib.}
proc frameGetPosition*(self: Frame): Position {.cdecl,
    importc: "mlt_frame_get_position", dynlib: mltlib.}
proc frameOriginalPosition*(self: Frame): Position {.cdecl,
    importc: "mlt_frame_original_position", dynlib: mltlib.}
proc frameSetPosition*(self: Frame; value: Position): cint {.cdecl,
    importc: "mlt_frame_set_position", dynlib: mltlib.}
proc frameSetImage*(self: Frame; image: ptr uint8; size: cint; destroy: Destructor): cint {.
    cdecl, importc: "mlt_frame_set_image", dynlib: mltlib.}
proc frameSetAlpha*(self: Frame; alpha: ptr uint8; size: cint; destroy: Destructor): cint {.
    cdecl, importc: "mlt_frame_set_alpha", dynlib: mltlib.}
proc frameReplaceImage*(self: Frame; image: ptr uint8; format: ImageFormat;
                       width: cint; height: cint) {.cdecl,
    importc: "mlt_frame_replace_image", dynlib: mltlib.}
proc frameGetImage*(self: Frame; buffer: ptr ptr uint8; format: ptr ImageFormat;
                   width: ptr cint; height: ptr cint; writable: cint): cint {.cdecl,
    importc: "mlt_frame_get_image", dynlib: mltlib.}
proc frameGetAlpha*(self: Frame): ptr uint8 {.cdecl, importc: "mlt_frame_get_alpha",
    dynlib: mltlib.}
proc frameGetAudio*(self: Frame; buffer: ptr pointer; format: ptr AudioFormat;
                   frequency: ptr cint; channels: ptr cint; samples: ptr cint): cint {.
    cdecl, importc: "mlt_frame_get_audio", dynlib: mltlib.}
proc frameSetAudio*(self: Frame; buffer: pointer; a3: AudioFormat; size: cint;
                   a5: Destructor): cint {.cdecl, importc: "mlt_frame_set_audio",
                                        dynlib: mltlib.}
proc frameGetWaveform*(self: Frame; w: cint; h: cint): ptr cuchar {.cdecl,
    importc: "mlt_frame_get_waveform", dynlib: mltlib.}
proc framePushGetImage*(self: Frame; getImage: GetImage): cint {.cdecl,
    importc: "mlt_frame_push_get_image", dynlib: mltlib.}
proc framePopGetImage*(self: Frame): GetImage {.cdecl,
    importc: "mlt_frame_pop_get_image", dynlib: mltlib.}
proc framePushFrame*(self: Frame; that: Frame): cint {.cdecl,
    importc: "mlt_frame_push_frame", dynlib: mltlib.}
proc framePopFrame*(self: Frame): Frame {.cdecl, importc: "mlt_frame_pop_frame",
                                      dynlib: mltlib.}
proc framePushService*(self: Frame; that: pointer): cint {.cdecl,
    importc: "mlt_frame_push_service", dynlib: mltlib.}
proc framePopService*(self: Frame): pointer {.cdecl,
    importc: "mlt_frame_pop_service", dynlib: mltlib.}
proc framePushServiceInt*(self: Frame; that: cint): cint {.cdecl,
    importc: "mlt_frame_push_service_int", dynlib: mltlib.}
proc framePopServiceInt*(self: Frame): cint {.cdecl,
    importc: "mlt_frame_pop_service_int", dynlib: mltlib.}
proc framePushAudio*(self: Frame; that: pointer): cint {.cdecl,
    importc: "mlt_frame_push_audio", dynlib: mltlib.}
proc framePopAudio*(self: Frame): pointer {.cdecl, importc: "mlt_frame_pop_audio",
                                        dynlib: mltlib.}
proc frameServiceStack*(self: Frame): Deque {.cdecl,
    importc: "mlt_frame_service_stack", dynlib: mltlib.}
proc frameGetOriginalProducer*(self: Frame): Producer {.cdecl,
    importc: "mlt_frame_get_original_producer", dynlib: mltlib.}
proc frameClose*(self: Frame) {.cdecl, importc: "mlt_frame_close", dynlib: mltlib.}
proc frameUniqueProperties*(self: Frame; service: Service): Properties {.cdecl,
    importc: "mlt_frame_unique_properties", dynlib: mltlib.}
proc frameGetUniqueProperties*(self: Frame; service: Service): Properties {.cdecl,
    importc: "mlt_frame_get_unique_properties", dynlib: mltlib.}
proc frameClone*(self: Frame; isDeep: cint): Frame {.cdecl, importc: "mlt_frame_clone",
    dynlib: mltlib.}
##  convenience functions

proc frameWritePpm*(frame: Frame) {.cdecl, importc: "mlt_frame_write_ppm",
                                 dynlib: mltlib.}
##  /** This macro scales RGB into the YUV gamut - y is scaled by 219/255 and uv by 224/255. */
##  #define RGB2YUV_601_SCALED(r, g, b, y, u, v)\
##    y = ((263*r + 516*g + 100*b) >> 10) + 16;\
##    u = ((-152*r - 300*g + 450*b) >> 10) + 128;\
##    v = ((450*r - 377*g - 73*b) >> 10) + 128;
##  /** This macro scales RGB into the YUV gamut - uv is scaled by 224/255 (y unused). */
##  #define RGB2UV_601_SCALED(r, g, b, u, v)\
##    u = ((-152*r - 300*g + 450*b) >> 10) + 128;\
##    v = ((450*r - 377*g - 73*b) >> 10) + 128;
##
##  /** This macro scales YUV up into the full gamut of the RGB color space. */
##  #define YUV2RGB_601_SCALED( y, u, v, r, g, b ) \
##    r = ((1192 * ( y - 16 ) + 1634 * ( v - 128 ) ) >> 10 ); \
##    g = ((1192 * ( y - 16 ) - 832 * ( v - 128 ) - 401 * ( u - 128 ) ) >> 10 ); \
##    b = ((1192 * ( y - 16 ) + 2066 * ( u - 128 ) ) >> 10 ); \
##    r = r < 0 ? 0 : r > 255 ? 255 : r; \
##    g = g < 0 ? 0 : g > 255 ? 255 : g; \
##    b = b < 0 ? 0 : b > 255 ? 255 : b;
