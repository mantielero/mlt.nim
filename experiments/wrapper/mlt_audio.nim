## *
##  \file mlt_audio.h
##  \brief Audio class
##  \see mlt_audio_s
##
##  Copyright (C) 2020 Meltytech, LLC
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

## * \brief Audio class
##
##  Audio is the data object that represents audio for a period of time.
##

type
  AudioS* {.importc: "mlt_audio_s", header: "mlt_audio.h", bycopy.} = object
    data* {.importc: "data".}: pointer
    frequency* {.importc: "frequency".}: cint
    format* {.importc: "format".}: AudioFormat
    samples* {.importc: "samples".}: cint
    channels* {.importc: "channels".}: cint
    layout* {.importc: "layout".}: ChannelLayout
    releaseData* {.importc: "release_data".}: Destructor
    close* {.importc: "close".}: Destructor

  Audio* = ptr AudioS

proc audioNew*(): Audio {.cdecl, importc: "mlt_audio_new", dynlib: mltlib.}
proc audioClose*(self: Audio) {.cdecl, importc: "mlt_audio_close", dynlib: mltlib.}
proc audioSetValues*(self: Audio; data: pointer; frequency: cint; format: AudioFormat;
                    samples: cint; channels: cint) {.cdecl,
    importc: "mlt_audio_set_values", dynlib: mltlib.}
proc audioGetValues*(self: Audio; data: ptr pointer; frequency: ptr cint;
                    format: ptr AudioFormat; samples: ptr cint; channels: ptr cint) {.
    cdecl, importc: "mlt_audio_get_values", dynlib: mltlib.}
proc audioAllocData*(self: Audio) {.cdecl, importc: "mlt_audio_alloc_data",
                                 dynlib: mltlib.}
proc audioCalculateSize*(self: Audio): cint {.cdecl,
    importc: "mlt_audio_calculate_size", dynlib: mltlib.}
proc audioPlaneCount*(self: Audio): cint {.cdecl, importc: "mlt_audio_plane_count",
                                       dynlib: mltlib.}
proc audioPlaneSize*(self: Audio): cint {.cdecl, importc: "mlt_audio_plane_size",
                                      dynlib: mltlib.}
proc audioGetPlanes*(self: Audio; planes: ptr ptr uint8) {.cdecl,
    importc: "mlt_audio_get_planes", dynlib: mltlib.}
proc audioSilence*(self: Audio; samples: cint; start: cint) {.cdecl,
    importc: "mlt_audio_silence", dynlib: mltlib.}
proc audioShrink*(self: Audio; samples: cint) {.cdecl, importc: "mlt_audio_shrink",
    dynlib: mltlib.}
proc audioReverse*(self: Audio) {.cdecl, importc: "mlt_audio_reverse", dynlib: mltlib.}
proc audioCopy*(dst: Audio; src: Audio; samples: cint; srcStart: cint; dstStart: cint) {.
    cdecl, importc: "mlt_audio_copy", dynlib: mltlib.}
proc audioCalculateFrameSamples*(fps: cfloat; frequency: cint; position: int): cint {.
    cdecl, importc: "mlt_audio_calculate_frame_samples", dynlib: mltlib.}
proc audioCalculateSamplesToPosition*(fps: cfloat; frequency: cint; position: int): int {.
    cdecl, importc: "mlt_audio_calculate_samples_to_position", dynlib: mltlib.}
proc audioFormatName*(format: AudioFormat): cstring {.cdecl,
    importc: "mlt_audio_format_name", dynlib: mltlib.}
proc audioFormatSize*(format: AudioFormat; samples: cint; channels: cint): cint {.cdecl,
    importc: "mlt_audio_format_size", dynlib: mltlib.}
proc audioChannelLayoutName*(layout: ChannelLayout): cstring {.cdecl,
    importc: "mlt_audio_channel_layout_name", dynlib: mltlib.}
proc audioChannelLayoutId*(name: cstring): ChannelLayout {.cdecl,
    importc: "mlt_audio_channel_layout_id", dynlib: mltlib.}
proc audioChannelLayoutChannels*(layout: ChannelLayout): cint {.cdecl,
    importc: "mlt_audio_channel_layout_channels", dynlib: mltlib.}
proc audioChannelLayoutDefault*(channels: cint): ChannelLayout {.cdecl,
    importc: "mlt_audio_channel_layout_default", dynlib: mltlib.}