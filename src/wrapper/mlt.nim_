# Generated at 2020-04-16T19:10:04+02:00
# Command line:
#   /home/jose/.nimble/pkgs/nimterop-#head/nimterop/toast -pnrks -f:ast2 -I./ /home/jose/src/mlt-master/src/framework/mlt.h

{.hint[ConvFromXtoItselfNotNeeded]: off.}

import nimterop/types

# const 'GCC_VERSION' has invalid value '(__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)'
# const 'mlt_fopen' has invalid value 'fopen'
# const 'MLT_REPOSITORY' has invalid value 'void mlt_register( mlt_repository repository )'
# type 'mlt_tokeniser_t' is duplicate, skipped
# const 'LIBMLT_VERSION_INT' has invalid value '((LIBMLT_VERSION_MAJOR<<16)+(LIBMLT_VERSION_MINOR<<8)+LIBMLT_VERSION_REVISION)'
# const 'LIBMLT_VERSION' has invalid value 'MLT_STRINGIZE(LIBMLT_VERSION_MAJOR.LIBMLT_VERSION_MINOR.LIBMLT_VERSION_REVISION)'

defineEnum(mlt_image_format)
defineEnum(mlt_audio_format)
defineEnum(mlt_channel_layout)
defineEnum(mlt_time_format)
defineEnum(mlt_keyframe_type)
defineEnum(mlt_whence)
defineEnum(mlt_service_type)
const
  mlt_image_none* = (0).mlt_image_format
  mlt_image_rgb24* = (mlt_image_none + 1).mlt_image_format
  mlt_image_rgb24a* = (mlt_image_rgb24 + 1).mlt_image_format
  mlt_image_yuv422* = (mlt_image_rgb24a + 1).mlt_image_format
  mlt_image_yuv420p* = (mlt_image_yuv422 + 1).mlt_image_format
  mlt_image_opengl* = (mlt_image_yuv420p + 1).mlt_image_format
  mlt_image_glsl* = (mlt_image_opengl + 1).mlt_image_format
  mlt_image_glsl_texture* = (mlt_image_glsl + 1).mlt_image_format
  mlt_image_yuv422p16* = (mlt_image_glsl_texture + 1).mlt_image_format
  mlt_image_invalid* = (mlt_image_yuv422p16 + 1).mlt_image_format
  mlt_audio_none* = (0).mlt_audio_format
  mlt_audio_pcm* = (1).mlt_audio_format
  mlt_audio_s16* = (1).mlt_audio_format
  mlt_audio_s32* = (mlt_audio_s16 + 1).mlt_audio_format
  mlt_audio_float* = (mlt_audio_s32 + 1).mlt_audio_format
  mlt_audio_s32le* = (mlt_audio_float + 1).mlt_audio_format
  mlt_audio_f32le* = (mlt_audio_s32le + 1).mlt_audio_format
  mlt_audio_u8* = (mlt_audio_f32le + 1).mlt_audio_format
  mlt_channel_auto* = (0).mlt_channel_layout
  mlt_channel_independent* = (mlt_channel_auto + 1).mlt_channel_layout
  mlt_channel_mono* = (mlt_channel_independent + 1).mlt_channel_layout
  mlt_channel_stereo* = (mlt_channel_mono + 1).mlt_channel_layout
  mlt_channel_2p1* = (mlt_channel_stereo + 1).mlt_channel_layout
  mlt_channel_3p0* = (mlt_channel_2p1 + 1).mlt_channel_layout
  mlt_channel_3p0_back* = (mlt_channel_3p0 + 1).mlt_channel_layout
  mlt_channel_4p0* = (mlt_channel_3p0_back + 1).mlt_channel_layout
  mlt_channel_quad_back* = (mlt_channel_4p0 + 1).mlt_channel_layout
  mlt_channel_quad_side* = (mlt_channel_quad_back + 1).mlt_channel_layout
  mlt_channel_3p1* = (mlt_channel_quad_side + 1).mlt_channel_layout
  mlt_channel_5p0_back* = (mlt_channel_3p1 + 1).mlt_channel_layout
  mlt_channel_5p0* = (mlt_channel_5p0_back + 1).mlt_channel_layout
  mlt_channel_4p1* = (mlt_channel_5p0 + 1).mlt_channel_layout
  mlt_channel_5p1_back* = (mlt_channel_4p1 + 1).mlt_channel_layout
  mlt_channel_5p1* = (mlt_channel_5p1_back + 1).mlt_channel_layout
  mlt_channel_6p0* = (mlt_channel_5p1 + 1).mlt_channel_layout
  mlt_channel_6p0_front* = (mlt_channel_6p0 + 1).mlt_channel_layout
  mlt_channel_hexagonal* = (mlt_channel_6p0_front + 1).mlt_channel_layout
  mlt_channel_6p1* = (mlt_channel_hexagonal + 1).mlt_channel_layout
  mlt_channel_6p1_back* = (mlt_channel_6p1 + 1).mlt_channel_layout
  mlt_channel_6p1_front* = (mlt_channel_6p1_back + 1).mlt_channel_layout
  mlt_channel_7p0* = (mlt_channel_6p1_front + 1).mlt_channel_layout
  mlt_channel_7p0_front* = (mlt_channel_7p0 + 1).mlt_channel_layout
  mlt_channel_7p1* = (mlt_channel_7p0_front + 1).mlt_channel_layout
  mlt_channel_7p1_wide_side* = (mlt_channel_7p1 + 1).mlt_channel_layout
  mlt_channel_7p1_wide_back* = (mlt_channel_7p1_wide_side + 1).mlt_channel_layout
  mlt_time_frames* = (0).mlt_time_format
  mlt_time_clock* = (mlt_time_frames + 1).mlt_time_format
  mlt_time_smpte_df* = (mlt_time_clock + 1).mlt_time_format
  mlt_time_smpte* = (mlt_time_smpte_df).mlt_time_format
  mlt_time_smpte_ndf* = (mlt_time_smpte + 1).mlt_time_format
  mlt_keyframe_discrete* = (0).mlt_keyframe_type
  mlt_keyframe_linear* = (mlt_keyframe_discrete + 1).mlt_keyframe_type
  mlt_keyframe_smooth* = (mlt_keyframe_linear + 1).mlt_keyframe_type
  mlt_whence_relative_start* = (0).mlt_whence
  mlt_whence_relative_current* = (mlt_whence_relative_start + 1).mlt_whence
  mlt_whence_relative_end* = (mlt_whence_relative_current + 1).mlt_whence
  invalid_type* = (0).mlt_service_type
  unknown_type* = (invalid_type + 1).mlt_service_type
  producer_type* = (unknown_type + 1).mlt_service_type
  tractor_type* = (producer_type + 1).mlt_service_type
  playlist_type* = (tractor_type + 1).mlt_service_type
  multitrack_type* = (playlist_type + 1).mlt_service_type
  filter_type* = (multitrack_type + 1).mlt_service_type
  transition_type* = (filter_type + 1).mlt_service_type
  consumer_type* = (transition_type + 1).mlt_service_type
  field_type* = (consumer_type + 1).mlt_service_type
  MLT_POSITION_FMT* = "%d"
  MLT_DIRLIST_DELIMITER* = ":"
  MLT_LOG_QUIET* = -8
  MLT_LOG_PANIC* = 0
  MLT_LOG_FATAL* = 8
  MLT_LOG_ERROR* = 16
  MLT_LOG_WARNING* = 24
  MLT_LOG_INFO* = 32
  MLT_LOG_VERBOSE* = 40
  MLT_LOG_TIMINGS* = 44
  MLT_LOG_DEBUG* = 48
  LIBMLT_VERSION_MAJOR* = 6
  LIBMLT_VERSION_MINOR* = 21
  LIBMLT_VERSION_REVISION* = 0
{.pragma: impmlt, importc.}
{.pragma: impmltC, impmlt, cdecl,dynlib:"libmlt.so".}
type
  mlt_property_s = object
  mlt_event_struct = object
  mlt_field_s = object
  mlt_deque_s = object
  mlt_repository_s = object
  mlt_cache_s = object
  mlt_cache_item_s = object
  mlt_animation_s = object
  playlist_entry_s = object
  locale_t = object
  mlt_tokeniser = object
  mlt_position* = int32
  mlt_rect* {.bycopy.} = object
    x*: cdouble
    y*: cdouble
    w*: cdouble
    h*: cdouble
    o*: cdouble

  mlt_color* {.bycopy.} = object
    r*: uint8
    g*: uint8
    b*: uint8
    a*: uint8

  mlt_frame* = ptr mlt_frame_s
  mlt_frame_ptr* = ptr ptr mlt_frame_s
  mlt_property* = ptr mlt_property_s
  mlt_properties* = ptr mlt_properties_s
  mlt_event* = ptr mlt_event_struct
  mlt_service* = ptr mlt_service_s
  mlt_producer* = ptr mlt_producer_s
  mlt_playlist* = ptr mlt_playlist_s
  mlt_multitrack* = ptr mlt_multitrack_s
  mlt_filter* = ptr mlt_filter_s
  mlt_transition* = ptr mlt_transition_s
  mlt_tractor* = ptr mlt_tractor_s
  mlt_field* = ptr mlt_field_s
  mlt_consumer* = ptr mlt_consumer_s
  mlt_parser* = ptr mlt_parser_s
  mlt_deque* = ptr mlt_deque_s
  mlt_geometry* = ptr mlt_geometry_s
  mlt_geometry_item* = ptr mlt_geometry_item_s
  mlt_profile* = ptr mlt_profile_s
  mlt_repository* = ptr mlt_repository_s
  mlt_cache* = ptr mlt_cache_s
  mlt_cache_item* = ptr mlt_cache_item_s
  mlt_animation* = ptr mlt_animation_s
  mlt_slices* = ptr mlt_slices_s
  mlt_destructor* = proc (a1: pointer) {.cdecl.}
  mlt_serialiser* = proc (a1: pointer; length: cint): cstring {.cdecl.}
  mlt_animation_item_s* {.bycopy.} = object
    is_key*: cint
    frame*: cint
    property*: mlt_property
    keyframe_type*: mlt_keyframe_type

  mlt_animation_item* = ptr mlt_animation_item_s
  mlt_profile_s* {.bycopy.} = object
    description*: cstring
    frame_rate_num*: cint
    frame_rate_den*: cint
    width*: cint
    height*: cint
    progressive*: cint
    sample_aspect_num*: cint
    sample_aspect_den*: cint
    display_aspect_num*: cint
    display_aspect_den*: cint
    colorspace*: cint
    is_explicit*: cint

  mlt_repository_callback* = proc (a1: mlt_repository) {.cdecl.}
  mlt_register_callback* = proc (a1: mlt_profile; a2: mlt_service_type; a3: cstring;
                              a5: pointer): pointer {.cdecl.}
  mlt_metadata_callback* = proc (a1: mlt_service_type; a2: cstring; a4: pointer): mlt_properties {.
      cdecl.}
  mlt_transmitter* = proc (a1: pointer) {.cdecl.}
  mlt_listener* = proc (a1: pointer) {.cdecl.}
  mlt_properties_s* {.bycopy.} = object
    child*: pointer
    local*: pointer
    close*: mlt_destructor
    close_object*: pointer

  mlt_deque_compare* = proc (a: pointer; b: pointer): cint {.cdecl.}
  mlt_service_s* {.bycopy.} = object
    parent*: mlt_properties_s
    get_frame*: proc (self: mlt_service; frame: mlt_frame_ptr; index: cint): cint {.cdecl.}
    close*: mlt_destructor
    close_object*: pointer
    local*: pointer
    child*: pointer

  mlt_get_image* = proc (self: mlt_frame; buffer: ptr ptr uint8;
                      format: ptr mlt_image_format; width: ptr cint; height: ptr cint;
                      writable: cint): cint {.cdecl.}
  mlt_get_audio* = proc (self: mlt_frame; buffer: ptr pointer;
                      format: ptr mlt_audio_format; frequency: ptr cint;
                      channels: ptr cint; samples: ptr cint): cint {.cdecl.}
  mlt_frame_s* {.bycopy.} = object
    parent*: mlt_properties_s
    get_alpha_mask*: proc (self: mlt_frame): ptr uint8 {.cdecl.}
    convert_image*: proc (self: mlt_frame; image: ptr ptr uint8;
                        input: ptr mlt_image_format; output: mlt_image_format): cint {.
        cdecl.}
    convert_audio*: proc (self: mlt_frame; audio: ptr pointer;
                        input: ptr mlt_audio_format; output: mlt_audio_format): cint {.
        cdecl.}
    stack_image*: mlt_deque
    stack_audio*: mlt_deque
    stack_service*: mlt_deque
    is_processing*: cint

  mlt_filter_s* {.bycopy.} = object
    parent*: mlt_service_s
    close*: proc (a1: mlt_filter) {.cdecl.}
    process*: proc (a1: mlt_filter; a2: mlt_frame): mlt_frame {.cdecl.}
    child*: pointer

  mlt_producer_s* {.bycopy.} = object
    parent*: mlt_service_s
    get_frame*: proc (a1: mlt_producer; a2: mlt_frame_ptr; a3: cint): cint {.cdecl.}
    close*: mlt_destructor
    close_object*: pointer
    local*: pointer
    child*: pointer

  mlt_track_s* {.bycopy.} = object
    producer*: mlt_producer
    event*: mlt_event

  mlt_track* = ptr mlt_track_s
  mlt_multitrack_s* {.bycopy.} = object
    parent*: mlt_producer_s
    list*: ptr mlt_track
    size*: cint
    count*: cint

  mlt_transition_s* {.bycopy.} = object
    parent*: mlt_service_s
    close*: proc (a1: mlt_transition) {.cdecl.}
    process*: proc (a1: mlt_transition; a2: mlt_frame; a3: mlt_frame): mlt_frame {.cdecl.}
    child*: pointer
    producer*: mlt_service
    frames*: ptr mlt_frame
    held*: cint

  mlt_consumer_s* {.bycopy.} = object
    parent*: mlt_service_s
    start*: proc (a1: mlt_consumer): cint {.cdecl.}
    stop*: proc (a1: mlt_consumer): cint {.cdecl.}
    is_stopped*: proc (a1: mlt_consumer): cint {.cdecl.}
    purge*: proc (a1: mlt_consumer) {.cdecl.}
    close*: proc (a1: mlt_consumer) {.cdecl.}
    local*: pointer
    child*: pointer

  mlt_playlist_clip_info* {.bycopy.} = object
    clip*: cint
    producer*: mlt_producer
    cut*: mlt_producer
    start*: mlt_position
    resource*: cstring
    frame_in*: mlt_position
    frame_out*: mlt_position
    frame_count*: mlt_position
    length*: mlt_position
    fps*: cfloat
    repeat*: cint

  playlist_entry* = playlist_entry_s
  mlt_playlist_s* {.bycopy.} = object
    parent*: mlt_producer_s
    blank*: mlt_producer_s
    size*: cint
    count*: cint
    list*: ptr ptr playlist_entry

  mlt_tractor_s* {.bycopy.} = object
    parent*: mlt_producer_s
    producer*: mlt_service

  mlt_tokeniser_t* {.bycopy.} = object
    input*: cstring
    tokens*: ptr cstring
    count*: cint
    size*: cint

  mlt_parser_s* {.bycopy.} = object
    parent*: mlt_properties_s
    on_invalid*: proc (self: mlt_parser; `object`: mlt_service): cint {.cdecl.}
    on_unknown*: proc (self: mlt_parser; `object`: mlt_service): cint {.cdecl.}
    on_start_producer*: proc (self: mlt_parser; `object`: mlt_producer): cint {.cdecl.}
    on_end_producer*: proc (self: mlt_parser; `object`: mlt_producer): cint {.cdecl.}
    on_start_playlist*: proc (self: mlt_parser; `object`: mlt_playlist): cint {.cdecl.}
    on_end_playlist*: proc (self: mlt_parser; `object`: mlt_playlist): cint {.cdecl.}
    on_start_tractor*: proc (self: mlt_parser; `object`: mlt_tractor): cint {.cdecl.}
    on_end_tractor*: proc (self: mlt_parser; `object`: mlt_tractor): cint {.cdecl.}
    on_start_multitrack*: proc (self: mlt_parser; `object`: mlt_multitrack): cint {.
        cdecl.}
    on_end_multitrack*: proc (self: mlt_parser; `object`: mlt_multitrack): cint {.cdecl.}
    on_start_track*: proc (self: mlt_parser): cint {.cdecl.}
    on_end_track*: proc (self: mlt_parser): cint {.cdecl.}
    on_start_filter*: proc (self: mlt_parser; `object`: mlt_filter): cint {.cdecl.}
    on_end_filter*: proc (self: mlt_parser; `object`: mlt_filter): cint {.cdecl.}
    on_start_transition*: proc (self: mlt_parser; `object`: mlt_transition): cint {.
        cdecl.}
    on_end_transition*: proc (self: mlt_parser; `object`: mlt_transition): cint {.cdecl.}

  mlt_geometry_item_s* {.bycopy.} = object
    key*: cint
    frame*: cint
    distort*: cint
    x*: cfloat
    y*: cfloat
    w*: cfloat
    h*: cfloat
    mix*: cfloat
    f*: array[5, cint]

  mlt_geometry_s* {.bycopy.} = object
    local*: pointer

  mlt_slices_s* {.incompleteStruct.} = object
  mlt_slices_proc* = proc (id: cint; idx: cint; jobs: cint; cookie: pointer): cint {.cdecl.}
proc mlt_pool_init*() {.impmltC.}
proc mlt_pool_alloc*(size: cint): pointer {.impmltC.}
proc mlt_pool_realloc*(`ptr`: pointer; size: cint): pointer {.impmltC.}
proc mlt_pool_release*(release: pointer) {.impmltC.}
proc mlt_pool_purge*() {.impmltC.}
proc mlt_pool_close*() {.impmltC.}
proc mlt_pool_stat*() {.impmltC.}
proc mlt_property_init*(): mlt_property {.impmltC.}
proc mlt_property_clear*(self: mlt_property) {.impmltC.}
proc mlt_property_set_int*(self: mlt_property; value: cint): cint {.impmltC.}
proc mlt_property_set_double*(self: mlt_property; value: cdouble): cint {.impmltC.}
proc mlt_property_set_position*(self: mlt_property; value: mlt_position): cint {.
    impmltC.}
proc mlt_property_set_int64*(self: mlt_property; value: int64): cint {.impmltC.}
proc mlt_property_set_string*(self: mlt_property; value: cstring): cint {.impmltC.}
proc mlt_property_set_data*(self: mlt_property; value: pointer; length: cint;
                           destructor: mlt_destructor; serialiser: mlt_serialiser): cint {.
    impmltC.}
proc mlt_property_get_int*(self: mlt_property; fps: cdouble; a3: locale_t): cint {.
    impmltC.}
proc mlt_property_get_double*(self: mlt_property; fps: cdouble; a3: locale_t): cdouble {.
    impmltC.}
proc mlt_property_get_position*(self: mlt_property; fps: cdouble; a3: locale_t): mlt_position {.
    impmltC.}
proc mlt_property_get_int64*(self: mlt_property): int64 {.impmltC.}
proc mlt_property_get_string_tf*(self: mlt_property; a2: mlt_time_format): cstring {.
    impmltC.}
proc mlt_property_get_string*(self: mlt_property): cstring {.impmltC.}
proc mlt_property_get_string_l_tf*(self: mlt_property; a2: locale_t;
                                  a3: mlt_time_format): cstring {.impmltC.}
proc mlt_property_get_string_l*(self: mlt_property; a2: locale_t): cstring {.impmltC.}
proc mlt_property_get_data*(self: mlt_property; length: ptr cint): pointer {.impmltC.}
proc mlt_property_close*(self: mlt_property) {.impmltC.}
proc mlt_property_pass*(self: mlt_property; that: mlt_property) {.impmltC.}
proc mlt_property_get_time*(self: mlt_property; a2: mlt_time_format; fps: cdouble;
                           a4: locale_t): cstring {.impmltC.}
proc mlt_property_interpolate*(self: mlt_property;
                              points: UncheckedArray[mlt_property];
                              progress: cdouble; fps: cdouble; locale: locale_t;
                              interp: mlt_keyframe_type): cint {.impmltC.}
proc mlt_property_anim_get_double*(self: mlt_property; fps: cdouble;
                                  locale: locale_t; position: cint; length: cint): cdouble {.
    impmltC.}
proc mlt_property_anim_get_int*(self: mlt_property; fps: cdouble; locale: locale_t;
                               position: cint; length: cint): cint {.impmltC.}
proc mlt_property_anim_get_string*(self: mlt_property; fps: cdouble;
                                  locale: locale_t; position: cint; length: cint): cstring {.
    impmltC.}
proc mlt_property_anim_set_double*(self: mlt_property; value: cdouble; fps: cdouble;
                                  locale: locale_t; position: cint; length: cint;
                                  keyframe_type: mlt_keyframe_type): cint {.impmltC.}
proc mlt_property_anim_set_int*(self: mlt_property; value: cint; fps: cdouble;
                               locale: locale_t; position: cint; length: cint;
                               keyframe_type: mlt_keyframe_type): cint {.impmltC.}
proc mlt_property_anim_set_string*(self: mlt_property; value: cstring; fps: cdouble;
                                  locale: locale_t; position: cint; length: cint): cint {.
    impmltC.}
proc mlt_property_get_animation*(self: mlt_property): mlt_animation {.impmltC.}
proc mlt_property_set_rect*(self: mlt_property; value: mlt_rect): cint {.impmltC.}
proc mlt_property_get_rect*(self: mlt_property; locale: locale_t): mlt_rect {.impmltC.}
proc mlt_property_anim_set_rect*(self: mlt_property; value: mlt_rect; fps: cdouble;
                                locale: locale_t; position: cint; length: cint;
                                keyframe_type: mlt_keyframe_type): cint {.impmltC.}
proc mlt_property_anim_get_rect*(self: mlt_property; fps: cdouble; locale: locale_t;
                                position: cint; length: cint): mlt_rect {.impmltC.}
proc mlt_animation_new*(): mlt_animation {.impmltC.}
proc mlt_animation_parse*(self: mlt_animation; data: cstring; length: cint;
                         fps: cdouble; locale: locale_t): cint {.impmltC.}
proc mlt_animation_refresh*(self: mlt_animation; data: cstring; length: cint): cint {.
    impmltC.}
proc mlt_animation_get_length*(self: mlt_animation): cint {.impmltC.}
proc mlt_animation_set_length*(self: mlt_animation; length: cint) {.impmltC.}
proc mlt_animation_parse_item*(self: mlt_animation; item: mlt_animation_item;
                              data: cstring): cint {.impmltC.}
proc mlt_animation_get_item*(self: mlt_animation; item: mlt_animation_item;
                            position: cint): cint {.impmltC.}
proc mlt_animation_insert*(self: mlt_animation; item: mlt_animation_item): cint {.
    impmltC.}
proc mlt_animation_remove*(self: mlt_animation; position: cint): cint {.impmltC.}
proc mlt_animation_interpolate*(self: mlt_animation) {.impmltC.}
proc mlt_animation_next_key*(self: mlt_animation; item: mlt_animation_item;
                            position: cint): cint {.impmltC.}
proc mlt_animation_prev_key*(self: mlt_animation; item: mlt_animation_item;
                            position: cint): cint {.impmltC.}
proc mlt_animation_serialize_cut_tf*(self: mlt_animation; `in`: cint; `out`: cint;
                                    a4: mlt_time_format): cstring {.impmltC.}
proc mlt_animation_serialize_cut*(self: mlt_animation; `in`: cint; `out`: cint): cstring {.
    impmltC.}
proc mlt_animation_serialize_tf*(self: mlt_animation; a2: mlt_time_format): cstring {.
    impmltC.}
proc mlt_animation_serialize*(self: mlt_animation): cstring {.impmltC.}
proc mlt_animation_key_count*(self: mlt_animation): cint {.impmltC.}
proc mlt_animation_key_get*(self: mlt_animation; item: mlt_animation_item;
                           index: cint): cint {.impmltC.}
proc mlt_animation_close*(self: mlt_animation) {.impmltC.}
proc mlt_animation_key_set_type*(self: mlt_animation; index: cint;
                                `type`: mlt_keyframe_type): cint {.impmltC.}
proc mlt_animation_key_set_frame*(self: mlt_animation; index: cint; frame: cint): cint {.
    impmltC.}
proc mlt_profile_init*(name: cstring): mlt_profile {.impmltC.}
proc mlt_profile_load_file*(file: cstring): mlt_profile {.impmltC.}
proc mlt_profile_load_properties*(properties: mlt_properties): mlt_profile {.impmltC.}
proc mlt_profile_load_string*(string: cstring): mlt_profile {.impmltC.}
proc mlt_profile_fps*(profile: mlt_profile): cdouble {.impmltC.}
proc mlt_profile_sar*(profile: mlt_profile): cdouble {.impmltC.}
proc mlt_profile_dar*(profile: mlt_profile): cdouble {.impmltC.}
proc mlt_profile_close*(profile: mlt_profile) {.impmltC.}
proc mlt_profile_clone*(profile: mlt_profile): mlt_profile {.impmltC.}
proc mlt_profile_list*(): mlt_properties {.impmltC.}
proc mlt_profile_from_producer*(profile: mlt_profile; producer: mlt_producer) {.
    impmltC.}
proc mlt_profile_lumas_dir*(profile: mlt_profile): cstring {.impmltC.}
proc mlt_profile_scale_width*(profile: mlt_profile; width: cint): cdouble {.impmltC.}
proc mlt_profile_scale_height*(profile: mlt_profile; height: cint): cdouble {.impmltC.}
proc mlt_repository_init*(directory: cstring): mlt_repository {.impmltC.}
proc mlt_repository_register*(self: mlt_repository; service_type: mlt_service_type;
                             service: cstring; a4: mlt_register_callback) {.impmltC.}
proc mlt_repository_create*(self: mlt_repository; profile: mlt_profile;
                           `type`: mlt_service_type; service: cstring; arg: pointer): pointer {.
    impmltC.}
proc mlt_repository_close*(self: mlt_repository) {.impmltC.}
proc mlt_repository_consumers*(self: mlt_repository): mlt_properties {.impmltC.}
proc mlt_repository_filters*(self: mlt_repository): mlt_properties {.impmltC.}
proc mlt_repository_producers*(self: mlt_repository): mlt_properties {.impmltC.}
proc mlt_repository_transitions*(self: mlt_repository): mlt_properties {.impmltC.}
proc mlt_repository_register_metadata*(self: mlt_repository;
                                      `type`: mlt_service_type; service: cstring;
                                      a4: mlt_metadata_callback;
                                      callback_data: pointer) {.impmltC.}
proc mlt_repository_metadata*(self: mlt_repository; `type`: mlt_service_type;
                             service: cstring): mlt_properties {.impmltC.}
proc mlt_repository_languages*(self: mlt_repository): mlt_properties {.impmltC.}
proc mlt_repository_presets*(): mlt_properties {.impmltC.}
proc mlt_factory_init*(directory: cstring): mlt_repository {.impmltC.}
proc mlt_factory_repository*(): mlt_repository {.impmltC.}
proc mlt_factory_directory*(): cstring {.impmltC.}
proc mlt_environment*(name: cstring): cstring {.impmltC.}
proc mlt_environment_set*(name: cstring; value: cstring): cint {.impmltC.}
proc mlt_factory_event_object*(): mlt_properties {.impmltC.}
proc mlt_factory_producer*(profile: mlt_profile; service: cstring; resource: pointer): mlt_producer {.
    impmltC.}
proc mlt_factory_filter*(profile: mlt_profile; name: cstring; input: pointer): mlt_filter {.
    impmltC.}
proc mlt_factory_transition*(profile: mlt_profile; name: cstring; input: pointer): mlt_transition {.
    impmltC.}
proc mlt_factory_consumer*(profile: mlt_profile; name: cstring; input: pointer): mlt_consumer {.
    impmltC.}
proc mlt_factory_register_for_clean_up*(`ptr`: pointer; destructor: mlt_destructor) {.
    impmltC.}
proc mlt_factory_close*() {.impmltC.}
proc mlt_global_properties*(): mlt_properties {.impmltC.}
proc mlt_events_init*(self: mlt_properties) {.impmltC.}
proc mlt_events_register*(self: mlt_properties; id: cstring;
                         transmitter: mlt_transmitter): cint {.impmltC.}
proc mlt_events_fire*(self: mlt_properties; id: cstring): cint {.impmltC.}
proc mlt_events_listen*(self: mlt_properties; service: pointer; id: cstring;
                       listener: mlt_listener): mlt_event {.impmltC.}
proc mlt_events_block*(self: mlt_properties; service: pointer) {.impmltC.}
proc mlt_events_unblock*(self: mlt_properties; service: pointer) {.impmltC.}
proc mlt_events_disconnect*(self: mlt_properties; service: pointer) {.impmltC.}
proc mlt_events_setup_wait_for*(self: mlt_properties; id: cstring): mlt_event {.
    impmltC.}
proc mlt_events_wait_for*(self: mlt_properties; event: mlt_event) {.impmltC.}
proc mlt_events_close_wait_for*(self: mlt_properties; event: mlt_event) {.impmltC.}
proc mlt_event_inc_ref*(self: mlt_event) {.impmltC.}
proc mlt_event_block*(self: mlt_event) {.impmltC.}
proc mlt_event_unblock*(self: mlt_event) {.impmltC.}
proc mlt_event_close*(self: mlt_event) {.impmltC.}
proc mlt_properties_init*(a1: mlt_properties; child: pointer): cint {.impmltC.}
proc mlt_properties_new*(): mlt_properties {.impmltC.}
proc mlt_properties_set_lcnumeric*(a1: mlt_properties; locale: cstring): cint {.
    impmltC.}
proc mlt_properties_get_lcnumeric*(self: mlt_properties): cstring {.impmltC.}
proc mlt_properties_load*(file: cstring): mlt_properties {.impmltC.}
proc mlt_properties_preset*(self: mlt_properties; name: cstring): cint {.impmltC.}
proc mlt_properties_inc_ref*(self: mlt_properties): cint {.impmltC.}
proc mlt_properties_dec_ref*(self: mlt_properties): cint {.impmltC.}
proc mlt_properties_ref_count*(self: mlt_properties): cint {.impmltC.}
proc mlt_properties_mirror*(self: mlt_properties; that: mlt_properties) {.impmltC.}
proc mlt_properties_inherit*(self: mlt_properties; that: mlt_properties): cint {.
    impmltC.}
proc mlt_properties_pass*(self: mlt_properties; that: mlt_properties; prefix: cstring): cint {.
    impmltC.}
proc mlt_properties_pass_property*(self: mlt_properties; that: mlt_properties;
                                  name: cstring) {.impmltC.}
proc mlt_properties_pass_list*(self: mlt_properties; that: mlt_properties;
                              list: cstring): cint {.impmltC.}
proc mlt_properties_set*(self: mlt_properties; name: cstring; value: cstring): cint {.
    impmltC.}
proc mlt_properties_set_or_default*(self: mlt_properties; name: cstring;
                                   value: cstring; def: cstring): cint {.impmltC.}
proc mlt_properties_set_string*(self: mlt_properties; name: cstring; value: cstring): cint {.
    impmltC.}
proc mlt_properties_parse*(self: mlt_properties; namevalue: cstring): cint {.impmltC.}
proc mlt_properties_get*(self: mlt_properties; name: cstring): cstring {.impmltC.}
proc mlt_properties_get_name*(self: mlt_properties; index: cint): cstring {.impmltC.}
proc mlt_properties_get_value_tf*(self: mlt_properties; index: cint;
                                 a3: mlt_time_format): cstring {.impmltC.}
proc mlt_properties_get_value*(self: mlt_properties; index: cint): cstring {.impmltC.}
proc mlt_properties_get_data_at*(self: mlt_properties; index: cint; size: ptr cint): pointer {.
    impmltC.}
proc mlt_properties_get_int*(self: mlt_properties; name: cstring): cint {.impmltC.}
proc mlt_properties_set_int*(self: mlt_properties; name: cstring; value: cint): cint {.
    impmltC.}
proc mlt_properties_get_int64*(self: mlt_properties; name: cstring): int64 {.impmltC.}
proc mlt_properties_set_int64*(self: mlt_properties; name: cstring; value: int64): cint {.
    impmltC.}
proc mlt_properties_get_double*(self: mlt_properties; name: cstring): cdouble {.
    impmltC.}
proc mlt_properties_set_double*(self: mlt_properties; name: cstring; value: cdouble): cint {.
    impmltC.}
proc mlt_properties_get_position*(self: mlt_properties; name: cstring): mlt_position {.
    impmltC.}
proc mlt_properties_set_position*(self: mlt_properties; name: cstring;
                                 value: mlt_position): cint {.impmltC.}
proc mlt_properties_set_data*(self: mlt_properties; name: cstring; value: pointer;
                             length: cint; a5: mlt_destructor; a6: mlt_serialiser): cint {.
    impmltC.}
proc mlt_properties_get_data*(self: mlt_properties; name: cstring; length: ptr cint): pointer {.
    impmltC.}
proc mlt_properties_rename*(self: mlt_properties; source: cstring; dest: cstring): cint {.
    impmltC.}
proc mlt_properties_count*(self: mlt_properties): cint {.impmltC.}
proc mlt_properties_dump*(self: mlt_properties; output: ptr FILE) {.impmltC.}
proc mlt_properties_debug*(self: mlt_properties; title: cstring; output: ptr FILE) {.
    impmltC.}
proc mlt_properties_save*(a1: mlt_properties; a2: cstring): cint {.impmltC.}
proc mlt_properties_dir_list*(a1: mlt_properties; a2: cstring; a3: cstring; a4: cint): cint {.
    impmltC.}
proc mlt_properties_close*(self: mlt_properties) {.impmltC.}
proc mlt_properties_is_sequence*(self: mlt_properties): cint {.impmltC.}
proc mlt_properties_parse_yaml*(file: cstring): mlt_properties {.impmltC.}
proc mlt_properties_serialise_yaml*(self: mlt_properties): cstring {.impmltC.}
proc mlt_properties_lock*(self: mlt_properties) {.impmltC.}
proc mlt_properties_unlock*(self: mlt_properties) {.impmltC.}
proc mlt_properties_clear*(self: mlt_properties; name: cstring) {.impmltC.}
proc mlt_properties_get_time*(a1: mlt_properties; name: cstring; a3: mlt_time_format): cstring {.
    impmltC.}
proc mlt_properties_frames_to_time*(a1: mlt_properties; a2: mlt_position;
                                   a3: mlt_time_format): cstring {.impmltC.}
proc mlt_properties_time_to_frames*(a1: mlt_properties; time: cstring): mlt_position {.
    impmltC.}
proc mlt_properties_get_color*(a1: mlt_properties; name: cstring): mlt_color {.impmltC.}
proc mlt_properties_set_color*(a1: mlt_properties; name: cstring; value: mlt_color): cint {.
    impmltC.}
proc mlt_properties_anim_get*(self: mlt_properties; name: cstring; position: cint;
                             length: cint): cstring {.impmltC.}
proc mlt_properties_anim_set*(self: mlt_properties; name: cstring; value: cstring;
                             position: cint; length: cint): cint {.impmltC.}
proc mlt_properties_anim_get_int*(self: mlt_properties; name: cstring;
                                 position: cint; length: cint): cint {.impmltC.}
proc mlt_properties_anim_set_int*(self: mlt_properties; name: cstring; value: cint;
                                 position: cint; length: cint;
                                 keyframe_type: mlt_keyframe_type): cint {.impmltC.}
proc mlt_properties_anim_get_double*(self: mlt_properties; name: cstring;
                                    position: cint; length: cint): cdouble {.impmltC.}
proc mlt_properties_anim_set_double*(self: mlt_properties; name: cstring;
                                    value: cdouble; position: cint; length: cint;
                                    keyframe_type: mlt_keyframe_type): cint {.
    impmltC.}
proc mlt_properties_get_animation*(self: mlt_properties; name: cstring): mlt_animation {.
    impmltC.}
proc mlt_properties_set_rect*(self: mlt_properties; name: cstring; value: mlt_rect): cint {.
    impmltC.}
proc mlt_properties_get_rect*(self: mlt_properties; name: cstring): mlt_rect {.impmltC.}
proc mlt_properties_anim_set_rect*(self: mlt_properties; name: cstring;
                                  value: mlt_rect; position: cint; length: cint;
                                  keyframe_type: mlt_keyframe_type): cint {.impmltC.}
proc mlt_properties_anim_get_rect*(self: mlt_properties; name: cstring;
                                  position: cint; length: cint): mlt_rect {.impmltC.}
proc mlt_properties_from_utf8*(properties: mlt_properties; name_from: cstring;
                              name_to: cstring): cint {.impmltC.}
proc mlt_properties_to_utf8*(properties: mlt_properties; name_from: cstring;
                            name_to: cstring): cint {.impmltC.}
proc mlt_deque_init*(): mlt_deque {.impmltC.}
proc mlt_deque_count*(self: mlt_deque): cint {.impmltC.}
proc mlt_deque_push_back*(self: mlt_deque; item: pointer): cint {.impmltC.}
proc mlt_deque_pop_back*(self: mlt_deque): pointer {.impmltC.}
proc mlt_deque_push_front*(self: mlt_deque; item: pointer): cint {.impmltC.}
proc mlt_deque_pop_front*(self: mlt_deque): pointer {.impmltC.}
proc mlt_deque_peek_back*(self: mlt_deque): pointer {.impmltC.}
proc mlt_deque_peek_front*(self: mlt_deque): pointer {.impmltC.}
proc mlt_deque_peek*(self: mlt_deque; index: cint): pointer {.impmltC.}
proc mlt_deque_insert*(self: mlt_deque; item: pointer; a3: mlt_deque_compare): cint {.
    impmltC.}
proc mlt_deque_push_back_int*(self: mlt_deque; item: cint): cint {.impmltC.}
proc mlt_deque_pop_back_int*(self: mlt_deque): cint {.impmltC.}
proc mlt_deque_push_front_int*(self: mlt_deque; item: cint): cint {.impmltC.}
proc mlt_deque_pop_front_int*(self: mlt_deque): cint {.impmltC.}
proc mlt_deque_peek_back_int*(self: mlt_deque): cint {.impmltC.}
proc mlt_deque_peek_front_int*(self: mlt_deque): cint {.impmltC.}
proc mlt_deque_push_back_double*(self: mlt_deque; item: cdouble): cint {.impmltC.}
proc mlt_deque_pop_back_double*(self: mlt_deque): cdouble {.impmltC.}
proc mlt_deque_push_front_double*(self: mlt_deque; item: cdouble): cint {.impmltC.}
proc mlt_deque_pop_front_double*(self: mlt_deque): cdouble {.impmltC.}
proc mlt_deque_peek_back_double*(self: mlt_deque): cdouble {.impmltC.}
proc mlt_deque_peek_front_double*(self: mlt_deque): cdouble {.impmltC.}
proc mlt_deque_close*(self: mlt_deque) {.impmltC.}
proc mlt_service_init*(self: mlt_service; child: pointer): cint {.impmltC.}
proc mlt_service_lock*(self: mlt_service) {.impmltC.}
proc mlt_service_unlock*(self: mlt_service) {.impmltC.}
proc mlt_service_identify*(self: mlt_service): mlt_service_type {.impmltC.}
proc mlt_service_connect_producer*(self: mlt_service; producer: mlt_service;
                                  index: cint): cint {.impmltC.}
proc mlt_service_insert_producer*(self: mlt_service; producer: mlt_service;
                                 index: cint): cint {.impmltC.}
proc mlt_service_disconnect_producer*(self: mlt_service; index: cint): cint {.impmltC.}
proc mlt_service_disconnect_all_producers*(self: mlt_service): cint {.impmltC.}
proc mlt_service_get_producer*(self: mlt_service): mlt_service {.impmltC.}
proc mlt_service_get_frame*(self: mlt_service; frame: mlt_frame_ptr; index: cint): cint {.
    impmltC.}
proc mlt_service_properties*(self: mlt_service): mlt_properties {.impmltC.}
proc mlt_service_consumer*(self: mlt_service): mlt_service {.impmltC.}
proc mlt_service_producer*(self: mlt_service): mlt_service {.impmltC.}
proc mlt_service_attach*(self: mlt_service; filter: mlt_filter): cint {.impmltC.}
proc mlt_service_detach*(self: mlt_service; filter: mlt_filter): cint {.impmltC.}
proc mlt_service_apply_filters*(self: mlt_service; frame: mlt_frame; index: cint) {.
    impmltC.}
proc mlt_service_filter_count*(self: mlt_service): cint {.impmltC.}
proc mlt_service_move_filter*(self: mlt_service; `from`: cint; to: cint): cint {.impmltC.}
proc mlt_service_filter*(self: mlt_service; index: cint): mlt_filter {.impmltC.}
proc mlt_service_profile*(self: mlt_service): mlt_profile {.impmltC.}
proc mlt_service_set_profile*(self: mlt_service; profile: mlt_profile) {.impmltC.}
proc mlt_service_close*(self: mlt_service) {.impmltC.}
proc mlt_service_cache_put*(self: mlt_service; name: cstring; data: pointer;
                           size: cint; destructor: mlt_destructor) {.impmltC.}
proc mlt_service_cache_get*(self: mlt_service; name: cstring): mlt_cache_item {.
    impmltC.}
proc mlt_service_cache_set_size*(self: mlt_service; name: cstring; size: cint) {.
    impmltC.}
proc mlt_service_cache_get_size*(self: mlt_service; name: cstring): cint {.impmltC.}
proc mlt_service_cache_purge*(self: mlt_service) {.impmltC.}
proc mlt_frame_init*(service: mlt_service): mlt_frame {.impmltC.}
proc mlt_frame_properties*(self: mlt_frame): mlt_properties {.impmltC.}
proc mlt_frame_is_test_card*(self: mlt_frame): cint {.impmltC.}
proc mlt_frame_is_test_audio*(self: mlt_frame): cint {.impmltC.}
proc mlt_frame_get_aspect_ratio*(self: mlt_frame): cdouble {.impmltC.}
proc mlt_frame_set_aspect_ratio*(self: mlt_frame; value: cdouble): cint {.impmltC.}
proc mlt_frame_get_position*(self: mlt_frame): mlt_position {.impmltC.}
proc mlt_frame_original_position*(self: mlt_frame): mlt_position {.impmltC.}
proc mlt_frame_set_position*(self: mlt_frame; value: mlt_position): cint {.impmltC.}
proc mlt_frame_set_image*(self: mlt_frame; image: ptr uint8; size: cint;
                         destroy: mlt_destructor): cint {.impmltC.}
proc mlt_frame_set_alpha*(self: mlt_frame; alpha: ptr uint8; size: cint;
                         destroy: mlt_destructor): cint {.impmltC.}
proc mlt_frame_replace_image*(self: mlt_frame; image: ptr uint8;
                             format: mlt_image_format; width: cint; height: cint) {.
    impmltC.}
proc mlt_frame_get_image*(self: mlt_frame; buffer: ptr ptr uint8;
                         format: ptr mlt_image_format; width: ptr cint;
                         height: ptr cint; writable: cint): cint {.impmltC.}
proc mlt_frame_get_alpha_mask*(self: mlt_frame): ptr uint8 {.impmltC.}
proc mlt_frame_get_alpha*(self: mlt_frame): ptr uint8 {.impmltC.}
proc mlt_frame_get_audio*(self: mlt_frame; buffer: ptr pointer;
                         format: ptr mlt_audio_format; frequency: ptr cint;
                         channels: ptr cint; samples: ptr cint): cint {.impmltC.}
proc mlt_frame_set_audio*(self: mlt_frame; buffer: pointer; a3: mlt_audio_format;
                         size: cint; a5: mlt_destructor): cint {.impmltC.}
proc mlt_frame_get_waveform*(self: mlt_frame; w: cint; h: cint): ptr cuchar {.impmltC.}
proc mlt_frame_push_get_image*(self: mlt_frame; get_image: mlt_get_image): cint {.
    impmltC.}
proc mlt_frame_pop_get_image*(self: mlt_frame): mlt_get_image {.impmltC.}
proc mlt_frame_push_frame*(self: mlt_frame; that: mlt_frame): cint {.impmltC.}
proc mlt_frame_pop_frame*(self: mlt_frame): mlt_frame {.impmltC.}
proc mlt_frame_push_service*(self: mlt_frame; that: pointer): cint {.impmltC.}
proc mlt_frame_pop_service*(self: mlt_frame): pointer {.impmltC.}
proc mlt_frame_push_service_int*(self: mlt_frame; that: cint): cint {.impmltC.}
proc mlt_frame_pop_service_int*(self: mlt_frame): cint {.impmltC.}
proc mlt_frame_push_audio*(self: mlt_frame; that: pointer): cint {.impmltC.}
proc mlt_frame_pop_audio*(self: mlt_frame): pointer {.impmltC.}
proc mlt_frame_service_stack*(self: mlt_frame): mlt_deque {.impmltC.}
proc mlt_frame_get_original_producer*(self: mlt_frame): mlt_producer {.impmltC.}
proc mlt_frame_close*(self: mlt_frame) {.impmltC.}
proc mlt_frame_unique_properties*(self: mlt_frame; service: mlt_service): mlt_properties {.
    impmltC.}
proc mlt_frame_get_unique_properties*(self: mlt_frame; service: mlt_service): mlt_properties {.
    impmltC.}
proc mlt_frame_clone*(self: mlt_frame; is_deep: cint): mlt_frame {.impmltC.}
proc mlt_sample_calculator*(fps: cfloat; frequency: cint; position: int64): cint {.
    impmltC.}
proc mlt_sample_calculator_to_now*(fps: cfloat; frequency: cint; position: int64): int64 {.
    impmltC.}
proc mlt_image_format_name*(format: mlt_image_format): cstring {.impmltC.}
proc mlt_image_format_size*(format: mlt_image_format; width: cint; height: cint;
                           bpp: ptr cint): cint {.impmltC.}
proc mlt_audio_format_name*(format: mlt_audio_format): cstring {.impmltC.}
proc mlt_audio_format_size*(format: mlt_audio_format; samples: cint; channels: cint): cint {.
    impmltC.}
proc mlt_frame_write_ppm*(frame: mlt_frame) {.impmltC.}
proc mlt_image_format_planes*(format: mlt_image_format; width: cint; height: cint;
                             data: pointer; planes: array[4, ptr cuchar];
                             strides: array[4, cint]): cint {.impmltC.}
proc mlt_image_format_id*(name: cstring): mlt_image_format {.impmltC.}
proc mlt_channel_layout_name*(layout: mlt_channel_layout): cstring {.impmltC.}
proc mlt_channel_layout_id*(name: cstring): mlt_channel_layout {.impmltC.}
proc mlt_channel_layout_channels*(layout: mlt_channel_layout): cint {.impmltC.}
proc mlt_channel_layout_default*(channels: cint): mlt_channel_layout {.impmltC.}
proc mlt_filter_init*(self: mlt_filter; child: pointer): cint {.impmltC.}
proc mlt_filter_new*(): mlt_filter {.impmltC.}
proc mlt_filter_service*(self: mlt_filter): mlt_service {.impmltC.}
proc mlt_filter_properties*(self: mlt_filter): mlt_properties {.impmltC.}
proc mlt_filter_process*(self: mlt_filter; that: mlt_frame): mlt_frame {.impmltC.}
proc mlt_filter_connect*(self: mlt_filter; producer: mlt_service; index: cint): cint {.
    impmltC.}
proc mlt_filter_set_in_and_out*(self: mlt_filter; `in`: mlt_position;
                               `out`: mlt_position) {.impmltC.}
proc mlt_filter_get_track*(self: mlt_filter): cint {.impmltC.}
proc mlt_filter_get_in*(self: mlt_filter): mlt_position {.impmltC.}
proc mlt_filter_get_out*(self: mlt_filter): mlt_position {.impmltC.}
proc mlt_filter_get_length*(self: mlt_filter): mlt_position {.impmltC.}
proc mlt_filter_get_length2*(self: mlt_filter; frame: mlt_frame): mlt_position {.
    impmltC.}
proc mlt_filter_get_position*(self: mlt_filter; frame: mlt_frame): mlt_position {.
    impmltC.}
proc mlt_filter_get_progress*(self: mlt_filter; frame: mlt_frame): cdouble {.impmltC.}
proc mlt_filter_close*(a1: mlt_filter) {.impmltC.}
proc mlt_producer_init*(self: mlt_producer; child: pointer): cint {.impmltC.}
proc mlt_producer_new*(a1: mlt_profile): mlt_producer {.impmltC.}
proc mlt_producer_service*(self: mlt_producer): mlt_service {.impmltC.}
proc mlt_producer_properties*(self: mlt_producer): mlt_properties {.impmltC.}
proc mlt_producer_seek*(self: mlt_producer; position: mlt_position): cint {.impmltC.}
proc mlt_producer_seek_time*(self: mlt_producer; time: cstring): cint {.impmltC.}
proc mlt_producer_position*(self: mlt_producer): mlt_position {.impmltC.}
proc mlt_producer_frame*(self: mlt_producer): mlt_position {.impmltC.}
proc mlt_producer_frame_time*(self: mlt_producer; a2: mlt_time_format): cstring {.
    impmltC.}
proc mlt_producer_set_speed*(self: mlt_producer; speed: cdouble): cint {.impmltC.}
proc mlt_producer_get_speed*(self: mlt_producer): cdouble {.impmltC.}
proc mlt_producer_get_fps*(self: mlt_producer): cdouble {.impmltC.}
proc mlt_producer_set_in_and_out*(self: mlt_producer; `in`: mlt_position;
                                 `out`: mlt_position): cint {.impmltC.}
proc mlt_producer_clear*(self: mlt_producer): cint {.impmltC.}
proc mlt_producer_get_in*(self: mlt_producer): mlt_position {.impmltC.}
proc mlt_producer_get_out*(self: mlt_producer): mlt_position {.impmltC.}
proc mlt_producer_get_playtime*(self: mlt_producer): mlt_position {.impmltC.}
proc mlt_producer_get_length*(self: mlt_producer): mlt_position {.impmltC.}
proc mlt_producer_get_length_time*(self: mlt_producer; a2: mlt_time_format): cstring {.
    impmltC.}
proc mlt_producer_prepare_next*(self: mlt_producer) {.impmltC.}
proc mlt_producer_attach*(self: mlt_producer; filter: mlt_filter): cint {.impmltC.}
proc mlt_producer_detach*(self: mlt_producer; filter: mlt_filter): cint {.impmltC.}
proc mlt_producer_filter*(self: mlt_producer; index: cint): mlt_filter {.impmltC.}
proc mlt_producer_cut*(self: mlt_producer; `in`: cint; `out`: cint): mlt_producer {.
    impmltC.}
proc mlt_producer_is_cut*(self: mlt_producer): cint {.impmltC.}
proc mlt_producer_is_mix*(self: mlt_producer): cint {.impmltC.}
proc mlt_producer_is_blank*(self: mlt_producer): cint {.impmltC.}
proc mlt_producer_cut_parent*(self: mlt_producer): mlt_producer {.impmltC.}
proc mlt_producer_optimise*(self: mlt_producer): cint {.impmltC.}
proc mlt_producer_close*(self: mlt_producer) {.impmltC.}
proc mlt_producer_get_creation_time*(self: mlt_producer): int64 {.impmltC.}
proc mlt_producer_set_creation_time*(self: mlt_producer; creation_time: int64) {.
    impmltC.}
proc mlt_multitrack_init*(): mlt_multitrack {.impmltC.}
proc mlt_multitrack_producer*(self: mlt_multitrack): mlt_producer {.impmltC.}
proc mlt_multitrack_service*(self: mlt_multitrack): mlt_service {.impmltC.}
proc mlt_multitrack_properties*(self: mlt_multitrack): mlt_properties {.impmltC.}
proc mlt_multitrack_connect*(self: mlt_multitrack; producer: mlt_producer;
                            track: cint): cint {.impmltC.}
proc mlt_multitrack_insert*(self: mlt_multitrack; producer: mlt_producer; track: cint): cint {.
    impmltC.}
proc mlt_multitrack_disconnect*(self: mlt_multitrack; track: cint): cint {.impmltC.}
proc mlt_multitrack_clip*(self: mlt_multitrack; whence: mlt_whence; index: cint): mlt_position {.
    impmltC.}
proc mlt_multitrack_close*(self: mlt_multitrack) {.impmltC.}
proc mlt_multitrack_count*(self: mlt_multitrack): cint {.impmltC.}
proc mlt_multitrack_refresh*(self: mlt_multitrack) {.impmltC.}
proc mlt_multitrack_track*(self: mlt_multitrack; track: cint): mlt_producer {.impmltC.}
proc mlt_transition_init*(self: mlt_transition; child: pointer): cint {.impmltC.}
proc mlt_transition_new*(): mlt_transition {.impmltC.}
proc mlt_transition_service*(self: mlt_transition): mlt_service {.impmltC.}
proc mlt_transition_properties*(self: mlt_transition): mlt_properties {.impmltC.}
proc mlt_transition_connect*(self: mlt_transition; producer: mlt_service;
                            a_track: cint; b_track: cint): cint {.impmltC.}
proc mlt_transition_set_in_and_out*(self: mlt_transition; `in`: mlt_position;
                                   `out`: mlt_position) {.impmltC.}
proc mlt_transition_set_tracks*(self: mlt_transition; a_track: cint; b_track: cint) {.
    impmltC.}
proc mlt_transition_get_a_track*(self: mlt_transition): cint {.impmltC.}
proc mlt_transition_get_b_track*(self: mlt_transition): cint {.impmltC.}
proc mlt_transition_get_in*(self: mlt_transition): mlt_position {.impmltC.}
proc mlt_transition_get_out*(self: mlt_transition): mlt_position {.impmltC.}
proc mlt_transition_get_length*(self: mlt_transition): mlt_position {.impmltC.}
proc mlt_transition_get_position*(self: mlt_transition; frame: mlt_frame): mlt_position {.
    impmltC.}
proc mlt_transition_get_progress*(self: mlt_transition; frame: mlt_frame): cdouble {.
    impmltC.}
proc mlt_transition_get_progress_delta*(self: mlt_transition; frame: mlt_frame): cdouble {.
    impmltC.}
proc mlt_transition_process*(self: mlt_transition; a_frame: mlt_frame;
                            b_frame: mlt_frame): mlt_frame {.impmltC.}
proc mlt_transition_close*(self: mlt_transition) {.impmltC.}
proc mlt_consumer_init*(self: mlt_consumer; child: pointer; profile: mlt_profile): cint {.
    impmltC.}
proc mlt_consumer_new*(profile: mlt_profile): mlt_consumer {.impmltC.}
proc mlt_consumer_service*(self: mlt_consumer): mlt_service {.impmltC.}
proc mlt_consumer_properties*(self: mlt_consumer): mlt_properties {.impmltC.}
proc mlt_consumer_connect*(self: mlt_consumer; producer: mlt_service): cint {.impmltC.}
proc mlt_consumer_start*(self: mlt_consumer): cint {.impmltC.}
proc mlt_consumer_purge*(self: mlt_consumer) {.impmltC.}
proc mlt_consumer_put_frame*(self: mlt_consumer; frame: mlt_frame): cint {.impmltC.}
proc mlt_consumer_get_frame*(self: mlt_consumer): mlt_frame {.impmltC.}
proc mlt_consumer_rt_frame*(self: mlt_consumer): mlt_frame {.impmltC.}
proc mlt_consumer_stop*(self: mlt_consumer): cint {.impmltC.}
proc mlt_consumer_is_stopped*(self: mlt_consumer): cint {.impmltC.}
proc mlt_consumer_stopped*(self: mlt_consumer) {.impmltC.}
proc mlt_consumer_close*(a1: mlt_consumer) {.impmltC.}
proc mlt_consumer_position*(a1: mlt_consumer): mlt_position {.impmltC.}
proc mlt_playlist_init*(): mlt_playlist {.impmltC.}
proc mlt_playlist_new*(profile: mlt_profile): mlt_playlist {.impmltC.}
proc mlt_playlist_producer*(self: mlt_playlist): mlt_producer {.impmltC.}
proc mlt_playlist_service*(self: mlt_playlist): mlt_service {.impmltC.}
proc mlt_playlist_properties*(self: mlt_playlist): mlt_properties {.impmltC.}
proc mlt_playlist_count*(self: mlt_playlist): cint {.impmltC.}
proc mlt_playlist_clear*(self: mlt_playlist): cint {.impmltC.}
proc mlt_playlist_append*(self: mlt_playlist; producer: mlt_producer): cint {.impmltC.}
proc mlt_playlist_append_io*(self: mlt_playlist; producer: mlt_producer;
                            `in`: mlt_position; `out`: mlt_position): cint {.impmltC.}
proc mlt_playlist_blank*(self: mlt_playlist; `out`: mlt_position): cint {.impmltC.}
proc mlt_playlist_blank_time*(self: mlt_playlist; length: cstring): cint {.impmltC.}
proc mlt_playlist_clip*(self: mlt_playlist; whence: mlt_whence; index: cint): mlt_position {.
    impmltC.}
proc mlt_playlist_current_clip*(self: mlt_playlist): cint {.impmltC.}
proc mlt_playlist_current*(self: mlt_playlist): mlt_producer {.impmltC.}
proc mlt_playlist_get_clip_info*(self: mlt_playlist;
                                info: ptr mlt_playlist_clip_info; index: cint): cint {.
    impmltC.}
proc mlt_playlist_insert*(self: mlt_playlist; producer: mlt_producer; where: cint;
                         `in`: mlt_position; `out`: mlt_position): cint {.impmltC.}
proc mlt_playlist_remove*(self: mlt_playlist; where: cint): cint {.impmltC.}
proc mlt_playlist_move*(self: mlt_playlist; `from`: cint; to: cint): cint {.impmltC.}
proc mlt_playlist_reorder*(self: mlt_playlist; indices: ptr cint): cint {.impmltC.}
proc mlt_playlist_resize_clip*(self: mlt_playlist; clip: cint; `in`: mlt_position;
                              `out`: mlt_position): cint {.impmltC.}
proc mlt_playlist_repeat_clip*(self: mlt_playlist; clip: cint; repeat: cint): cint {.
    impmltC.}
proc mlt_playlist_split*(self: mlt_playlist; clip: cint; position: mlt_position): cint {.
    impmltC.}
proc mlt_playlist_split_at*(self: mlt_playlist; position: mlt_position; left: cint): cint {.
    impmltC.}
proc mlt_playlist_join*(self: mlt_playlist; clip: cint; count: cint; merge: cint): cint {.
    impmltC.}
proc mlt_playlist_mix*(self: mlt_playlist; clip: cint; length: cint;
                      transition: mlt_transition): cint {.impmltC.}
proc mlt_playlist_mix_in*(self: mlt_playlist; clip: cint; length: cint): cint {.impmltC.}
proc mlt_playlist_mix_out*(self: mlt_playlist; clip: cint; length: cint): cint {.impmltC.}
proc mlt_playlist_mix_add*(self: mlt_playlist; clip: cint; transition: mlt_transition): cint {.
    impmltC.}
proc mlt_playlist_get_clip*(self: mlt_playlist; clip: cint): mlt_producer {.impmltC.}
proc mlt_playlist_get_clip_at*(self: mlt_playlist; position: mlt_position): mlt_producer {.
    impmltC.}
proc mlt_playlist_get_clip_index_at*(self: mlt_playlist; position: mlt_position): cint {.
    impmltC.}
proc mlt_playlist_clip_is_mix*(self: mlt_playlist; clip: cint): cint {.impmltC.}
proc mlt_playlist_consolidate_blanks*(self: mlt_playlist; keep_length: cint) {.
    impmltC.}
proc mlt_playlist_is_blank*(self: mlt_playlist; clip: cint): cint {.impmltC.}
proc mlt_playlist_is_blank_at*(self: mlt_playlist; position: mlt_position): cint {.
    impmltC.}
proc mlt_playlist_insert_blank*(self: mlt_playlist; clip: cint; `out`: cint) {.impmltC.}
proc mlt_playlist_pad_blanks*(self: mlt_playlist; position: mlt_position;
                             length: cint; find: cint) {.impmltC.}
proc mlt_playlist_replace_with_blank*(self: mlt_playlist; clip: cint): mlt_producer {.
    impmltC.}
proc mlt_playlist_insert_at*(self: mlt_playlist; position: mlt_position;
                            producer: mlt_producer; mode: cint): cint {.impmltC.}
proc mlt_playlist_clip_start*(self: mlt_playlist; clip: cint): cint {.impmltC.}
proc mlt_playlist_clip_length*(self: mlt_playlist; clip: cint): cint {.impmltC.}
proc mlt_playlist_blanks_from*(self: mlt_playlist; clip: cint; bounded: cint): cint {.
    impmltC.}
proc mlt_playlist_remove_region*(self: mlt_playlist; position: mlt_position;
                                length: cint): cint {.impmltC.}
proc mlt_playlist_move_region*(self: mlt_playlist; position: mlt_position;
                              length: cint; new_position: cint): cint {.impmltC.}
proc mlt_playlist_close*(self: mlt_playlist) {.impmltC.}
proc mlt_field_init*(): mlt_field {.impmltC.}
proc mlt_field_new*(multitrack: mlt_multitrack; tractor: mlt_tractor): mlt_field {.
    impmltC.}
proc mlt_field_service*(self: mlt_field): mlt_service {.impmltC.}
proc mlt_field_tractor*(self: mlt_field): mlt_tractor {.impmltC.}
proc mlt_field_multitrack*(self: mlt_field): mlt_multitrack {.impmltC.}
proc mlt_field_properties*(self: mlt_field): mlt_properties {.impmltC.}
proc mlt_field_plant_filter*(self: mlt_field; that: mlt_filter; track: cint): cint {.
    impmltC.}
proc mlt_field_plant_transition*(self: mlt_field; that: mlt_transition;
                                a_track: cint; b_track: cint): cint {.impmltC.}
proc mlt_field_close*(self: mlt_field) {.impmltC.}
proc mlt_field_disconnect_service*(self: mlt_field; service: mlt_service) {.impmltC.}
proc mlt_tractor_init*(): mlt_tractor {.impmltC.}
proc mlt_tractor_new*(): mlt_tractor {.impmltC.}
proc mlt_tractor_service*(self: mlt_tractor): mlt_service {.impmltC.}
proc mlt_tractor_producer*(self: mlt_tractor): mlt_producer {.impmltC.}
proc mlt_tractor_properties*(self: mlt_tractor): mlt_properties {.impmltC.}
proc mlt_tractor_field*(self: mlt_tractor): mlt_field {.impmltC.}
proc mlt_tractor_multitrack*(self: mlt_tractor): mlt_multitrack {.impmltC.}
proc mlt_tractor_connect*(self: mlt_tractor; service: mlt_service): cint {.impmltC.}
proc mlt_tractor_refresh*(self: mlt_tractor) {.impmltC.}
proc mlt_tractor_set_track*(self: mlt_tractor; producer: mlt_producer; index: cint): cint {.
    impmltC.}
proc mlt_tractor_insert_track*(self: mlt_tractor; producer: mlt_producer; index: cint): cint {.
    impmltC.}
proc mlt_tractor_remove_track*(self: mlt_tractor; index: cint): cint {.impmltC.}
proc mlt_tractor_get_track*(self: mlt_tractor; index: cint): mlt_producer {.impmltC.}
proc mlt_tractor_close*(self: mlt_tractor) {.impmltC.}
proc mlt_tokeniser_init*(): mlt_tokeniser {.impmltC.}
proc mlt_tokeniser_parse_new*(tokeniser: mlt_tokeniser; text: cstring;
                             delimiter: cstring): cint {.impmltC.}
proc mlt_tokeniser_get_input*(tokeniser: mlt_tokeniser): cstring {.impmltC.}
proc mlt_tokeniser_count*(tokeniser: mlt_tokeniser): cint {.impmltC.}
proc mlt_tokeniser_get_string*(tokeniser: mlt_tokeniser; index: cint): cstring {.
    impmltC.}
proc mlt_tokeniser_close*(tokeniser: mlt_tokeniser) {.impmltC.}
proc mlt_parser_new*(): mlt_parser {.impmltC.}
proc mlt_parser_properties*(self: mlt_parser): mlt_properties {.impmltC.}
proc mlt_parser_start*(self: mlt_parser; `object`: mlt_service): cint {.impmltC.}
proc mlt_parser_close*(self: mlt_parser) {.impmltC.}
proc mlt_geometry_init*(): mlt_geometry {.impmltC.}
proc mlt_geometry_parse*(self: mlt_geometry; data: cstring; length: cint; nw: cint;
                        nh: cint): cint {.impmltC.}
proc mlt_geometry_refresh*(self: mlt_geometry; data: cstring; length: cint; nw: cint;
                          nh: cint): cint {.impmltC.}
proc mlt_geometry_get_length*(self: mlt_geometry): cint {.impmltC.}
proc mlt_geometry_set_length*(self: mlt_geometry; length: cint) {.impmltC.}
proc mlt_geometry_parse_item*(self: mlt_geometry; item: mlt_geometry_item;
                             data: cstring): cint {.impmltC.}
proc mlt_geometry_fetch*(self: mlt_geometry; item: mlt_geometry_item;
                        position: cfloat): cint {.impmltC.}
proc mlt_geometry_insert*(self: mlt_geometry; item: mlt_geometry_item): cint {.impmltC.}
proc mlt_geometry_remove*(self: mlt_geometry; position: cint): cint {.impmltC.}
proc mlt_geometry_interpolate*(self: mlt_geometry) {.impmltC.}
proc mlt_geometry_next_key*(self: mlt_geometry; item: mlt_geometry_item;
                           position: cint): cint {.impmltC.}
proc mlt_geometry_prev_key*(self: mlt_geometry; item: mlt_geometry_item;
                           position: cint): cint {.impmltC.}
proc mlt_geometry_serialise_cut*(self: mlt_geometry; `in`: cint; `out`: cint): cstring {.
    impmltC.}
proc mlt_geometry_serialise*(self: mlt_geometry): cstring {.impmltC.}
proc mlt_geometry_close*(self: mlt_geometry) {.impmltC.}
proc mlt_log*(service: pointer; level: cint; fmt: cstring) {.impmltC.}
proc mlt_vlog*(service: pointer; level: cint; fmt: cstring; a4: va_list) {.impmltC.}
proc mlt_log_get_level*(): cint {.impmltC.}
proc mlt_log_set_level*(a1: cint) {.impmltC.}
proc mlt_log_set_callback*(a1: proc (a1: pointer; a2: cint; a3: cstring; a4: va_list) {.
    cdecl.}) {.impmltC.}
proc mlt_log_timings_now*(): int64 {.impmltC.}
proc mlt_cache_item_data*(item: mlt_cache_item; size: ptr cint): pointer {.impmltC.}
proc mlt_cache_item_close*(item: mlt_cache_item) {.impmltC.}
proc mlt_cache_init*(): mlt_cache {.impmltC.}
proc mlt_cache_set_size*(cache: mlt_cache; size: cint) {.impmltC.}
proc mlt_cache_get_size*(cache: mlt_cache): cint {.impmltC.}
proc mlt_cache_close*(cache: mlt_cache) {.impmltC.}
proc mlt_cache_purge*(cache: mlt_cache; `object`: pointer) {.impmltC.}
proc mlt_cache_put*(cache: mlt_cache; `object`: pointer; data: pointer; size: cint;
                   destructor: mlt_destructor) {.impmltC.}
proc mlt_cache_get*(cache: mlt_cache; `object`: pointer): mlt_cache_item {.impmltC.}
proc mlt_cache_put_frame*(cache: mlt_cache; frame: mlt_frame) {.impmltC.}
proc mlt_cache_get_frame*(cache: mlt_cache; position: mlt_position): mlt_frame {.
    impmltC.}
proc mlt_version_get_int*(): cint {.impmltC.}
proc mlt_version_get_major*(): cint {.impmltC.}
proc mlt_version_get_minor*(): cint {.impmltC.}
proc mlt_version_get_revision*(): cint {.impmltC.}
proc mlt_version_get_string*(): cstring {.impmltC.}
proc mlt_slices_init*(threads: cint; policy: cint; priority: cint): mlt_slices {.impmltC.}
proc mlt_slices_close*(ctx: mlt_slices) {.impmltC.}
proc mlt_slices_run*(ctx: mlt_slices; jobs: cint; `proc`: mlt_slices_proc;
                    cookie: pointer) {.impmltC.}
proc mlt_slices_count_normal*(): cint {.impmltC.}
proc mlt_slices_count_rr*(): cint {.impmltC.}
proc mlt_slices_count_fifo*(): cint {.impmltC.}
proc mlt_slices_run_normal*(jobs: cint; `proc`: mlt_slices_proc; cookie: pointer) {.
    impmltC.}
proc mlt_slices_run_rr*(jobs: cint; `proc`: mlt_slices_proc; cookie: pointer) {.impmltC.}
proc mlt_slices_run_fifo*(jobs: cint; `proc`: mlt_slices_proc; cookie: pointer) {.
    impmltC.}
