## *
##  \file mlt_consumer.h
##  \brief abstraction for all consumer services
##  \see mlt_consumer_s
##
##  Copyright (C) 2003-2021 Meltytech, LLC
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

## * \brief Consumer abstract service class
##
##  A consumer is a service that pulls audio and video from the connected
##  producers, filters, and transitions. Typically a consumer is used to
##  output audio and/or video to a device, file, or socket.
##
##  \extends mlt_service_s
##  \properties \em rescale the scaling algorithm to pass on to all scaling
##  filters, defaults to "bilinear"
##  \properties \em buffer the number of frames to use in the asynchronous
##  render thread, defaults to 25
##  \properties \em prefill the number of frames to render before commencing
##  output when real_time <> 0, defaults to the size of buffer
##  \properties \em drop_max the maximum number of consecutively dropped frames, defaults to 5
##  \properties \em frequency the audio sample rate to use in Hertz, defaults to 48000
##  \properties \em channels the number of audio channels to use, defaults to 2
##  \properties \em channel_layout the layout of the audio channels, defaults to auto.
##  other options include: mono, stereo, 5.1, 7.1, etc.
##  \properties \em real_time the asynchronous behavior: 1 (default) for asynchronous
##  with frame dropping, -1 for asynchronous without frame dropping, 0 to disable (synchronous)
##  \properties \em test_card the name of a resource to use as the test card, defaults to
##  environment variable MLT_TEST_CARD. If undefined, the hard-coded default test card is
##  white silence. A test card is what appears when nothing is produced.
##  \event \em consumer-frame-show Subclass implementations fire this immediately after showing a frame
##    or when a frame should be shown (if audio-only consumer). The event data is a frame.
##  \event \em consumer-frame-render The base class fires this immediately before rendering a frame;
##    the event data is a frame.
##  \event \em consumer-thread-create Override the implementation of creating and
##    starting a thread by listening and responding to this (real_time 1 or -1 only).
##    The event data is a pointer to mlt_event_data_thread.
##  \event \em consumer-thread-join Override the implementation of waiting and
##    joining a terminated thread  by listening and responding to this (real_time 1 or -1 only).
##    The event data is a pointer to mlt_event_data_thread.
##  \event \em consumer-thread-started The base class fires when beginning execution of a rendering thread.
##  \event \em consumer-thread-stopped The base class fires when a rendering thread has ended.
##  \event \em consumer-stopping This is fired when stop was requested, but before render threads are joined.
##  \event \em consumer-stopped This is fired when the subclass implementation calls mlt_consumer_stopped().
##  \properties \em fps video frames per second as floating point (read only)
##  \properties \em frame_rate_num the numerator of the video frame rate, overrides \p mlt_profile_s
##  \properties \em frame_rate_den the denominator of the video frame rate, overrides \p mlt_profile_s
##  \properties \em width the horizontal video resolution, overrides \p mlt_profile_s
##  \properties \em height the vertical video resolution, overrides \p mlt_profile_s
##  \properties \em progressive a flag that indicates if the video is interlaced
##  or progressive, overrides \p mlt_profile_s
##  \properties \em aspect_ratio the video sample (pixel) aspect ratio as floating point (read only)
##  \properties \em sample_aspect_num the numerator of the sample aspect ratio, overrides \p mlt_profile_s
##  \properties \em sample_aspect_den the denominator of the sample aspect ratio, overrides \p mlt_profile_s
##  \properties \em display_ratio the video frame aspect ratio as floating point (read only)
##  \properties \em display_aspect_num the numerator of the video frame aspect ratio, overrides \p mlt_profile_s
##  \properties \em display_aspect_den the denominator of the video frame aspect ratio, overrides \p mlt_profile_s
##  \properties \em priority the OS scheduling priority for the render threads when real_time is not 0.
##  \properties \em top_field_first when not progressive, whether interlace field order is top-field-first, defaults to 0.
##    Set this to -1 if the consumer does not care about the field order.
##  \properties \em mlt_image_format the image format to request in rendering threads, defaults to yuv422
##  \properties \em mlt_audio_format the audio format to request in rendering threads, defaults to S16
##  \properties \em audio_off set non-zero to disable audio processing
##  \properties \em video_off set non-zero to disable video processing
##  \properties \em drop_count the number of video frames not rendered since starting consumer
##

type
  ConsumerS* {.importc: "mlt_consumer_s", header: "mlt_consumer.h", bycopy.} = object
    parent* {.importc: "parent".}: ServiceS ## * A consumer is a service.
    ## * Start the consumer to pull frames (virtual function).
    ##
    ##  \param mlt_consumer a consumer
    ##  \return true if there was an error
    ##
    start* {.importc: "start".}: proc (a1: Consumer): cint {.cdecl.} ## * Stop the consumer (virtual function).
                                                             ##
                                                             ##  \param mlt_consumer a consumer
                                                             ##  \return true if there was an error
                                                             ##
    stop* {.importc: "stop".}: proc (a1: Consumer): cint {.cdecl.} ## * Get whether the consumer is running or stopped (virtual function).
                                                           ##
                                                           ##  \param mlt_consumer a consumer
                                                           ##  \return true if the consumer is stopped
                                                           ##
    isStopped* {.importc: "is_stopped".}: proc (a1: Consumer): cint {.cdecl.} ## * Purge the consumer of buffered data (virtual function).
                                                                      ##
                                                                      ##  \param
                                                                      ## mlt_consumer a consumer
                                                                      ##
    purge* {.importc: "purge".}: proc (a1: Consumer) {.cdecl.} ## * The destructor virtual function
                                                        ##
                                                        ##  \param mlt_consumer a consumer
                                                        ##
    close* {.importc: "close".}: proc (a1: Consumer) {.cdecl.}
    local* {.importc: "local".}: pointer ## *< \private instance object
    child* {.importc: "child".}: pointer ## *< \private the object of a subclass
  Consumer* = ptr ConsumerS


template mlt_Consumer_Service*(consumer: untyped): untyped =
  (addr((consumer).parent))

template mlt_Consumer_Properties*(consumer: untyped): untyped =
  mlt_Service_Properties(mlt_Consumer_Service(consumer))

proc consumerInit*(self: Consumer; child: pointer; profile: Profile): cint {.cdecl,
    importc: "mlt_consumer_init", dynlib: mltlib.}
proc consumerNew*(profile: Profile): Consumer {.cdecl, importc: "mlt_consumer_new",
    dynlib: mltlib.}
proc consumerService*(self: Consumer): Service {.cdecl,
    importc: "mlt_consumer_service", dynlib: mltlib.}
proc consumerProperties*(self: Consumer): Properties {.cdecl,
    importc: "mlt_consumer_properties", dynlib: mltlib.}
proc consumerConnect*(self: Consumer; producer: Service): cint {.cdecl,
    importc: "mlt_consumer_connect", dynlib: mltlib.}
proc consumerStart*(self: Consumer): cint {.cdecl, importc: "mlt_consumer_start",
                                        dynlib: mltlib.}
proc consumerPurge*(self: Consumer) {.cdecl, importc: "mlt_consumer_purge",
                                   dynlib: mltlib.}
proc consumerPutFrame*(self: Consumer; frame: Frame): cint {.cdecl,
    importc: "mlt_consumer_put_frame", dynlib: mltlib.}
proc consumerGetFrame*(self: Consumer): Frame {.cdecl,
    importc: "mlt_consumer_get_frame", dynlib: mltlib.}
proc consumerRtFrame*(self: Consumer): Frame {.cdecl,
    importc: "mlt_consumer_rt_frame", dynlib: mltlib.}
proc consumerStop*(self: Consumer): cint {.cdecl, importc: "mlt_consumer_stop",
                                       dynlib: mltlib.}
proc consumerIsStopped*(self: Consumer): cint {.cdecl,
    importc: "mlt_consumer_is_stopped", dynlib: mltlib.}
proc consumerStopped*(self: Consumer) {.cdecl, importc: "mlt_consumer_stopped",
                                     dynlib: mltlib.}
proc consumerClose*(a1: Consumer) {.cdecl, importc: "mlt_consumer_close",
                                 dynlib: mltlib.}
proc consumerPosition*(a1: Consumer): Position {.cdecl,
    importc: "mlt_consumer_position", dynlib: mltlib.}