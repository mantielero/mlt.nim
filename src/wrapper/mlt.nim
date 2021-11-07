# Generated @ 2021-11-06T23:06:23+01:00
# Command line:
#   /home/jose/.nimble/pkgs/nimterop-0.6.13/nimterop/toast --preprocess -m:c --recurse --includeDirs+=/usr/include/mlt-7/framework --pnim --dynlib=libmlt-7.so --symOverride=mlt_property_s,mlt_event_struct,mlt_field_s,mlt_deque_s,mlt_geometry_s,mlt_geometry_item_s,mlt_repository_s,mlt_cache_s,mlt_cache_item_s,mlt_animation_s,playlist_entry_s,locale_t,mlt_tokeniser --nim:/home/jose/.choosenim/toolchains/nim-1.4.8/bin/nim --pluginSourcePath=/home/jose/.cache/nim/nimterop/cPlugins/nimterop_1891033265.nim /usr/include/mlt-7/framework/mlt.h -o /home/jose/src/nimlang/mlt/src/wrapper2/mlt.nim

# const 'GCC_VERSION' has unsupported value '(__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)'
# const 'mlt_fopen' has unsupported value 'fopen'
# const 'MLT_REPOSITORY' has unsupported value 'void mlt_register( mlt_repository repository )'
# const 'LIBMLT_VERSION' has unsupported value 'MLT_STRINGIZE(LIBMLT_VERSION_MAJOR.LIBMLT_VERSION_MINOR.LIBMLT_VERSION_REVISION)'
{.push hint[ConvFromXtoItselfNotNeeded]: off.}
import macros

macro defineEnum(typ: untyped): untyped =
  result = newNimNode(nnkStmtList)

  # Enum mapped to distinct cint
  result.add quote do:
    type `typ`* = distinct cint

  for i in ["+", "-", "*", "div", "mod", "shl", "shr", "or", "and", "xor", "<", "<=", "==", ">", ">="]:
    let
      ni = newIdentNode(i)
      typout = if i[0] in "<=>": newIdentNode("bool") else: typ # comparisons return bool
    if i[0] == '>': # cannot borrow `>` and `>=` from templates
      let
        nopp = if i.len == 2: newIdentNode("<=") else: newIdentNode("<")
      result.add quote do:
        proc `ni`*(x: `typ`, y: cint): `typout` = `nopp`(y, x)
        proc `ni`*(x: cint, y: `typ`): `typout` = `nopp`(y, x)
        proc `ni`*(x, y: `typ`): `typout` = `nopp`(y, x)
    else:
      result.add quote do:
        proc `ni`*(x: `typ`, y: cint): `typout` {.borrow.}
        proc `ni`*(x: cint, y: `typ`): `typout` {.borrow.}
        proc `ni`*(x, y: `typ`): `typout` {.borrow.}
    result.add quote do:
      proc `ni`*(x: `typ`, y: int): `typout` = `ni`(x, y.cint)
      proc `ni`*(x: int, y: `typ`): `typout` = `ni`(x.cint, y)

  let
    divop = newIdentNode("/")   # `/`()
    dlrop = newIdentNode("$")   # `$`()
    notop = newIdentNode("not") # `not`()
  result.add quote do:
    proc `divop`*(x, y: `typ`): `typ` = `typ`((x.float / y.float).cint)
    proc `divop`*(x: `typ`, y: cint): `typ` = `divop`(x, `typ`(y))
    proc `divop`*(x: cint, y: `typ`): `typ` = `divop`(`typ`(x), y)
    proc `divop`*(x: `typ`, y: int): `typ` = `divop`(x, y.cint)
    proc `divop`*(x: int, y: `typ`): `typ` = `divop`(x.cint, y)

    proc `dlrop`*(x: `typ`): string {.borrow.}
    proc `notop`*(x: `typ`): `typ` {.borrow.}

type va_list* {.importc, header:"<stdarg.h>".} = object


{.pragma: impmltHdr, header: "/usr/include/mlt-7/framework/mlt.h".}
{.pragma: impmltDyn, dynlib: "libmlt-7.so".}
{.experimental: "codeReordering".}
{.passC: "-I/usr/include/mlt-7/framework".}
defineEnum(mlt_image_format)
defineEnum(mlt_audio_format)
defineEnum(mlt_channel_layout)
defineEnum(mlt_colorspace)
defineEnum(mlt_time_format)
defineEnum(mlt_keyframe_type)
defineEnum(mlt_whence)
defineEnum(mlt_service_type)
const
  mlt_image_none* = (0).mlt_image_format ## ```
                                         ##   < image not available
                                         ## ```
  mlt_image_rgb* = (mlt_image_none + 1).mlt_image_format ## ```
                                                         ##   < 8-bit RGB
                                                         ## ```
  mlt_image_rgba* = (mlt_image_rgb + 1).mlt_image_format ## ```
                                                         ##   < 8-bit RGB with alpha channel
                                                         ## ```
  mlt_image_yuv422* = (mlt_image_rgba + 1).mlt_image_format ## ```
                                                            ##   < 8-bit YUV 4:2:2 packed
                                                            ## ```
  mlt_image_yuv420p* = (mlt_image_yuv422 + 1).mlt_image_format ## ```
                                                               ##   < 8-bit YUV 4:2:0 planar
                                                               ## ```
  mlt_image_movit* = (mlt_image_yuv420p + 1).mlt_image_format ## ```
                                                              ##   < for movit module internal use only
                                                              ## ```
  mlt_image_opengl_texture* = (mlt_image_movit + 1).mlt_image_format ## ```
                                                                     ##   < an OpenGL texture name
                                                                     ## ```
  mlt_image_yuv422p16* = (mlt_image_opengl_texture + 1).mlt_image_format ## ```
                                                                         ##   < planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
                                                                         ## ```
  mlt_image_invalid* = (mlt_image_yuv422p16 + 1).mlt_image_format ## ```
                                                                  ##   < planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
                                                                  ## ```
  mlt_audio_none* = (0).mlt_audio_format ## ```
                                         ##   < audio not available
                                         ## ```
  mlt_audio_s16* = (1).mlt_audio_format ## ```
                                        ##   < signed 16-bit interleaved PCM
                                        ## ```
  mlt_audio_s32* = (mlt_audio_s16 + 1).mlt_audio_format ## ```
                                                        ##   < signed 32-bit non-interleaved PCM
                                                        ## ```
  mlt_audio_float* = (mlt_audio_s32 + 1).mlt_audio_format ## ```
                                                          ##   < 32-bit non-interleaved floating point
                                                          ## ```
  mlt_audio_s32le* = (mlt_audio_float + 1).mlt_audio_format ## ```
                                                            ##   < signed 32-bit interleaved PCM
                                                            ## ```
  mlt_audio_f32le* = (mlt_audio_s32le + 1).mlt_audio_format ## ```
                                                            ##   < 32-bit interleaved floating point
                                                            ## ```
  mlt_audio_u8* = (mlt_audio_f32le + 1).mlt_audio_format ## ```
                                                         ##   < unsigned 8-bit interleaved PCM
                                                         ## ```
  mlt_channel_auto* = (0).mlt_channel_layout ## ```
                                             ##   < MLT will determine the default configuration based on channel number
                                             ## ```
  mlt_channel_independent* = (mlt_channel_auto + 1).mlt_channel_layout ## ```
                                                                       ##   < channels are not related
                                                                       ## ```
  mlt_channel_mono* = (mlt_channel_independent + 1).mlt_channel_layout ## ```
                                                                       ##   < channels are not related
                                                                       ## ```
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
  mlt_colorspace_rgb* = (0).mlt_colorspace ## ```
                                           ##   /< order of coefficients is actually GBR, also IEC 61966-2-1 (sRGB)
                                           ## ```
  mlt_colorspace_bt709* = (1).mlt_colorspace ## ```
                                             ##   /< also ITU-R BT1361 / IEC 61966-2-4 xvYCC709 / SMPTE RP177 Annex B
                                             ## ```
  mlt_colorspace_unspecified* = (2).mlt_colorspace ## ```
                                                   ##   /< also ITU-R BT1361 / IEC 61966-2-4 xvYCC709 / SMPTE RP177 Annex B
                                                   ## ```
  mlt_colorspace_reserved* = (3).mlt_colorspace
  mlt_colorspace_fcc* = (4).mlt_colorspace ## ```
                                           ##   /< FCC Title 47 Code of Federal Regulations 73.682 (a)(20)
                                           ## ```
  mlt_colorspace_bt470bg* = (5).mlt_colorspace ## ```
                                               ##   /< also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM / IEC 61966-2-4 xvYCC601
                                               ## ```
  mlt_colorspace_smpte170m* = (6).mlt_colorspace ## ```
                                                 ##   /< also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC
                                                 ## ```
  mlt_colorspace_smpte240m* = (7).mlt_colorspace ## ```
                                                 ##   /< functionally identical to above
                                                 ## ```
  mlt_colorspace_ycgco* = (8).mlt_colorspace ## ```
                                             ##   /< Used by Dirac / VC-2 and H.264 FRext, see ITU-T SG16
                                             ## ```
  mlt_colorspace_bt2020_ncl* = (9).mlt_colorspace ## ```
                                                  ##   /< ITU-R BT2020 non-constant luminance system
                                                  ## ```
  mlt_colorspace_bt2020_cl* = (10).mlt_colorspace ## ```
                                                  ##   /< ITU-R BT2020 constant luminance system
                                                  ## ```
  mlt_colorspace_smpte2085* = (11).mlt_colorspace ## ```
                                                  ##   /< SMPTE 2085, Y'D'zD'x
                                                  ## ```
  mlt_time_frames* = (0).mlt_time_format ## ```
                                         ##   < frame count
                                         ## ```
  mlt_time_clock* = (mlt_time_frames + 1).mlt_time_format ## ```
                                                          ##   < SMIL clock-value as [[hh:]mm:]ss[.fraction]
                                                          ## ```
  mlt_time_smpte_df* = (mlt_time_clock + 1).mlt_time_format ## ```
                                                            ##   < SMPTE timecode as [[[hh:]mm:]ss{:|;}]frames
                                                            ## ```
  mlt_time_smpte_ndf* = (mlt_time_smpte_df + 1).mlt_time_format ## ```
                                                                ##   < SMPTE NDF timecode as [[[hh:]mm:]ss:]frames
                                                                ## ```
  mlt_keyframe_discrete* = (0).mlt_keyframe_type ## ```
                                                 ##   < non-interpolated; value changes instantaneously at the key frame
                                                 ## ```
  mlt_keyframe_linear* = (mlt_keyframe_discrete + 1).mlt_keyframe_type ## ```
                                                                       ##   < simple, constant pace from this key frame to the next
                                                                       ## ```
  mlt_keyframe_smooth* = (mlt_keyframe_linear + 1).mlt_keyframe_type ## ```
                                                                     ##   < eased pacing from this keyframe to the next using a Catmull-Rom spline
                                                                     ## ```
  mlt_whence_relative_start* = (0).mlt_whence ## ```
                                              ##   < relative to the beginning
                                              ## ```
  mlt_whence_relative_current* = (mlt_whence_relative_start + 1).mlt_whence ## ```
                                                                            ##   < relative to the current position
                                                                            ## ```
  mlt_whence_relative_end* = (mlt_whence_relative_current + 1).mlt_whence ## ```
                                                                          ##   < relative to the end
                                                                          ## ```
  mlt_service_invalid_type* = (0).mlt_service_type ## ```
                                                   ##   < invalid service
                                                   ## ```
  mlt_service_unknown_type* = (mlt_service_invalid_type + 1).mlt_service_type ## ```
                                                                              ##   < unknown class
                                                                              ## ```
  mlt_service_producer_type* = (mlt_service_unknown_type + 1).mlt_service_type ## ```
                                                                               ##   < Producer class
                                                                               ## ```
  mlt_service_tractor_type* = (mlt_service_producer_type + 1).mlt_service_type ## ```
                                                                               ##   < Tractor class
                                                                               ## ```
  mlt_service_playlist_type* = (mlt_service_tractor_type + 1).mlt_service_type ## ```
                                                                               ##   < Playlist class
                                                                               ## ```
  mlt_service_multitrack_type* = (mlt_service_playlist_type + 1).mlt_service_type ## ```
                                                                                  ##   < Multitrack class
                                                                                  ## ```
  mlt_service_filter_type* = (mlt_service_multitrack_type + 1).mlt_service_type ## ```
                                                                                ##   < Filter class
                                                                                ## ```
  mlt_service_transition_type* = (mlt_service_filter_type + 1).mlt_service_type ## ```
                                                                                ##   < Transition class
                                                                                ## ```
  mlt_service_consumer_type* = (mlt_service_transition_type + 1).mlt_service_type ## ```
                                                                                  ##   < Consumer class
                                                                                  ## ```
  mlt_service_field_type* = (mlt_service_consumer_type + 1).mlt_service_type ## ```
                                                                             ##   < Field class
                                                                             ## ```
  mlt_service_link_type* = (mlt_service_field_type + 1).mlt_service_type ## ```
                                                                         ##   < Link class
                                                                         ## ```
  mlt_service_chain_type* = (mlt_service_link_type + 1).mlt_service_type ## ```
                                                                         ##   < Chain class
                                                                         ## ```
  MLT_POSITION_FMT* = "%d"
  MLT_DIRLIST_DELIMITER* = ":"
  MLT_IMAGE_MAX_PLANES* = 4
  MLT_LOG_QUIET* = -8
  MLT_LOG_PANIC* = 0
  MLT_LOG_FATAL* = 8
  MLT_LOG_ERROR* = 16
  MLT_LOG_WARNING* = 24
  MLT_LOG_INFO* = 32
  MLT_LOG_VERBOSE* = 40
  MLT_LOG_TIMINGS* = 44
  MLT_LOG_DEBUG* = 48
  LIBMLT_VERSION_MAJOR* = 7
  LIBMLT_VERSION_MINOR* = 0
  LIBMLT_VERSION_REVISION* = 0
  LIBMLT_VERSION_INT* = ((LIBMLT_VERSION_MAJOR shl
      typeof(LIBMLT_VERSION_MAJOR)(16)) +
      typeof(LIBMLT_VERSION_MAJOR)((LIBMLT_VERSION_MINOR shl
      typeof(LIBMLT_VERSION_MAJOR)(8))) +
      typeof(LIBMLT_VERSION_MAJOR)(LIBMLT_VERSION_REVISION))
type
  mlt_repository_s = object
  playlist_entry_s = object
  mlt_animation_s = object
  mlt_tokeniser = object
  mlt_cache_item_s = object
  mlt_geometry_s = object
  mlt_geometry_item_s = object
  mlt_property_s = object
  mlt_event_struct = object
  mlt_deque_s = object
  locale_t = cstring
  mlt_field_s = object
  mlt_cache_s = object
  mlt_position* {.importc, impmltHdr.} = int32
  mlt_rect* {.bycopy, importc, impmltHdr.} = object
    x*: cdouble              ## ```
                             ##   < X coordinate
                             ## ```
    y*: cdouble              ## ```
                             ##   < Y coordinate
                             ## ```
    w*: cdouble              ## ```
                             ##   < width
                             ## ```
    h*: cdouble              ## ```
                             ##   < height
                             ## ```
    o*: cdouble              ## ```
                             ##   < opacity / mix-level
                             ## ```
  
  mlt_color* {.bycopy, importc, impmltHdr.} = object
    r*: uint8                ## ```
                             ##   < red
                             ## ```
    g*: uint8                ## ```
                             ##   < green
                             ## ```
    b*: uint8                ## ```
                             ##   < blue
                             ## ```
    a*: uint8                ## ```
                             ##   < alpha
                             ## ```
  
  mlt_audio* {.importc, impmltHdr.} = ptr mlt_audio_s ## ```
                                                      ##   < pointer to Audio object
                                                      ## ```
  mlt_image* {.importc, impmltHdr.} = ptr mlt_image_s ## ```
                                                      ##   < pointer to Image object
                                                      ## ```
  mlt_frame* {.importc, impmltHdr.} = ptr mlt_frame_s ## ```
                                                      ##   < pointer to Frame object
                                                      ## ```
  mlt_frame_ptr* {.importc, impmltHdr.} = ptr ptr mlt_frame_s ## ```
                                                              ##   < pointer to Frame object
                                                              ## ```
  mlt_property* {.importc, impmltHdr.} = ptr mlt_property_s ## ```
                                                            ##   < pointer to Property object
                                                            ## ```
  mlt_properties* {.importc, impmltHdr.} = ptr mlt_properties_s ## ```
                                                                ##   < pointer to Properties object
                                                                ## ```
  mlt_event* {.importc, impmltHdr.} = ptr mlt_event_struct ## ```
                                                           ##   < pointer to Event object
                                                           ## ```
  mlt_service* {.importc, impmltHdr.} = ptr mlt_service_s ## ```
                                                          ##   < pointer to Service object
                                                          ## ```
  mlt_producer* {.importc, impmltHdr.} = ptr mlt_producer_s ## ```
                                                            ##   < pointer to Producer object
                                                            ## ```
  mlt_playlist* {.importc, impmltHdr.} = ptr mlt_playlist_s ## ```
                                                            ##   < pointer to Playlist object
                                                            ## ```
  mlt_multitrack* {.importc, impmltHdr.} = ptr mlt_multitrack_s ## ```
                                                                ##   < pointer to Multitrack object
                                                                ## ```
  mlt_filter* {.importc, impmltHdr.} = ptr mlt_filter_s ## ```
                                                        ##   < pointer to Filter object
                                                        ## ```
  mlt_transition* {.importc, impmltHdr.} = ptr mlt_transition_s ## ```
                                                                ##   < pointer to Transition object
                                                                ## ```
  mlt_tractor* {.importc, impmltHdr.} = ptr mlt_tractor_s ## ```
                                                          ##   < pointer to Tractor object
                                                          ## ```
  mlt_field* {.importc, impmltHdr.} = ptr mlt_field_s ## ```
                                                      ##   < pointer to Field object
                                                      ## ```
  mlt_consumer* {.importc, impmltHdr.} = ptr mlt_consumer_s ## ```
                                                            ##   < pointer to Consumer object
                                                            ## ```
  mlt_parser* {.importc, impmltHdr.} = ptr mlt_parser_s ## ```
                                                        ##   < pointer to Properties object
                                                        ## ```
  mlt_deque* {.importc, impmltHdr.} = ptr mlt_deque_s ## ```
                                                      ##   < pointer to Deque object
                                                      ## ```
  mlt_geometry* {.importc, impmltHdr.} = ptr mlt_geometry_s ## ```
                                                            ##   < pointer to Geometry object
                                                            ## ```
  mlt_geometry_item* {.importc, impmltHdr.} = ptr mlt_geometry_item_s ## ```
                                                                      ##   < pointer to Geometry Item object
                                                                      ## ```
  mlt_profile* {.importc, impmltHdr.} = ptr mlt_profile_s ## ```
                                                          ##   < pointer to Profile object
                                                          ## ```
  mlt_repository* {.importc, impmltHdr.} = ptr mlt_repository_s ## ```
                                                                ##   < pointer to Repository object
                                                                ## ```
  mlt_cache* {.importc, impmltHdr.} = ptr mlt_cache_s ## ```
                                                      ##   < pointer to Cache object
                                                      ## ```
  mlt_cache_item* {.importc, impmltHdr.} = ptr mlt_cache_item_s ## ```
                                                                ##   < pointer to CacheItem object
                                                                ## ```
  mlt_animation* {.importc, impmltHdr.} = ptr mlt_animation_s ## ```
                                                              ##   < pointer to Property Animation object
                                                              ## ```
  mlt_slices* {.importc, impmltHdr.} = ptr mlt_slices_s ## ```
                                                        ##   < pointer to Sliced processing context object
                                                        ## ```
  mlt_link* {.importc, impmltHdr.} = ptr mlt_link_s ## ```
                                                    ##   < pointer to Link object
                                                    ## ```
  mlt_chain* {.importc, impmltHdr.} = ptr mlt_chain_s ## ```
                                                      ##   < pointer to Chain object
                                                      ## ```
  mlt_destructor* {.importc, impmltHdr.} = proc (a1: pointer) {.cdecl.}
  mlt_serialiser* {.importc, impmltHdr.} = proc (a1: pointer; length: cint): cstring {.
      cdecl.}
  mlt_thread_function_t* {.importc, impmltHdr.} = proc (a1: pointer): pointer {.
      cdecl.}
  mlt_animation_item_s* {.bycopy, impmltHdr,
                          importc: "struct mlt_animation_item_s".} = object
    is_key*: cint ## ```
                  ##   < a boolean of whether this is a key frame or an interpolated item
                  ## ```
    frame*: cint ## ```
                 ##   < the frame number for this instance of the property
                 ## ```
    property*: mlt_property  ## ```
                             ##   < the property for this point in time
                             ## ```
    keyframe_type*: mlt_keyframe_type ## ```
                                      ##   < the method of interpolation for this key frame
                                      ## ```
  
  mlt_animation_item* {.importc, impmltHdr.} = ptr mlt_animation_item_s ## ```
                                                                        ##   < pointer to an animation item
                                                                        ## ```
  mlt_audio_s* {.bycopy, impmltHdr, importc: "struct mlt_audio_s".} = object
    data*: pointer
    frequency*: cint
    format*: mlt_audio_format
    samples*: cint
    channels*: cint
    layout*: mlt_channel_layout
    release_data*: mlt_destructor
    close*: mlt_destructor

  mlt_profile_s* {.bycopy, impmltHdr, importc: "struct mlt_profile_s".} = object
    description*: cstring ## ```
                          ##   < a brief description suitable as a label in UI menu
                          ## ```
    frame_rate_num*: cint    ## ```
                             ##   < the numerator of the video frame rate
                             ## ```
    frame_rate_den*: cint    ## ```
                             ##   < the denominator of the video frame rate
                             ## ```
    width*: cint             ## ```
                             ##   < the horizontal resolution of the video
                             ## ```
    height*: cint            ## ```
                             ##   < the vertical resolution of the video
                             ## ```
    progressive*: cint ## ```
                       ##   < a flag to indicate if the video is progressive scan, interlace if not set
                       ## ```
    sample_aspect_num*: cint ## ```
                             ##   < the numerator of the pixel aspect ratio
                             ## ```
    sample_aspect_den*: cint ## ```
                             ##   < the denominator of the pixel aspect ratio
                             ## ```
    display_aspect_num*: cint ## ```
                              ##   < the numerator of the image aspect ratio in case it can not be simply derived (e.g. ITU-R 601)
                              ## ```
    display_aspect_den*: cint ## ```
                              ##   < the denominator of the image aspect ratio in case it can not be simply derived (e.g. ITU-R 601)
                              ## ```
    colorspace*: cint ## ```
                      ##   < the Y'CbCr colorspace standard: =601 for ITU-R 601, =709 for ITU-R 709, or =240 for SMPTE240M
                      ## ```
    is_explicit*: cint ## ```
                       ##   < used internally to indicate if the profile was requested explicitly or computed or defaulted
                       ## ```
  
  mlt_repository_callback* {.importc, impmltHdr.} = proc (a1: mlt_repository) {.
      cdecl.}
  mlt_register_callback* {.importc, impmltHdr.} = proc (a1: mlt_profile;
      a2: mlt_service_type; a3: cstring; a5: pointer): pointer {.cdecl.}
  mlt_metadata_callback* {.importc, impmltHdr.} = proc (a1: mlt_service_type;
      a2: cstring; a4: pointer): mlt_properties {.cdecl.}
  mlt_factory_event_data* {.bycopy, importc, impmltHdr.} = object
    name*: cstring           ## ```
                             ##   < the name of the service requested
                             ## ```
    input*: pointer ## ```
                    ##   < an argument supplied to initialize the service, typically a string
                    ## ```
    service*: pointer        ## ```
                             ##   < the service being created
                             ## ```
  
  mlt_image_s* {.bycopy, impmltHdr, importc: "struct mlt_image_s".} = object
    format*: mlt_image_format
    width*: cint
    height*: cint
    colorspace*: cint
    planes*: array[4, ptr uint8]
    strides*: array[4, cint]
    data*: pointer
    release_data*: mlt_destructor
    alpha*: pointer
    release_alpha*: mlt_destructor
    close*: mlt_destructor

  Union_mlth1* {.union, bycopy, impmltHdr, importc: "union Union_mlth1".} = object
    i*: cint
    p*: pointer

  mlt_event_data* {.bycopy, importc, impmltHdr.} = object ## ```
                                                           ##   \file mlt_types.h
                                                           ##    \brief Provides forward definitions of all public types
                                                           ##   
                                                           ##    Copyright (C) 2003-2019 Meltytech, LLC
                                                           ##   
                                                           ##    This library is free software; you can redistribute it and/or
                                                           ##    modify it under the terms of the GNU Lesser General Public
                                                           ##    License as published by the Free Software Foundation; either
                                                           ##    version 2.1 of the License, or (at your option) any later version.
                                                           ##   
                                                           ##    This library is distributed in the hope that it will be useful,
                                                           ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                           ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                           ##    Lesser General Public License for more details.
                                                           ##   
                                                           ##    You should have received a copy of the GNU Lesser General Public
                                                           ##    License along with this library; if not, write to the Free Software
                                                           ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                           ##    
                                                           ##      A container for data that may be supplied with an event
                                                           ## ```
    u*: Union_mlth1

  mlt_event_data_thread* {.bycopy, importc, impmltHdr.} = object ## ```
                                                                  ##   An event data structure to convey thread parameters
                                                                  ## ```
    thread*: ptr pointer ## ```
                         ##   < a pointer to a thread object or handle as determined by you
                         ## ```
    priority*: ptr cint      ## ```
                             ##   < a priority level for the thread
                             ## ```
    function*: mlt_thread_function_t ## ```
                                     ##   < a pointer to the function that thread will run
                                     ## ```
    data*: pointer           ## ```
                             ##   < an opaque data pointer to pass along
                             ## ```
  
  mlt_listener* {.importc, impmltHdr.} = proc (a1: mlt_properties; a2: pointer;
      a3: mlt_event_data) {.cdecl.}
  mlt_properties_s* {.bycopy, impmltHdr, importc: "struct mlt_properties_s".} = object
    child*: pointer          ## ```
                             ##   < \private the object of a subclass
                             ## ```
    local*: pointer          ## ```
                             ##   < \private instance object 
                             ##      the destructor virtual function
                             ## ```
    close*: mlt_destructor   ## ```
                             ##   < \private instance object 
                             ##      the destructor virtual function
                             ## ```
    close_object*: pointer ## ```
                           ##   < the object supplied to the close virtual function
                           ## ```
  
  mlt_deque_compare* {.importc, impmltHdr.} = proc (a: pointer; b: pointer): cint {.
      cdecl.}
  mlt_service_s* {.bycopy, impmltHdr, importc: "struct mlt_service_s".} = object
    parent*: mlt_properties_s ## ```
                              ##   < \private A service extends properties. 
                              ##      Get a frame of data (virtual function).
                              ##   	
                              ##   	 \param mlt_producer a producer
                              ##   	 \param mlt_frame_ptr a frame pointer by reference
                              ##   	 \param int an index
                              ##   	 \return true if there was an error
                              ## ```
    get_frame*: proc (self: mlt_service; frame: mlt_frame_ptr; index: cint): cint {.
        cdecl.} ## ```
                ##   < \private A service extends properties. 
                ##      Get a frame of data (virtual function).
                ##   	
                ##   	 \param mlt_producer a producer
                ##   	 \param mlt_frame_ptr a frame pointer by reference
                ##   	 \param int an index
                ##   	 \return true if there was an error
                ## ```
    close*: mlt_destructor   ## ```
                             ##   the destructor virtual function
                             ## ```
    close_object*: pointer ## ```
                           ##   < the object supplied to the close virtual function
                           ## ```
    local*: pointer          ## ```
                             ##   < \private instance object
                             ## ```
    child*: pointer          ## ```
                             ##   < \private the object of a subclass
                             ## ```
  
  mlt_get_image* {.importc, impmltHdr.} = proc (self: mlt_frame;
      buffer: ptr ptr uint8; format: ptr mlt_image_format; width: ptr cint;
      height: ptr cint; writable: cint): cint {.cdecl.}
  mlt_get_audio* {.importc, impmltHdr.} = proc (self: mlt_frame;
      buffer: ptr pointer; format: ptr mlt_audio_format; frequency: ptr cint;
      channels: ptr cint; samples: ptr cint): cint {.cdecl.}
  mlt_frame_s* {.bycopy, impmltHdr, importc: "struct mlt_frame_s".} = object
    parent*: mlt_properties_s ## ```
                              ##   < \private A frame extends properties. 
                              ##      Convert the image format (callback function).
                              ##   	 \param self a frame
                              ##   	 \param[in,out] image a buffer of image data
                              ##   	 \param[in,out] input the image format of supplied image data
                              ##   	 \param output the image format to which to convert
                              ##   	 \return true if error
                              ## ```
    convert_image*: proc (self: mlt_frame; image: ptr ptr uint8;
                          input: ptr mlt_image_format; output: mlt_image_format): cint {.
        cdecl.} ## ```
                ##   < \private A frame extends properties. 
                ##      Convert the image format (callback function).
                ##   	 \param self a frame
                ##   	 \param[in,out] image a buffer of image data
                ##   	 \param[in,out] input the image format of supplied image data
                ##   	 \param output the image format to which to convert
                ##   	 \return true if error
                ## ```
    convert_audio*: proc (self: mlt_frame; audio: ptr pointer;
                          input: ptr mlt_audio_format; output: mlt_audio_format): cint {.
        cdecl.} ## ```
                ##   Convert the audio format (callback function).
                ##   	 \param self a frame
                ##   	 \param[in,out] audio a buffer of audio data
                ##   	 \param[in,out] input the audio format of supplied data
                ##   	 \param output the audio format to which to convert
                ##   	 \return true if error
                ## ```
    stack_image*: mlt_deque ## ```
                            ##   < \private the image processing stack of operations and data
                            ## ```
    stack_audio*: mlt_deque ## ```
                            ##   < \private the audio processing stack of operations and data
                            ## ```
    stack_service*: mlt_deque ## ```
                              ##   < \private a general purpose data stack
                              ## ```
    is_processing*: cint ## ```
                         ##   < \private indicates if a frame is or was processed by the parallel consumer
                         ## ```
  
  mlt_filter_s* {.bycopy, impmltHdr, importc: "struct mlt_filter_s".} = object
    parent*: mlt_service_s   ## ```
                             ##   We're implementing service here
                             ## ```
    close*: proc (a1: mlt_filter) {.cdecl.} ## ```
                                            ##   public virtual
                                            ## ```
    process*: proc (a1: mlt_filter; a2: mlt_frame): mlt_frame {.cdecl.} ## ```
                                                                        ##   protected filter method
                                                                        ## ```
    child*: pointer          ## ```
                             ##   Protected
                             ## ```
  
  mlt_producer_s* {.bycopy, impmltHdr, importc: "struct mlt_producer_s".} = object
    parent*: mlt_service_s   ## ```
                             ##   A producer is a service.
                             ## ```
    get_frame*: proc (a1: mlt_producer; a2: mlt_frame_ptr; a3: cint): cint {.
        cdecl.} ## ```
                ##   Get a frame of data (virtual function).
                ##   	
                ##   	 \param mlt_producer a producer
                ##   	 \param mlt_frame_ptr a frame pointer by reference
                ##   	 \param int an index
                ##   	 \return true if there was an error
                ## ```
    seek*: proc (a1: mlt_producer; a2: mlt_position): cint {.cdecl.} ## ```
                                                                     ##   Seek to a specified position (virtual function).
                                                                     ##   	
                                                                     ##   	 \param mlt_producer a producer
                                                                     ##   	 \param position set the "play head" position of the producer
                                                                     ##   	 \return false
                                                                     ## ```
    set_in_and_out*: proc (a1: mlt_producer; a2: mlt_position; a3: mlt_position): cint {.
        cdecl.} ## ```
                ##   Set the in and out points.
                ##   	
                ##   	 \param mlt_producer a producer
                ##   	 \param mlt_position the relative starting time; a negative value is the same as 0
                ##   	 \param mlt_position the relative ending time; a negative value is the same as length - 1
                ##   	 \return false
                ## ```
    close*: mlt_destructor   ## ```
                             ##   the destructor virtual function
                             ## ```
    close_object*: pointer ## ```
                           ##   < the object supplied to the close virtual function
                           ## ```
    local*: pointer          ## ```
                             ##   < \private instance object
                             ## ```
    child*: pointer          ## ```
                             ##   < \private the object of a subclass
                             ## ```
  
  mlt_track_s* {.bycopy, impmltHdr, importc: "struct mlt_track_s".} = object
    producer*: mlt_producer
    event*: mlt_event

  mlt_track* {.importc, impmltHdr.} = ptr mlt_track_s
  mlt_multitrack_s* {.bycopy, impmltHdr, importc: "struct mlt_multitrack_s".} = object
    parent*: mlt_producer_s  ## ```
                             ##   We're extending producer here
                             ## ```
    list*: ptr mlt_track
    size*: cint
    count*: cint

  mlt_transition_s* {.bycopy, impmltHdr, importc: "struct mlt_transition_s".} = object
    parent*: mlt_service_s   ## ```
                             ##   We're implementing service here
                             ## ```
    close*: proc (a1: mlt_transition) {.cdecl.} ## ```
                                                ##   public virtual
                                                ## ```
    process*: proc (a1: mlt_transition; a2: mlt_frame; a3: mlt_frame): mlt_frame {.
        cdecl.}              ## ```
                             ##   protected transition method
                             ## ```
    child*: pointer          ## ```
                             ##   Protected
                             ## ```
    producer*: mlt_service   ## ```
                             ##   track and in/out points
                             ## ```
    frames*: ptr mlt_frame   ## ```
                             ##   Private
                             ## ```
    held*: cint

  mlt_consumer_s* {.bycopy, impmltHdr, importc: "struct mlt_consumer_s".} = object
    parent*: mlt_service_s   ## ```
                             ##   A consumer is a service.
                             ## ```
    start*: proc (a1: mlt_consumer): cint {.cdecl.} ## ```
                                                    ##   Start the consumer to pull frames (virtual function).
                                                    ##   	
                                                    ##   	 \param mlt_consumer a consumer
                                                    ##   	 \return true if there was an error
                                                    ## ```
    stop*: proc (a1: mlt_consumer): cint {.cdecl.} ## ```
                                                   ##   Stop the consumer (virtual function).
                                                   ##   	
                                                   ##   	 \param mlt_consumer a consumer
                                                   ##   	 \return true if there was an error
                                                   ## ```
    is_stopped*: proc (a1: mlt_consumer): cint {.cdecl.} ## ```
                                                         ##   Get whether the consumer is running or stopped (virtual function).
                                                         ##   	
                                                         ##   	 \param mlt_consumer a consumer
                                                         ##   	 \return true if the consumer is stopped
                                                         ## ```
    purge*: proc (a1: mlt_consumer) {.cdecl.} ## ```
                                              ##   Purge the consumer of buffered data (virtual function).
                                              ##   	
                                              ##   	 \param mlt_consumer a consumer
                                              ## ```
    close*: proc (a1: mlt_consumer) {.cdecl.} ## ```
                                              ##   The destructor virtual function
                                              ##   	
                                              ##   	 \param mlt_consumer a consumer
                                              ## ```
    local*: pointer          ## ```
                             ##   < \private instance object
                             ## ```
    child*: pointer          ## ```
                             ##   < \private the object of a subclass
                             ## ```
  
  mlt_playlist_clip_info* {.bycopy, importc, impmltHdr.} = object
    clip*: cint              ## ```
                             ##   < the index of the clip within the playlist
                             ## ```
    producer*: mlt_producer ## ```
                            ##   < the clip's producer (or parent producer of a cut)
                            ## ```
    cut*: mlt_producer       ## ```
                             ##   < the clips' cut producer
                             ## ```
    start*: mlt_position ## ```
                         ##   < the time this begins relative to the beginning of the playlist
                         ## ```
    resource*: cstring       ## ```
                             ##   < the file name or address of the clip
                             ## ```
    frame_in*: mlt_position  ## ```
                             ##   < the clip's in point
                             ## ```
    frame_out*: mlt_position ## ```
                             ##   < the clip's out point
                             ## ```
    frame_count*: mlt_position ## ```
                               ##   < the duration of the clip
                               ## ```
    length*: mlt_position    ## ```
                             ##   < the unedited duration of the clip
                             ## ```
    fps*: cfloat             ## ```
                             ##   < the frame rate of the clip
                             ## ```
    repeat*: cint            ## ```
                             ##   < the number of times the clip is repeated
                             ## ```
  
  playlist_entry* {.importc, impmltHdr.} = playlist_entry_s
  mlt_playlist_s* {.bycopy, impmltHdr, importc: "struct mlt_playlist_s".} = object
    parent*: mlt_producer_s
    blank*: mlt_producer_s
    size*: cint
    count*: cint
    list*: ptr ptr playlist_entry

  mlt_tractor_s* {.bycopy, impmltHdr, importc: "struct mlt_tractor_s".} = object
    parent*: mlt_producer_s
    producer*: mlt_service

  mlt_tokeniser_t* {.bycopy, importc, impmltHdr.} = object
    input*: cstring
    tokens*: ptr cstring
    count*: cint
    size*: cint

  mlt_parser_s* {.bycopy, impmltHdr, importc: "struct mlt_parser_s".} = object
    parent*: mlt_properties_s
    on_invalid*: proc (self: mlt_parser; `object`: mlt_service): cint {.cdecl.}
    on_unknown*: proc (self: mlt_parser; `object`: mlt_service): cint {.cdecl.}
    on_start_producer*: proc (self: mlt_parser; `object`: mlt_producer): cint {.
        cdecl.}
    on_end_producer*: proc (self: mlt_parser; `object`: mlt_producer): cint {.
        cdecl.}
    on_start_playlist*: proc (self: mlt_parser; `object`: mlt_playlist): cint {.
        cdecl.}
    on_end_playlist*: proc (self: mlt_parser; `object`: mlt_playlist): cint {.
        cdecl.}
    on_start_tractor*: proc (self: mlt_parser; `object`: mlt_tractor): cint {.
        cdecl.}
    on_end_tractor*: proc (self: mlt_parser; `object`: mlt_tractor): cint {.
        cdecl.}
    on_start_multitrack*: proc (self: mlt_parser; `object`: mlt_multitrack): cint {.
        cdecl.}
    on_end_multitrack*: proc (self: mlt_parser; `object`: mlt_multitrack): cint {.
        cdecl.}
    on_start_track*: proc (self: mlt_parser): cint {.cdecl.}
    on_end_track*: proc (self: mlt_parser): cint {.cdecl.}
    on_start_filter*: proc (self: mlt_parser; `object`: mlt_filter): cint {.
        cdecl.}
    on_end_filter*: proc (self: mlt_parser; `object`: mlt_filter): cint {.cdecl.}
    on_start_transition*: proc (self: mlt_parser; `object`: mlt_transition): cint {.
        cdecl.}
    on_end_transition*: proc (self: mlt_parser; `object`: mlt_transition): cint {.
        cdecl.}
    on_start_chain*: proc (self: mlt_parser; `object`: mlt_chain): cint {.cdecl.}
    on_end_chain*: proc (self: mlt_parser; `object`: mlt_chain): cint {.cdecl.}
    on_start_link*: proc (self: mlt_parser; `object`: mlt_link): cint {.cdecl.}
    on_end_link*: proc (self: mlt_parser; `object`: mlt_link): cint {.cdecl.}

  mlt_slices_s* {.incompleteStruct, impmltHdr, importc: "struct mlt_slices_s".} = object
  mlt_slices_proc* {.importc, impmltHdr.} = proc (id: cint; idx: cint;
      jobs: cint; cookie: pointer): cint {.cdecl.}
  mlt_link_s* {.bycopy, impmltHdr, importc: "struct mlt_link_s".} = object
    parent*: mlt_producer_s  ## ```
                             ##   \publicsection
                             ## ```
    get_frame*: proc (a1: mlt_link; a2: mlt_frame_ptr; a3: cint): cint {.cdecl.} ## ```
                                                                                 ##   \protectedsection 
                                                                                 ##      Get a frame of data (virtual function).
                                                                                 ##   	
                                                                                 ##   	 \param mlt_link a link
                                                                                 ##   	 \param mlt_frame_ptr a frame pointer by reference
                                                                                 ##   	 \param int an index
                                                                                 ##   	 \return true if there was an error
                                                                                 ## ```
    configure*: proc (a1: mlt_link; a2: mlt_profile) {.cdecl.} ## ```
                                                               ##   Configure the link (virtual function).
                                                               ##   	
                                                               ##   	 \param mlt_link a link
                                                               ##   	 \param mlt_profile a default profile to use
                                                               ## ```
    close*: proc (a1: mlt_link) {.cdecl.} ## ```
                                          ##   Virtual close function
                                          ## ```
    next*: mlt_producer      ## ```
                             ##   \privatesection
                             ## ```
    child*: pointer          ## ```
                             ##   the object of a subclass
                             ## ```
  
  mlt_chain_s* {.bycopy, impmltHdr, importc: "struct mlt_chain_s".} = object
    parent*: mlt_producer_s
    local*: pointer          ## ```
                             ##   < \private instance object
                             ## ```
  
proc mlt_pool_init*() {.importc, cdecl, impmltDyn.}
proc mlt_pool_alloc*(size: cint): pointer {.importc, cdecl, impmltDyn.}
proc mlt_pool_realloc*(`ptr`: pointer; size: cint): pointer {.importc, cdecl,
    impmltDyn.}
proc mlt_pool_release*(release: pointer) {.importc, cdecl, impmltDyn.}
proc mlt_pool_purge*() {.importc, cdecl, impmltDyn.}
proc mlt_pool_close*() {.importc, cdecl, impmltDyn.}
proc mlt_pool_stat*() {.importc, cdecl, impmltDyn.}
proc mlt_property_init*(): mlt_property {.importc, cdecl, impmltDyn.}
proc mlt_property_clear*(self: mlt_property) {.importc, cdecl, impmltDyn.}
proc mlt_property_is_clear*(self: mlt_property): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_property_set_int*(self: mlt_property; value: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_property_set_double*(self: mlt_property; value: cdouble): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_set_position*(self: mlt_property; value: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_set_int64*(self: mlt_property; value: int64): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_property_set_string*(self: mlt_property; value: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_set_data*(self: mlt_property; value: pointer; length: cint;
                            destructor: mlt_destructor;
                            serialiser: mlt_serialiser): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_property_get_int*(self: mlt_property; fps: cdouble; a3: locale_t): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_get_double*(self: mlt_property; fps: cdouble; a3: locale_t): cdouble {.
    importc, cdecl, impmltDyn.}
proc mlt_property_get_position*(self: mlt_property; fps: cdouble; a3: locale_t): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_property_get_int64*(self: mlt_property): int64 {.importc, cdecl,
    impmltDyn.}
proc mlt_property_get_string_tf*(self: mlt_property; a2: mlt_time_format): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_property_get_string*(self: mlt_property): cstring {.importc, cdecl,
    impmltDyn.}
proc mlt_property_get_string_l_tf*(self: mlt_property; a2: locale_t;
                                   a3: mlt_time_format): cstring {.importc,
    cdecl, impmltDyn.}
proc mlt_property_get_string_l*(self: mlt_property; a2: locale_t): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_property_get_data*(self: mlt_property; length: ptr cint): pointer {.
    importc, cdecl, impmltDyn.}
proc mlt_property_close*(self: mlt_property) {.importc, cdecl, impmltDyn.}
proc mlt_property_pass*(self: mlt_property; that: mlt_property) {.importc,
    cdecl, impmltDyn.}
proc mlt_property_get_time*(self: mlt_property; a2: mlt_time_format;
                            fps: cdouble; a4: locale_t): cstring {.importc,
    cdecl, impmltDyn.}
proc mlt_property_interpolate*(self: mlt_property;
                               points: UncheckedArray[mlt_property];
                               progress: cdouble; fps: cdouble;
                               locale: locale_t; interp: mlt_keyframe_type): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_anim_get_double*(self: mlt_property; fps: cdouble;
                                   locale: locale_t; position: cint;
                                   length: cint): cdouble {.importc, cdecl,
    impmltDyn.}
proc mlt_property_anim_get_int*(self: mlt_property; fps: cdouble;
                                locale: locale_t; position: cint; length: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_anim_get_string*(self: mlt_property; fps: cdouble;
                                   locale: locale_t; position: cint;
                                   length: cint): cstring {.importc, cdecl,
    impmltDyn.}
proc mlt_property_anim_set_double*(self: mlt_property; value: cdouble;
                                   fps: cdouble; locale: locale_t;
                                   position: cint; length: cint;
                                   keyframe_type: mlt_keyframe_type): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_anim_set_int*(self: mlt_property; value: cint; fps: cdouble;
                                locale: locale_t; position: cint; length: cint;
                                keyframe_type: mlt_keyframe_type): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_anim_set_string*(self: mlt_property; value: cstring;
                                   fps: cdouble; locale: locale_t;
                                   position: cint; length: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_get_animation*(self: mlt_property): mlt_animation {.importc,
    cdecl, impmltDyn.}
proc mlt_property_set_rect*(self: mlt_property; value: mlt_rect): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_get_rect*(self: mlt_property; locale: locale_t): mlt_rect {.
    importc, cdecl, impmltDyn.}
proc mlt_property_anim_set_rect*(self: mlt_property; value: mlt_rect;
                                 fps: cdouble; locale: locale_t; position: cint;
                                 length: cint; keyframe_type: mlt_keyframe_type): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_property_anim_get_rect*(self: mlt_property; fps: cdouble;
                                 locale: locale_t; position: cint; length: cint): mlt_rect {.
    importc, cdecl, impmltDyn.}
proc mlt_animation_new*(): mlt_animation {.importc, cdecl, impmltDyn.}
proc mlt_animation_parse*(self: mlt_animation; data: cstring; length: cint;
                          fps: cdouble; locale: locale_t): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_animation_refresh*(self: mlt_animation; data: cstring; length: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_animation_get_length*(self: mlt_animation): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_animation_set_length*(self: mlt_animation; length: cint) {.importc,
    cdecl, impmltDyn.}
proc mlt_animation_parse_item*(self: mlt_animation; item: mlt_animation_item;
                               data: cstring): cint {.importc, cdecl, impmltDyn.}
proc mlt_animation_get_item*(self: mlt_animation; item: mlt_animation_item;
                             position: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_animation_insert*(self: mlt_animation; item: mlt_animation_item): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_animation_remove*(self: mlt_animation; position: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_animation_interpolate*(self: mlt_animation) {.importc, cdecl, impmltDyn.}
proc mlt_animation_next_key*(self: mlt_animation; item: mlt_animation_item;
                             position: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_animation_prev_key*(self: mlt_animation; item: mlt_animation_item;
                             position: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_animation_serialize_cut_tf*(self: mlt_animation; `in`: cint;
                                     `out`: cint; a4: mlt_time_format): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_animation_serialize_cut*(self: mlt_animation; `in`: cint; `out`: cint): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_animation_serialize_tf*(self: mlt_animation; a2: mlt_time_format): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_animation_serialize*(self: mlt_animation): cstring {.importc, cdecl,
    impmltDyn.}
proc mlt_animation_key_count*(self: mlt_animation): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_animation_key_get*(self: mlt_animation; item: mlt_animation_item;
                            index: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_animation_close*(self: mlt_animation) {.importc, cdecl, impmltDyn.}
proc mlt_animation_key_set_type*(self: mlt_animation; index: cint;
                                 `type`: mlt_keyframe_type): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_animation_key_set_frame*(self: mlt_animation; index: cint; frame: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_animation_shift_frames*(self: mlt_animation; shift: cint) {.importc,
    cdecl, impmltDyn.}
proc mlt_animation_get_string*(self: mlt_animation): cstring {.importc, cdecl,
    impmltDyn.}
  ## ```
               ##   \file mlt_audio.h
               ##    \brief Audio class
               ##    \see mlt_audio_s
               ##   
               ##    Copyright (C) 2020 Meltytech, LLC
               ##   
               ##    This library is free software; you can redistribute it and/or
               ##    modify it under the terms of the GNU Lesser General Public
               ##    License as published by the Free Software Foundation; either
               ##    version 2.1 of the License, or (at your option) any later version.
               ##   
               ##    This library is distributed in the hope that it will be useful,
               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
               ##    Lesser General Public License for more details.
               ##   
               ##    You should have received a copy of the GNU Lesser General Public
               ##    License along with this library; if not, write to the Free Software
               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
               ## ```
proc mlt_audio_new*(): mlt_audio {.importc, cdecl, impmltDyn.}
proc mlt_audio_close*(self: mlt_audio) {.importc, cdecl, impmltDyn.}
proc mlt_audio_set_values*(self: mlt_audio; data: pointer; frequency: cint;
                           format: mlt_audio_format; samples: cint;
                           channels: cint) {.importc, cdecl, impmltDyn.}
proc mlt_audio_get_values*(self: mlt_audio; data: ptr pointer;
                           frequency: ptr cint; format: ptr mlt_audio_format;
                           samples: ptr cint; channels: ptr cint) {.importc,
    cdecl, impmltDyn.}
proc mlt_audio_alloc_data*(self: mlt_audio) {.importc, cdecl, impmltDyn.}
proc mlt_audio_calculate_size*(self: mlt_audio): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_audio_plane_count*(self: mlt_audio): cint {.importc, cdecl, impmltDyn.}
proc mlt_audio_plane_size*(self: mlt_audio): cint {.importc, cdecl, impmltDyn.}
proc mlt_audio_get_planes*(self: mlt_audio; planes: ptr ptr uint8) {.importc,
    cdecl, impmltDyn.}
proc mlt_audio_silence*(self: mlt_audio; samples: cint; start: cint) {.importc,
    cdecl, impmltDyn.}
proc mlt_audio_shrink*(self: mlt_audio; samples: cint) {.importc, cdecl,
    impmltDyn.}
proc mlt_audio_reverse*(self: mlt_audio) {.importc, cdecl, impmltDyn.}
proc mlt_audio_copy*(dst: mlt_audio; src: mlt_audio; samples: cint;
                     src_start: cint; dst_start: cint) {.importc, cdecl,
    impmltDyn.}
proc mlt_audio_calculate_frame_samples*(fps: cfloat; frequency: cint;
                                        position: int64): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_audio_calculate_samples_to_position*(fps: cfloat; frequency: cint;
    position: int64): int64 {.importc, cdecl, impmltDyn.}
proc mlt_audio_format_name*(format: mlt_audio_format): cstring {.importc, cdecl,
    impmltDyn.}
proc mlt_audio_format_size*(format: mlt_audio_format; samples: cint;
                            channels: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_audio_channel_layout_name*(layout: mlt_channel_layout): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_audio_channel_layout_id*(name: cstring): mlt_channel_layout {.importc,
    cdecl, impmltDyn.}
proc mlt_audio_channel_layout_channels*(layout: mlt_channel_layout): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_audio_channel_layout_default*(channels: cint): mlt_channel_layout {.
    importc, cdecl, impmltDyn.}
  ## ```
                               ##   \file mlt_factory.h
                               ##    \brief the factory method interfaces
                               ##   
                               ##    Copyright (C) 2003-2021 Meltytech, LLC
                               ##   
                               ##    This library is free software; you can redistribute it and/or
                               ##    modify it under the terms of the GNU Lesser General Public
                               ##    License as published by the Free Software Foundation; either
                               ##    version 2.1 of the License, or (at your option) any later version.
                               ##   
                               ##    This library is distributed in the hope that it will be useful,
                               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                               ##    Lesser General Public License for more details.
                               ##   
                               ##    You should have received a copy of the GNU Lesser General Public
                               ##    License along with this library; if not, write to the Free Software
                               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                               ## ```
proc mlt_profile_init*(name: cstring): mlt_profile {.importc, cdecl, impmltDyn.}
proc mlt_profile_load_file*(file: cstring): mlt_profile {.importc, cdecl,
    impmltDyn.}
proc mlt_profile_load_properties*(properties: mlt_properties): mlt_profile {.
    importc, cdecl, impmltDyn.}
proc mlt_profile_load_string*(string: cstring): mlt_profile {.importc, cdecl,
    impmltDyn.}
proc mlt_profile_fps*(profile: mlt_profile): cdouble {.importc, cdecl, impmltDyn.}
proc mlt_profile_sar*(profile: mlt_profile): cdouble {.importc, cdecl, impmltDyn.}
proc mlt_profile_dar*(profile: mlt_profile): cdouble {.importc, cdecl, impmltDyn.}
proc mlt_profile_close*(profile: mlt_profile) {.importc, cdecl, impmltDyn.}
proc mlt_profile_clone*(profile: mlt_profile): mlt_profile {.importc, cdecl,
    impmltDyn.}
proc mlt_profile_list*(): mlt_properties {.importc, cdecl, impmltDyn.}
proc mlt_profile_from_producer*(profile: mlt_profile; producer: mlt_producer) {.
    importc, cdecl, impmltDyn.}
proc mlt_profile_lumas_dir*(profile: mlt_profile): cstring {.importc, cdecl,
    impmltDyn.}
proc mlt_profile_scale_width*(profile: mlt_profile; width: cint): cdouble {.
    importc, cdecl, impmltDyn.}
proc mlt_profile_scale_height*(profile: mlt_profile; height: cint): cdouble {.
    importc, cdecl, impmltDyn.}
  ## ```
                               ##   \file mlt_repository.h
                               ##    \brief provides a map between service and shared objects
                               ##    \see mlt_repository_s
                               ##   
                               ##    Copyright (C) 2003-2014 Meltytech, LLC
                               ##   
                               ##    This library is free software; you can redistribute it and/or
                               ##    modify it under the terms of the GNU Lesser General Public
                               ##    License as published by the Free Software Foundation; either
                               ##    version 2.1 of the License, or (at your option) any later version.
                               ##   
                               ##    This library is distributed in the hope that it will be useful,
                               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                               ##    Lesser General Public License for more details.
                               ##   
                               ##    You should have received a copy of the GNU Lesser General Public
                               ##    License along with this library; if not, write to the Free Software
                               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                               ## ```
proc mlt_repository_init*(directory: cstring): mlt_repository {.importc, cdecl,
    impmltDyn.}
proc mlt_repository_register*(self: mlt_repository;
                              service_type: mlt_service_type; service: cstring;
                              a4: mlt_register_callback) {.importc, cdecl,
    impmltDyn.}
proc mlt_repository_create*(self: mlt_repository; profile: mlt_profile;
                            `type`: mlt_service_type; service: cstring;
                            arg: pointer): pointer {.importc, cdecl, impmltDyn.}
proc mlt_repository_close*(self: mlt_repository) {.importc, cdecl, impmltDyn.}
proc mlt_repository_consumers*(self: mlt_repository): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_repository_filters*(self: mlt_repository): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_repository_links*(self: mlt_repository): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_repository_producers*(self: mlt_repository): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_repository_transitions*(self: mlt_repository): mlt_properties {.
    importc, cdecl, impmltDyn.}
proc mlt_repository_register_metadata*(self: mlt_repository;
                                       `type`: mlt_service_type;
                                       service: cstring;
                                       a4: mlt_metadata_callback;
                                       callback_data: pointer) {.importc, cdecl,
    impmltDyn.}
proc mlt_repository_metadata*(self: mlt_repository; `type`: mlt_service_type;
                              service: cstring): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_repository_languages*(self: mlt_repository): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_repository_presets*(): mlt_properties {.importc, cdecl, impmltDyn.}
proc mlt_factory_init*(directory: cstring): mlt_repository {.importc, cdecl,
    impmltDyn.}
proc mlt_factory_repository*(): mlt_repository {.importc, cdecl, impmltDyn.}
proc mlt_factory_directory*(): cstring {.importc, cdecl, impmltDyn.}
proc mlt_environment*(name: cstring): cstring {.importc, cdecl, impmltDyn.}
proc mlt_environment_set*(name: cstring; value: cstring): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_factory_event_object*(): mlt_properties {.importc, cdecl, impmltDyn.}
proc mlt_factory_producer*(profile: mlt_profile; service: cstring;
                           resource: pointer): mlt_producer {.importc, cdecl,
    impmltDyn.}
proc mlt_factory_filter*(profile: mlt_profile; name: cstring; input: pointer): mlt_filter {.
    importc, cdecl, impmltDyn.}
proc mlt_factory_link*(name: cstring; input: pointer): mlt_link {.importc,
    cdecl, impmltDyn.}
proc mlt_factory_transition*(profile: mlt_profile; name: cstring; input: pointer): mlt_transition {.
    importc, cdecl, impmltDyn.}
proc mlt_factory_consumer*(profile: mlt_profile; name: cstring; input: pointer): mlt_consumer {.
    importc, cdecl, impmltDyn.}
proc mlt_factory_register_for_clean_up*(`ptr`: pointer;
                                        destructor: mlt_destructor) {.importc,
    cdecl, impmltDyn.}
proc mlt_factory_close*() {.importc, cdecl, impmltDyn.}
proc mlt_global_properties*(): mlt_properties {.importc, cdecl, impmltDyn.}
proc mlt_image_new*(): mlt_image {.importc, cdecl, impmltDyn.}
proc mlt_image_close*(self: mlt_image) {.importc, cdecl, impmltDyn.}
proc mlt_image_set_values*(self: mlt_image; data: pointer;
                           format: mlt_image_format; width: cint; height: cint) {.
    importc, cdecl, impmltDyn.}
proc mlt_image_get_values*(self: mlt_image; data: ptr pointer;
                           format: ptr mlt_image_format; width: ptr cint;
                           height: ptr cint) {.importc, cdecl, impmltDyn.}
proc mlt_image_alloc_data*(self: mlt_image) {.importc, cdecl, impmltDyn.}
proc mlt_image_alloc_alpha*(self: mlt_image) {.importc, cdecl, impmltDyn.}
proc mlt_image_calculate_size*(self: mlt_image): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_image_fill_black*(self: mlt_image) {.importc, cdecl, impmltDyn.}
proc mlt_image_fill_opaque*(self: mlt_image) {.importc, cdecl, impmltDyn.}
proc mlt_image_format_name*(format: mlt_image_format): cstring {.importc, cdecl,
    impmltDyn.}
proc mlt_image_format_id*(name: cstring): mlt_image_format {.importc, cdecl,
    impmltDyn.}
proc mlt_image_format_size*(format: mlt_image_format; width: cint; height: cint;
                            bpp: ptr cint): cint {.importc, cdecl, impmltDyn.}
  ## ```
                                                                              ##   Deprecated functions
                                                                              ## ```
proc mlt_image_format_planes*(format: mlt_image_format; width: cint;
                              height: cint; data: pointer;
                              planes: array[4, ptr uint8];
                              strides: array[4, cint]) {.importc, cdecl,
    impmltDyn.}
  ## ```
               ##   \file mlt_properties.h
               ##    \brief Properties class declaration
               ##    \see mlt_properties_s
               ##   
               ##    Copyright (C) 2003-2020 Meltytech, LLC
               ##   
               ##    This library is free software; you can redistribute it and/or
               ##    modify it under the terms of the GNU Lesser General Public
               ##    License as published by the Free Software Foundation; either
               ##    version 2.1 of the License, or (at your option) any later version.
               ##   
               ##    This library is distributed in the hope that it will be useful,
               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
               ##    Lesser General Public License for more details.
               ##   
               ##    You should have received a copy of the GNU Lesser General Public
               ##    License along with this library; if not, write to the Free Software
               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
               ## ```
proc mlt_events_init*(self: mlt_properties) {.importc, cdecl, impmltDyn.}
proc mlt_events_register*(self: mlt_properties; id: cstring): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_events_fire*(self: mlt_properties; id: cstring; a3: mlt_event_data): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_events_listen*(self: mlt_properties; listener_data: pointer;
                        id: cstring; listener: mlt_listener): mlt_event {.
    importc, cdecl, impmltDyn.}
proc mlt_events_block*(self: mlt_properties; listener_data: pointer) {.importc,
    cdecl, impmltDyn.}
proc mlt_events_unblock*(self: mlt_properties; listener_data: pointer) {.
    importc, cdecl, impmltDyn.}
proc mlt_events_disconnect*(self: mlt_properties; listener_data: pointer) {.
    importc, cdecl, impmltDyn.}
proc mlt_events_setup_wait_for*(self: mlt_properties; id: cstring): mlt_event {.
    importc, cdecl, impmltDyn.}
proc mlt_events_wait_for*(self: mlt_properties; event: mlt_event) {.importc,
    cdecl, impmltDyn.}
proc mlt_events_close_wait_for*(self: mlt_properties; event: mlt_event) {.
    importc, cdecl, impmltDyn.}
proc mlt_event_inc_ref*(self: mlt_event) {.importc, cdecl, impmltDyn.}
proc mlt_event_block*(self: mlt_event) {.importc, cdecl, impmltDyn.}
proc mlt_event_unblock*(self: mlt_event) {.importc, cdecl, impmltDyn.}
proc mlt_event_close*(self: mlt_event) {.importc, cdecl, impmltDyn.}
proc mlt_event_data_none*(): mlt_event_data {.importc, cdecl, impmltDyn.}
proc mlt_event_data_from_int*(value: cint): mlt_event_data {.importc, cdecl,
    impmltDyn.}
proc mlt_event_data_to_int*(a1: mlt_event_data): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_event_data_from_string*(value: cstring): mlt_event_data {.importc,
    cdecl, impmltDyn.}
proc mlt_event_data_to_string*(a1: mlt_event_data): cstring {.importc, cdecl,
    impmltDyn.}
proc mlt_event_data_from_frame*(a1: mlt_frame): mlt_event_data {.importc, cdecl,
    impmltDyn.}
proc mlt_event_data_to_frame*(a1: mlt_event_data): mlt_frame {.importc, cdecl,
    impmltDyn.}
proc mlt_event_data_from_object*(a1: pointer): mlt_event_data {.importc, cdecl,
    impmltDyn.}
proc mlt_event_data_to_object*(a1: mlt_event_data): pointer {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_init*(a1: mlt_properties; child: pointer): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_properties_new*(): mlt_properties {.importc, cdecl, impmltDyn.}
proc mlt_properties_set_lcnumeric*(a1: mlt_properties; locale: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get_lcnumeric*(self: mlt_properties): cstring {.importc,
    cdecl, impmltDyn.}
proc mlt_properties_load*(file: cstring): mlt_properties {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_preset*(self: mlt_properties; name: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_inc_ref*(self: mlt_properties): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_dec_ref*(self: mlt_properties): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_ref_count*(self: mlt_properties): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_mirror*(self: mlt_properties; that: mlt_properties) {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_inherit*(self: mlt_properties; that: mlt_properties): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_pass*(self: mlt_properties; that: mlt_properties;
                          prefix: cstring): cint {.importc, cdecl, impmltDyn.}
proc mlt_properties_pass_property*(self: mlt_properties; that: mlt_properties;
                                   name: cstring) {.importc, cdecl, impmltDyn.}
proc mlt_properties_pass_list*(self: mlt_properties; that: mlt_properties;
                               list: cstring): cint {.importc, cdecl, impmltDyn.}
proc mlt_properties_set*(self: mlt_properties; name: cstring; value: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_set_or_default*(self: mlt_properties; name: cstring;
                                    value: cstring; def: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_set_string*(self: mlt_properties; name: cstring;
                                value: cstring): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_parse*(self: mlt_properties; namevalue: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get*(self: mlt_properties; name: cstring): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get_name*(self: mlt_properties; index: cint): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get_value_tf*(self: mlt_properties; index: cint;
                                  a3: mlt_time_format): cstring {.importc,
    cdecl, impmltDyn.}
proc mlt_properties_get_value*(self: mlt_properties; index: cint): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get_data_at*(self: mlt_properties; index: cint;
                                 size: ptr cint): pointer {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_get_int*(self: mlt_properties; name: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_set_int*(self: mlt_properties; name: cstring; value: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get_int64*(self: mlt_properties; name: cstring): int64 {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_set_int64*(self: mlt_properties; name: cstring; value: int64): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get_double*(self: mlt_properties; name: cstring): cdouble {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_set_double*(self: mlt_properties; name: cstring;
                                value: cdouble): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_get_position*(self: mlt_properties; name: cstring): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_set_position*(self: mlt_properties; name: cstring;
                                  value: mlt_position): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_set_data*(self: mlt_properties; name: cstring;
                              value: pointer; length: cint; a5: mlt_destructor;
                              a6: mlt_serialiser): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_get_data*(self: mlt_properties; name: cstring;
                              length: ptr cint): pointer {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_rename*(self: mlt_properties; source: cstring; dest: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_count*(self: mlt_properties): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_dump*(self: mlt_properties; output: File) {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_debug*(self: mlt_properties; title: cstring; output: File) {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_save*(a1: mlt_properties; a2: cstring): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_properties_dir_list*(a1: mlt_properties; a2: cstring; a3: cstring;
                              a4: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_properties_close*(self: mlt_properties) {.importc, cdecl, impmltDyn.}
proc mlt_properties_is_sequence*(self: mlt_properties): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_parse_yaml*(file: cstring): mlt_properties {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_serialise_yaml*(self: mlt_properties): cstring {.importc,
    cdecl, impmltDyn.}
proc mlt_properties_lock*(self: mlt_properties) {.importc, cdecl, impmltDyn.}
proc mlt_properties_unlock*(self: mlt_properties) {.importc, cdecl, impmltDyn.}
proc mlt_properties_clear*(self: mlt_properties; name: cstring) {.importc,
    cdecl, impmltDyn.}
proc mlt_properties_exists*(self: mlt_properties; name: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get_time*(a1: mlt_properties; name: cstring;
                              a3: mlt_time_format): cstring {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_frames_to_time*(a1: mlt_properties; a2: mlt_position;
                                    a3: mlt_time_format): cstring {.importc,
    cdecl, impmltDyn.}
proc mlt_properties_time_to_frames*(a1: mlt_properties; time: cstring): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get_color*(a1: mlt_properties; name: cstring): mlt_color {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_set_color*(a1: mlt_properties; name: cstring;
                               value: mlt_color): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_anim_get*(self: mlt_properties; name: cstring;
                              position: cint; length: cint): cstring {.importc,
    cdecl, impmltDyn.}
proc mlt_properties_anim_set*(self: mlt_properties; name: cstring;
                              value: cstring; position: cint; length: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_anim_get_int*(self: mlt_properties; name: cstring;
                                  position: cint; length: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_properties_anim_set_int*(self: mlt_properties; name: cstring;
                                  value: cint; position: cint; length: cint;
                                  keyframe_type: mlt_keyframe_type): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_anim_get_double*(self: mlt_properties; name: cstring;
                                     position: cint; length: cint): cdouble {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_anim_set_double*(self: mlt_properties; name: cstring;
                                     value: cdouble; position: cint;
                                     length: cint;
                                     keyframe_type: mlt_keyframe_type): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_get_animation*(self: mlt_properties; name: cstring): mlt_animation {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_set_rect*(self: mlt_properties; name: cstring;
                              value: mlt_rect): cint {.importc, cdecl, impmltDyn.}
proc mlt_properties_get_rect*(self: mlt_properties; name: cstring): mlt_rect {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_anim_set_rect*(self: mlt_properties; name: cstring;
                                   value: mlt_rect; position: cint;
                                   length: cint;
                                   keyframe_type: mlt_keyframe_type): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_anim_get_rect*(self: mlt_properties; name: cstring;
                                   position: cint; length: cint): mlt_rect {.
    importc, cdecl, impmltDyn.}
proc mlt_properties_from_utf8*(properties: mlt_properties; name_from: cstring;
                               name_to: cstring): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_properties_to_utf8*(properties: mlt_properties; name_from: cstring;
                             name_to: cstring): cint {.importc, cdecl, impmltDyn.}
  ## ```
                                                                                  ##   \file mlt_deque.h
                                                                                  ##    \brief double ended queue
                                                                                  ##    \see mlt_deque_s
                                                                                  ##   
                                                                                  ##    Copyright (C) 2003-2014 Meltytech, LLC
                                                                                  ##   
                                                                                  ##    This library is free software; you can redistribute it and/or
                                                                                  ##    modify it under the terms of the GNU Lesser General Public
                                                                                  ##    License as published by the Free Software Foundation; either
                                                                                  ##    version 2.1 of the License, or (at your option) any later version.
                                                                                  ##   
                                                                                  ##    This library is distributed in the hope that it will be useful,
                                                                                  ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                                  ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                                  ##    Lesser General Public License for more details.
                                                                                  ##   
                                                                                  ##    You should have received a copy of the GNU Lesser General Public
                                                                                  ##    License along with this library; if not, write to the Free Software
                                                                                  ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                                  ## ```
proc mlt_deque_init*(): mlt_deque {.importc, cdecl, impmltDyn.}
proc mlt_deque_count*(self: mlt_deque): cint {.importc, cdecl, impmltDyn.}
proc mlt_deque_push_back*(self: mlt_deque; item: pointer): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_deque_pop_back*(self: mlt_deque): pointer {.importc, cdecl, impmltDyn.}
proc mlt_deque_push_front*(self: mlt_deque; item: pointer): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_deque_pop_front*(self: mlt_deque): pointer {.importc, cdecl, impmltDyn.}
proc mlt_deque_peek_back*(self: mlt_deque): pointer {.importc, cdecl, impmltDyn.}
proc mlt_deque_peek_front*(self: mlt_deque): pointer {.importc, cdecl, impmltDyn.}
proc mlt_deque_peek*(self: mlt_deque; index: cint): pointer {.importc, cdecl,
    impmltDyn.}
proc mlt_deque_insert*(self: mlt_deque; item: pointer; a3: mlt_deque_compare): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_deque_push_back_int*(self: mlt_deque; item: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_deque_pop_back_int*(self: mlt_deque): cint {.importc, cdecl, impmltDyn.}
proc mlt_deque_push_front_int*(self: mlt_deque; item: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_deque_pop_front_int*(self: mlt_deque): cint {.importc, cdecl, impmltDyn.}
proc mlt_deque_peek_back_int*(self: mlt_deque): cint {.importc, cdecl, impmltDyn.}
proc mlt_deque_peek_front_int*(self: mlt_deque): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_deque_push_back_double*(self: mlt_deque; item: cdouble): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_deque_pop_back_double*(self: mlt_deque): cdouble {.importc, cdecl,
    impmltDyn.}
proc mlt_deque_push_front_double*(self: mlt_deque; item: cdouble): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_deque_pop_front_double*(self: mlt_deque): cdouble {.importc, cdecl,
    impmltDyn.}
proc mlt_deque_peek_back_double*(self: mlt_deque): cdouble {.importc, cdecl,
    impmltDyn.}
proc mlt_deque_peek_front_double*(self: mlt_deque): cdouble {.importc, cdecl,
    impmltDyn.}
proc mlt_deque_close*(self: mlt_deque) {.importc, cdecl, impmltDyn.}
  ## ```
                                                                    ##   \file mlt_service.h
                                                                    ##    \brief interface declaration for all service classes
                                                                    ##    \see mlt_service_s
                                                                    ##   
                                                                    ##    Copyright (C) 2003-2015 Meltytech, LLC
                                                                    ##   
                                                                    ##    This library is free software; you can redistribute it and/or
                                                                    ##    modify it under the terms of the GNU Lesser General Public
                                                                    ##    License as published by the Free Software Foundation; either
                                                                    ##    version 2.1 of the License, or (at your option) any later version.
                                                                    ##   
                                                                    ##    This library is distributed in the hope that it will be useful,
                                                                    ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                    ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                    ##    Lesser General Public License for more details.
                                                                    ##   
                                                                    ##    You should have received a copy of the GNU Lesser General Public
                                                                    ##    License along with this library; if not, write to the Free Software
                                                                    ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                    ## ```
proc mlt_service_init*(self: mlt_service; child: pointer): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_service_lock*(self: mlt_service) {.importc, cdecl, impmltDyn.}
proc mlt_service_unlock*(self: mlt_service) {.importc, cdecl, impmltDyn.}
proc mlt_service_identify*(self: mlt_service): mlt_service_type {.importc,
    cdecl, impmltDyn.}
proc mlt_service_connect_producer*(self: mlt_service; producer: mlt_service;
                                   index: cint): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_service_insert_producer*(self: mlt_service; producer: mlt_service;
                                  index: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_service_disconnect_producer*(self: mlt_service; index: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_service_disconnect_all_producers*(self: mlt_service): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_service_get_producer*(self: mlt_service): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_service_get_frame*(self: mlt_service; frame: mlt_frame_ptr; index: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_service_properties*(self: mlt_service): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_service_consumer*(self: mlt_service): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_service_producer*(self: mlt_service): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_service_attach*(self: mlt_service; filter: mlt_filter): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_service_detach*(self: mlt_service; filter: mlt_filter): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_service_apply_filters*(self: mlt_service; frame: mlt_frame; index: cint) {.
    importc, cdecl, impmltDyn.}
proc mlt_service_filter_count*(self: mlt_service): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_service_move_filter*(self: mlt_service; `from`: cint; to: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_service_filter*(self: mlt_service; index: cint): mlt_filter {.importc,
    cdecl, impmltDyn.}
proc mlt_service_profile*(self: mlt_service): mlt_profile {.importc, cdecl,
    impmltDyn.}
proc mlt_service_set_profile*(self: mlt_service; profile: mlt_profile) {.
    importc, cdecl, impmltDyn.}
proc mlt_service_close*(self: mlt_service) {.importc, cdecl, impmltDyn.}
proc mlt_service_cache_put*(self: mlt_service; name: cstring; data: pointer;
                            size: cint; destructor: mlt_destructor) {.importc,
    cdecl, impmltDyn.}
proc mlt_service_cache_get*(self: mlt_service; name: cstring): mlt_cache_item {.
    importc, cdecl, impmltDyn.}
proc mlt_service_cache_set_size*(self: mlt_service; name: cstring; size: cint) {.
    importc, cdecl, impmltDyn.}
proc mlt_service_cache_get_size*(self: mlt_service; name: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_service_cache_purge*(self: mlt_service) {.importc, cdecl, impmltDyn.}
proc mlt_frame_init*(service: mlt_service): mlt_frame {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_properties*(self: mlt_frame): mlt_properties {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_is_test_card*(self: mlt_frame): cint {.importc, cdecl, impmltDyn.}
proc mlt_frame_is_test_audio*(self: mlt_frame): cint {.importc, cdecl, impmltDyn.}
proc mlt_frame_get_aspect_ratio*(self: mlt_frame): cdouble {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_set_aspect_ratio*(self: mlt_frame; value: cdouble): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_frame_get_position*(self: mlt_frame): mlt_position {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_original_position*(self: mlt_frame): mlt_position {.importc,
    cdecl, impmltDyn.}
proc mlt_frame_set_position*(self: mlt_frame; value: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_frame_set_image*(self: mlt_frame; image: ptr uint8; size: cint;
                          destroy: mlt_destructor): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_set_alpha*(self: mlt_frame; alpha: ptr uint8; size: cint;
                          destroy: mlt_destructor): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_replace_image*(self: mlt_frame; image: ptr uint8;
                              format: mlt_image_format; width: cint;
                              height: cint) {.importc, cdecl, impmltDyn.}
proc mlt_frame_get_image*(self: mlt_frame; buffer: ptr ptr uint8;
                          format: ptr mlt_image_format; width: ptr cint;
                          height: ptr cint; writable: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_frame_get_alpha*(self: mlt_frame): ptr uint8 {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_get_audio*(self: mlt_frame; buffer: ptr pointer;
                          format: ptr mlt_audio_format; frequency: ptr cint;
                          channels: ptr cint; samples: ptr cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_frame_set_audio*(self: mlt_frame; buffer: pointer;
                          a3: mlt_audio_format; size: cint; a5: mlt_destructor): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_frame_get_waveform*(self: mlt_frame; w: cint; h: cint): ptr cuchar {.
    importc, cdecl, impmltDyn.}
proc mlt_frame_push_get_image*(self: mlt_frame; get_image: mlt_get_image): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_frame_pop_get_image*(self: mlt_frame): mlt_get_image {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_push_frame*(self: mlt_frame; that: mlt_frame): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_frame_pop_frame*(self: mlt_frame): mlt_frame {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_push_service*(self: mlt_frame; that: pointer): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_frame_pop_service*(self: mlt_frame): pointer {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_push_service_int*(self: mlt_frame; that: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_frame_pop_service_int*(self: mlt_frame): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_push_audio*(self: mlt_frame; that: pointer): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_frame_pop_audio*(self: mlt_frame): pointer {.importc, cdecl, impmltDyn.}
proc mlt_frame_service_stack*(self: mlt_frame): mlt_deque {.importc, cdecl,
    impmltDyn.}
proc mlt_frame_get_original_producer*(self: mlt_frame): mlt_producer {.importc,
    cdecl, impmltDyn.}
proc mlt_frame_close*(self: mlt_frame) {.importc, cdecl, impmltDyn.}
proc mlt_frame_unique_properties*(self: mlt_frame; service: mlt_service): mlt_properties {.
    importc, cdecl, impmltDyn.}
proc mlt_frame_get_unique_properties*(self: mlt_frame; service: mlt_service): mlt_properties {.
    importc, cdecl, impmltDyn.}
proc mlt_frame_clone*(self: mlt_frame; is_deep: cint): mlt_frame {.importc,
    cdecl, impmltDyn.}
proc mlt_frame_write_ppm*(frame: mlt_frame) {.importc, cdecl, impmltDyn.}
  ## ```
                                                                         ##   convenience functions
                                                                         ## ```
proc mlt_filter_init*(self: mlt_filter; child: pointer): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_filter_new*(): mlt_filter {.importc, cdecl, impmltDyn.}
proc mlt_filter_service*(self: mlt_filter): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_filter_properties*(self: mlt_filter): mlt_properties {.importc, cdecl,
    impmltDyn.}
proc mlt_filter_process*(self: mlt_filter; that: mlt_frame): mlt_frame {.
    importc, cdecl, impmltDyn.}
proc mlt_filter_connect*(self: mlt_filter; producer: mlt_service; index: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_filter_set_in_and_out*(self: mlt_filter; `in`: mlt_position;
                                `out`: mlt_position) {.importc, cdecl, impmltDyn.}
proc mlt_filter_get_track*(self: mlt_filter): cint {.importc, cdecl, impmltDyn.}
proc mlt_filter_get_in*(self: mlt_filter): mlt_position {.importc, cdecl,
    impmltDyn.}
proc mlt_filter_get_out*(self: mlt_filter): mlt_position {.importc, cdecl,
    impmltDyn.}
proc mlt_filter_get_length*(self: mlt_filter): mlt_position {.importc, cdecl,
    impmltDyn.}
proc mlt_filter_get_length2*(self: mlt_filter; frame: mlt_frame): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_filter_get_position*(self: mlt_filter; frame: mlt_frame): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_filter_get_progress*(self: mlt_filter; frame: mlt_frame): cdouble {.
    importc, cdecl, impmltDyn.}
proc mlt_filter_close*(a1: mlt_filter) {.importc, cdecl, impmltDyn.}
  ## ```
                                                                    ##   \file mlt_profile.h
                                                                    ##    \brief video output definition
                                                                    ##    \see mlt_profile_s
                                                                    ##   
                                                                    ##    Copyright (C) 2007-2018 Meltytech, LLC
                                                                    ##   
                                                                    ##    This library is free software; you can redistribute it and/or
                                                                    ##    modify it under the terms of the GNU Lesser General Public
                                                                    ##    License as published by the Free Software Foundation; either
                                                                    ##    version 2.1 of the License, or (at your option) any later version.
                                                                    ##   
                                                                    ##    This library is distributed in the hope that it will be useful,
                                                                    ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                    ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                    ##    Lesser General Public License for more details.
                                                                    ##   
                                                                    ##    You should have received a copy of the GNU Lesser General Public
                                                                    ##    License along with this library; if not, write to the Free Software
                                                                    ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                    ##    
                                                                    ##      \brief Producer abstract service class
                                                                    ##   
                                                                    ##    A producer is a service that generates audio, video, and metadata.
                                                                    ##    Some day it may also generate text (subtitles). This is not to say
                                                                    ##    a producer "synthesizes," rather that is an origin of data within the
                                                                    ##    service network - that could be through synthesis or reading a stream.
                                                                    ##   
                                                                    ##    \extends mlt_service
                                                                    ##    \event \em producer-changed either service-changed was fired or the timing of the producer changed
                                                                    ##    \properties \em mlt_type the name of the service subclass, e.g. mlt_producer
                                                                    ##    \properties \em mlt_service the name of a producer subclass
                                                                    ##    \properties \em _position the current position of the play head, relative to the in point
                                                                    ##    \properties \em _frame the current position of the play head, relative to the beginning of the resource
                                                                    ##    \properties \em _speed the current speed factor, where 1.0 is normal
                                                                    ##    \properties \em aspect_ratio sample aspect ratio
                                                                    ##    \properties \em length the duration of the cut in frames
                                                                    ##    \properties \em eof the end-of-file behavior, one of: pause, continue, loop
                                                                    ##    \properties \em resource the file name, stream address, or the class name in angle brackets
                                                                    ##    \properties \em _cut set if this producer is a "cut" producer
                                                                    ##    \properties \em mlt_mix stores the data for a "mix" producer
                                                                    ##    \properties \em _cut_parent holds a reference to the cut's parent producer
                                                                    ##    \properties \em ignore_points Set this to temporarily disable the in and out points.
                                                                    ##    \properties \em use_clone holds a reference to a clone's producer, as created by mlt_producer_optimise
                                                                    ##    \properties \em _clone is the index of the clone in the list of clones stored on the clone's producer
                                                                    ##    \properties \em _clones is the number of clones of the producer, as created by mlt_producer_optimise
                                                                    ##    \properties \em _clone.{N} holds a reference to the N'th clone of the producer, as created by mlt_producer_optimise
                                                                    ##    \properties \em meta.* holds metadata - there is a loose taxonomy to be defined
                                                                    ##    \properties \em set.* holds properties to set on a frame produced
                                                                    ##    \envvar \em MLT_DEFAULT_PRODUCER_LENGTH - the default duration of the producer in frames, defaults to 15000.
                                                                    ##    Most producers will set the producer length to something appropriate
                                                                    ##    like the real duration of an audio or video clip. However, some other things
                                                                    ##    like still images and generators do not have an intrinsic length besides one
                                                                    ##    or infinity. Those producers tend to not override the default length and one
                                                                    ##    expect the app or user to set the length. The default value of 15000 was chosen
                                                                    ##    to provide something useful - not too long or short and convenient to simply
                                                                    ##    set an out point without necessarily nedding to extend the length.
                                                                    ##    \todo define the media metadata taxonomy
                                                                    ## ```
proc mlt_producer_init*(self: mlt_producer; child: pointer): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_producer_new*(a1: mlt_profile): mlt_producer {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_service*(self: mlt_producer): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_properties*(self: mlt_producer): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_producer_seek*(self: mlt_producer; position: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_producer_seek_time*(self: mlt_producer; time: cstring): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_producer_position*(self: mlt_producer): mlt_position {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_frame*(self: mlt_producer): mlt_position {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_frame_time*(self: mlt_producer; a2: mlt_time_format): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_producer_set_speed*(self: mlt_producer; speed: cdouble): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_producer_get_speed*(self: mlt_producer): cdouble {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_get_fps*(self: mlt_producer): cdouble {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_set_in_and_out*(self: mlt_producer; `in`: mlt_position;
                                  `out`: mlt_position): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_clear*(self: mlt_producer): cint {.importc, cdecl, impmltDyn.}
proc mlt_producer_get_in*(self: mlt_producer): mlt_position {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_get_out*(self: mlt_producer): mlt_position {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_get_playtime*(self: mlt_producer): mlt_position {.importc,
    cdecl, impmltDyn.}
proc mlt_producer_get_length*(self: mlt_producer): mlt_position {.importc,
    cdecl, impmltDyn.}
proc mlt_producer_get_length_time*(self: mlt_producer; a2: mlt_time_format): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_producer_prepare_next*(self: mlt_producer) {.importc, cdecl, impmltDyn.}
proc mlt_producer_attach*(self: mlt_producer; filter: mlt_filter): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_producer_detach*(self: mlt_producer; filter: mlt_filter): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_producer_filter*(self: mlt_producer; index: cint): mlt_filter {.
    importc, cdecl, impmltDyn.}
proc mlt_producer_cut*(self: mlt_producer; `in`: cint; `out`: cint): mlt_producer {.
    importc, cdecl, impmltDyn.}
proc mlt_producer_is_cut*(self: mlt_producer): cint {.importc, cdecl, impmltDyn.}
proc mlt_producer_is_mix*(self: mlt_producer): cint {.importc, cdecl, impmltDyn.}
proc mlt_producer_is_blank*(self: mlt_producer): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_cut_parent*(self: mlt_producer): mlt_producer {.importc,
    cdecl, impmltDyn.}
proc mlt_producer_optimise*(self: mlt_producer): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_producer_close*(self: mlt_producer) {.importc, cdecl, impmltDyn.}
proc mlt_producer_get_creation_time*(self: mlt_producer): int64 {.importc,
    cdecl, impmltDyn.}
proc mlt_producer_set_creation_time*(self: mlt_producer; creation_time: int64) {.
    importc, cdecl, impmltDyn.}
proc mlt_multitrack_init*(): mlt_multitrack {.importc, cdecl, impmltDyn.}
proc mlt_multitrack_producer*(self: mlt_multitrack): mlt_producer {.importc,
    cdecl, impmltDyn.}
proc mlt_multitrack_service*(self: mlt_multitrack): mlt_service {.importc,
    cdecl, impmltDyn.}
proc mlt_multitrack_properties*(self: mlt_multitrack): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_multitrack_connect*(self: mlt_multitrack; producer: mlt_producer;
                             track: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_multitrack_insert*(self: mlt_multitrack; producer: mlt_producer;
                            track: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_multitrack_disconnect*(self: mlt_multitrack; track: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_multitrack_clip*(self: mlt_multitrack; whence: mlt_whence; index: cint): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_multitrack_close*(self: mlt_multitrack) {.importc, cdecl, impmltDyn.}
proc mlt_multitrack_count*(self: mlt_multitrack): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_multitrack_refresh*(self: mlt_multitrack) {.importc, cdecl, impmltDyn.}
proc mlt_multitrack_track*(self: mlt_multitrack; track: cint): mlt_producer {.
    importc, cdecl, impmltDyn.}
  ## ```
                               ##   \file mlt_producer.h
                               ##    \brief abstraction for all producer services
                               ##    \see mlt_producer_s
                               ##   
                               ##    Copyright (C) 2003-2014 Meltytech, LLC
                               ##   
                               ##    This library is free software; you can redistribute it and/or
                               ##    modify it under the terms of the GNU Lesser General Public
                               ##    License as published by the Free Software Foundation; either
                               ##    version 2.1 of the License, or (at your option) any later version.
                               ##   
                               ##    This library is distributed in the hope that it will be useful,
                               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                               ##    Lesser General Public License for more details.
                               ##   
                               ##    You should have received a copy of the GNU Lesser General Public
                               ##    License along with this library; if not, write to the Free Software
                               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                               ##    
                               ##     
                               ##    \file mlt_transition.h
                               ##    \brief abstraction for all transition services
                               ##    \see mlt_transition_s
                               ##   
                               ##    Copyright (C) 2003-2015 Meltytech, LLC
                               ##   
                               ##    This library is free software; you can redistribute it and/or
                               ##    modify it under the terms of the GNU Lesser General Public
                               ##    License as published by the Free Software Foundation; either
                               ##    version 2.1 of the License, or (at your option) any later version.
                               ##   
                               ##    This library is distributed in the hope that it will be useful,
                               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                               ##    Lesser General Public License for more details.
                               ##   
                               ##    You should have received a copy of the GNU Lesser General Public
                               ##    License along with this library; if not, write to the Free Software
                               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                               ## ```
proc mlt_transition_init*(self: mlt_transition; child: pointer): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_new*(): mlt_transition {.importc, cdecl, impmltDyn.}
proc mlt_transition_service*(self: mlt_transition): mlt_service {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_properties*(self: mlt_transition): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_connect*(self: mlt_transition; producer: mlt_service;
                             a_track: cint; b_track: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_set_in_and_out*(self: mlt_transition; `in`: mlt_position;
                                    `out`: mlt_position) {.importc, cdecl,
    impmltDyn.}
proc mlt_transition_set_tracks*(self: mlt_transition; a_track: cint;
                                b_track: cint) {.importc, cdecl, impmltDyn.}
proc mlt_transition_get_a_track*(self: mlt_transition): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_transition_get_b_track*(self: mlt_transition): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_transition_get_in*(self: mlt_transition): mlt_position {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_get_out*(self: mlt_transition): mlt_position {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_get_length*(self: mlt_transition): mlt_position {.importc,
    cdecl, impmltDyn.}
proc mlt_transition_get_position*(self: mlt_transition; frame: mlt_frame): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_transition_get_progress*(self: mlt_transition; frame: mlt_frame): cdouble {.
    importc, cdecl, impmltDyn.}
proc mlt_transition_get_progress_delta*(self: mlt_transition; frame: mlt_frame): cdouble {.
    importc, cdecl, impmltDyn.}
proc mlt_transition_process*(self: mlt_transition; a_frame: mlt_frame;
                             b_frame: mlt_frame): mlt_frame {.importc, cdecl,
    impmltDyn.}
proc mlt_transition_close*(self: mlt_transition) {.importc, cdecl, impmltDyn.}
  ## ```
                                                                              ##   \file mlt_consumer.h
                                                                              ##    \brief abstraction for all consumer services
                                                                              ##    \see mlt_consumer_s
                                                                              ##   
                                                                              ##    Copyright (C) 2003-2021 Meltytech, LLC
                                                                              ##   
                                                                              ##    This library is free software; you can redistribute it and/or
                                                                              ##    modify it under the terms of the GNU Lesser General Public
                                                                              ##    License as published by the Free Software Foundation; either
                                                                              ##    version 2.1 of the License, or (at your option) any later version.
                                                                              ##   
                                                                              ##    This library is distributed in the hope that it will be useful,
                                                                              ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                              ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                              ##    Lesser General Public License for more details.
                                                                              ##   
                                                                              ##    You should have received a copy of the GNU Lesser General Public
                                                                              ##    License along with this library; if not, write to the Free Software
                                                                              ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                              ## ```
proc mlt_consumer_init*(self: mlt_consumer; child: pointer; profile: mlt_profile): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_consumer_new*(profile: mlt_profile): mlt_consumer {.importc, cdecl,
    impmltDyn.}
proc mlt_consumer_service*(self: mlt_consumer): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_consumer_properties*(self: mlt_consumer): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_consumer_connect*(self: mlt_consumer; producer: mlt_service): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_consumer_start*(self: mlt_consumer): cint {.importc, cdecl, impmltDyn.}
proc mlt_consumer_purge*(self: mlt_consumer) {.importc, cdecl, impmltDyn.}
proc mlt_consumer_put_frame*(self: mlt_consumer; frame: mlt_frame): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_consumer_get_frame*(self: mlt_consumer): mlt_frame {.importc, cdecl,
    impmltDyn.}
proc mlt_consumer_rt_frame*(self: mlt_consumer): mlt_frame {.importc, cdecl,
    impmltDyn.}
proc mlt_consumer_stop*(self: mlt_consumer): cint {.importc, cdecl, impmltDyn.}
proc mlt_consumer_is_stopped*(self: mlt_consumer): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_consumer_stopped*(self: mlt_consumer) {.importc, cdecl, impmltDyn.}
proc mlt_consumer_close*(a1: mlt_consumer) {.importc, cdecl, impmltDyn.}
proc mlt_consumer_position*(a1: mlt_consumer): mlt_position {.importc, cdecl,
    impmltDyn.}
  ## ```
               ##   \file mlt_filter.h
               ##    \brief abstraction for all filter services
               ##    \see mlt_filter_s
               ##   
               ##    Copyright (C) 2003-2014 Meltytech, LLC
               ##   
               ##    This library is free software; you can redistribute it and/or
               ##    modify it under the terms of the GNU Lesser General Public
               ##    License as published by the Free Software Foundation; either
               ##    version 2.1 of the License, or (at your option) any later version.
               ##   
               ##    This library is distributed in the hope that it will be useful,
               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
               ##    Lesser General Public License for more details.
               ##   
               ##    You should have received a copy of the GNU Lesser General Public
               ##    License along with this library; if not, write to the Free Software
               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
               ##    
               ##     
               ##    \file mlt_playlist.h
               ##    \brief playlist service class
               ##    \see mlt_playlist_s
               ##   
               ##    Copyright (C) 2003-2014 Meltytech, LLC
               ##   
               ##    This library is free software; you can redistribute it and/or
               ##    modify it under the terms of the GNU Lesser General Public
               ##    License as published by the Free Software Foundation; either
               ##    version 2.1 of the License, or (at your option) any later version.
               ##   
               ##    This library is distributed in the hope that it will be useful,
               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
               ##    Lesser General Public License for more details.
               ##   
               ##    You should have received a copy of the GNU Lesser General Public
               ##    License along with this library; if not, write to the Free Software
               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
               ## ```
proc mlt_playlist_init*(): mlt_playlist {.importc, cdecl, impmltDyn.}
proc mlt_playlist_new*(profile: mlt_profile): mlt_playlist {.importc, cdecl,
    impmltDyn.}
proc mlt_playlist_producer*(self: mlt_playlist): mlt_producer {.importc, cdecl,
    impmltDyn.}
proc mlt_playlist_service*(self: mlt_playlist): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_playlist_properties*(self: mlt_playlist): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_playlist_count*(self: mlt_playlist): cint {.importc, cdecl, impmltDyn.}
proc mlt_playlist_clear*(self: mlt_playlist): cint {.importc, cdecl, impmltDyn.}
proc mlt_playlist_append*(self: mlt_playlist; producer: mlt_producer): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_append_io*(self: mlt_playlist; producer: mlt_producer;
                             `in`: mlt_position; `out`: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_blank*(self: mlt_playlist; `out`: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_blank_time*(self: mlt_playlist; length: cstring): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_clip*(self: mlt_playlist; whence: mlt_whence; index: cint): mlt_position {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_current_clip*(self: mlt_playlist): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_playlist_current*(self: mlt_playlist): mlt_producer {.importc, cdecl,
    impmltDyn.}
proc mlt_playlist_get_clip_info*(self: mlt_playlist;
                                 info: ptr mlt_playlist_clip_info; index: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_insert*(self: mlt_playlist; producer: mlt_producer;
                          where: cint; `in`: mlt_position; `out`: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_remove*(self: mlt_playlist; where: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_playlist_move*(self: mlt_playlist; `from`: cint; to: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_reorder*(self: mlt_playlist; indices: ptr cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_resize_clip*(self: mlt_playlist; clip: cint;
                               `in`: mlt_position; `out`: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_repeat_clip*(self: mlt_playlist; clip: cint; repeat: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_split*(self: mlt_playlist; clip: cint; position: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_split_at*(self: mlt_playlist; position: mlt_position;
                            left: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_playlist_join*(self: mlt_playlist; clip: cint; count: cint; merge: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_mix*(self: mlt_playlist; clip: cint; length: cint;
                       transition: mlt_transition): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_playlist_mix_in*(self: mlt_playlist; clip: cint; length: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_mix_out*(self: mlt_playlist; clip: cint; length: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_mix_add*(self: mlt_playlist; clip: cint;
                           transition: mlt_transition): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_playlist_get_clip*(self: mlt_playlist; clip: cint): mlt_producer {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_get_clip_at*(self: mlt_playlist; position: mlt_position): mlt_producer {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_get_clip_index_at*(self: mlt_playlist; position: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_clip_is_mix*(self: mlt_playlist; clip: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_playlist_consolidate_blanks*(self: mlt_playlist; keep_length: cint) {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_is_blank*(self: mlt_playlist; clip: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_playlist_is_blank_at*(self: mlt_playlist; position: mlt_position): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_insert_blank*(self: mlt_playlist; clip: cint; `out`: cint) {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_pad_blanks*(self: mlt_playlist; position: mlt_position;
                              length: cint; find: cint) {.importc, cdecl,
    impmltDyn.}
proc mlt_playlist_replace_with_blank*(self: mlt_playlist; clip: cint): mlt_producer {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_insert_at*(self: mlt_playlist; position: mlt_position;
                             producer: mlt_producer; mode: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_clip_start*(self: mlt_playlist; clip: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_playlist_clip_length*(self: mlt_playlist; clip: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_playlist_blanks_from*(self: mlt_playlist; clip: cint; bounded: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_playlist_remove_region*(self: mlt_playlist; position: mlt_position;
                                 length: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_playlist_close*(self: mlt_playlist) {.importc, cdecl, impmltDyn.}
  ## ```
                                                                          ##   \file mlt_properties.h
                                                                          ##    \brief Properties class declaration
                                                                          ##    \see mlt_properties_s
                                                                          ##   
                                                                          ##    Copyright (C) 2003-2020 Meltytech, LLC
                                                                          ##   
                                                                          ##    This library is free software; you can redistribute it and/or
                                                                          ##    modify it under the terms of the GNU Lesser General Public
                                                                          ##    License as published by the Free Software Foundation; either
                                                                          ##    version 2.1 of the License, or (at your option) any later version.
                                                                          ##   
                                                                          ##    This library is distributed in the hope that it will be useful,
                                                                          ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                          ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                          ##    Lesser General Public License for more details.
                                                                          ##   
                                                                          ##    You should have received a copy of the GNU Lesser General Public
                                                                          ##    License along with this library; if not, write to the Free Software
                                                                          ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                          ##    
                                                                          ##     
                                                                          ##    \file mlt_field.h
                                                                          ##    \brief a field for planting multiple transitions and services
                                                                          ##    \see mlt_field_s
                                                                          ##   
                                                                          ##    Copyright (C) 2003-2014 Meltytech, LLC
                                                                          ##   
                                                                          ##    This library is free software; you can redistribute it and/or
                                                                          ##    modify it under the terms of the GNU Lesser General Public
                                                                          ##    License as published by the Free Software Foundation; either
                                                                          ##    version 2.1 of the License, or (at your option) any later version.
                                                                          ##   
                                                                          ##    This library is distributed in the hope that it will be useful,
                                                                          ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                          ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                          ##    Lesser General Public License for more details.
                                                                          ##   
                                                                          ##    You should have received a copy of the GNU Lesser General Public
                                                                          ##    License along with this library; if not, write to the Free Software
                                                                          ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                          ## ```
proc mlt_field_init*(): mlt_field {.importc, cdecl, impmltDyn.}
proc mlt_field_new*(multitrack: mlt_multitrack; tractor: mlt_tractor): mlt_field {.
    importc, cdecl, impmltDyn.}
proc mlt_field_service*(self: mlt_field): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_field_tractor*(self: mlt_field): mlt_tractor {.importc, cdecl,
    impmltDyn.}
proc mlt_field_multitrack*(self: mlt_field): mlt_multitrack {.importc, cdecl,
    impmltDyn.}
proc mlt_field_properties*(self: mlt_field): mlt_properties {.importc, cdecl,
    impmltDyn.}
proc mlt_field_plant_filter*(self: mlt_field; that: mlt_filter; track: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_field_plant_transition*(self: mlt_field; that: mlt_transition;
                                 a_track: cint; b_track: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_field_close*(self: mlt_field) {.importc, cdecl, impmltDyn.}
proc mlt_field_disconnect_service*(self: mlt_field; service: mlt_service) {.
    importc, cdecl, impmltDyn.}
  ## ```
                               ##   \file mlt_tractor.h
                               ##    \brief tractor service class
                               ##    \see mlt_tractor_s
                               ##   
                               ##    Copyright (C) 2003-2015 Meltytech, LLC
                               ##   
                               ##    This library is free software; you can redistribute it and/or
                               ##    modify it under the terms of the GNU Lesser General Public
                               ##    License as published by the Free Software Foundation; either
                               ##    version 2.1 of the License, or (at your option) any later version.
                               ##   
                               ##    This library is distributed in the hope that it will be useful,
                               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                               ##    Lesser General Public License for more details.
                               ##   
                               ##    You should have received a copy of the GNU Lesser General Public
                               ##    License along with this library; if not, write to the Free Software
                               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                               ## ```
proc mlt_tractor_init*(): mlt_tractor {.importc, cdecl, impmltDyn.}
proc mlt_tractor_new*(): mlt_tractor {.importc, cdecl, impmltDyn.}
proc mlt_tractor_service*(self: mlt_tractor): mlt_service {.importc, cdecl,
    impmltDyn.}
proc mlt_tractor_producer*(self: mlt_tractor): mlt_producer {.importc, cdecl,
    impmltDyn.}
proc mlt_tractor_properties*(self: mlt_tractor): mlt_properties {.importc,
    cdecl, impmltDyn.}
proc mlt_tractor_field*(self: mlt_tractor): mlt_field {.importc, cdecl,
    impmltDyn.}
proc mlt_tractor_multitrack*(self: mlt_tractor): mlt_multitrack {.importc,
    cdecl, impmltDyn.}
proc mlt_tractor_connect*(self: mlt_tractor; service: mlt_service): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_tractor_refresh*(self: mlt_tractor) {.importc, cdecl, impmltDyn.}
proc mlt_tractor_set_track*(self: mlt_tractor; producer: mlt_producer;
                            index: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_tractor_insert_track*(self: mlt_tractor; producer: mlt_producer;
                               index: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_tractor_remove_track*(self: mlt_tractor; index: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_tractor_get_track*(self: mlt_tractor; index: cint): mlt_producer {.
    importc, cdecl, impmltDyn.}
proc mlt_tractor_close*(self: mlt_tractor) {.importc, cdecl, impmltDyn.}
  ## ```
                                                                        ##   \file mlt_tokeniser.h
                                                                        ##    \brief string tokeniser
                                                                        ##    \see mlt_tokeniser_s
                                                                        ##   
                                                                        ##    Copyright (C) 2002-2014 Meltytech, LLC
                                                                        ##   
                                                                        ##    This library is free software; you can redistribute it and/or
                                                                        ##    modify it under the terms of the GNU Lesser General Public
                                                                        ##    License as published by the Free Software Foundation; either
                                                                        ##    version 2.1 of the License, or (at your option) any later version.
                                                                        ##   
                                                                        ##    This library is distributed in the hope that it will be useful,
                                                                        ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                        ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                        ##    Lesser General Public License for more details.
                                                                        ##   
                                                                        ##    You should have received a copy of the GNU Lesser General Public
                                                                        ##    License along with this library; if not, write to the Free Software
                                                                        ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                        ## ```
proc mlt_tokeniser_init*(): mlt_tokeniser {.importc, cdecl, impmltDyn.}
proc mlt_tokeniser_parse_new*(tokeniser: mlt_tokeniser; text: cstring;
                              delimiter: cstring): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_tokeniser_get_input*(tokeniser: mlt_tokeniser): cstring {.importc,
    cdecl, impmltDyn.}
proc mlt_tokeniser_count*(tokeniser: mlt_tokeniser): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_tokeniser_get_string*(tokeniser: mlt_tokeniser; index: cint): cstring {.
    importc, cdecl, impmltDyn.}
proc mlt_tokeniser_close*(tokeniser: mlt_tokeniser) {.importc, cdecl, impmltDyn.}
  ## ```
                                                                                 ##   \file mlt_parser.h
                                                                                 ##    \brief service parsing functionality
                                                                                 ##    \see mlt_parser_s
                                                                                 ##   
                                                                                 ##    Copyright (C) 2003-2014 Meltytech, LLC
                                                                                 ##   
                                                                                 ##    This library is free software; you can redistribute it and/or
                                                                                 ##    modify it under the terms of the GNU Lesser General Public
                                                                                 ##    License as published by the Free Software Foundation; either
                                                                                 ##    version 2.1 of the License, or (at your option) any later version.
                                                                                 ##   
                                                                                 ##    This library is distributed in the hope that it will be useful,
                                                                                 ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                                 ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                                 ##    Lesser General Public License for more details.
                                                                                 ##   
                                                                                 ##    You should have received a copy of the GNU Lesser General Public
                                                                                 ##    License along with this library; if not, write to the Free Software
                                                                                 ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                                 ## ```
proc mlt_parser_new*(): mlt_parser {.importc, cdecl, impmltDyn.}
proc mlt_parser_properties*(self: mlt_parser): mlt_properties {.importc, cdecl,
    impmltDyn.}
proc mlt_parser_start*(self: mlt_parser; `object`: mlt_service): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_parser_close*(self: mlt_parser) {.importc, cdecl, impmltDyn.}
  ## ```
                                                                      ##   \file mlt_profile.h
                                                                      ##    \brief video output definition
                                                                      ##    \see mlt_profile_s
                                                                      ##   
                                                                      ##    Copyright (C) 2007-2018 Meltytech, LLC
                                                                      ##   
                                                                      ##    This library is free software; you can redistribute it and/or
                                                                      ##    modify it under the terms of the GNU Lesser General Public
                                                                      ##    License as published by the Free Software Foundation; either
                                                                      ##    version 2.1 of the License, or (at your option) any later version.
                                                                      ##   
                                                                      ##    This library is distributed in the hope that it will be useful,
                                                                      ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                      ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                      ##    Lesser General Public License for more details.
                                                                      ##   
                                                                      ##    You should have received a copy of the GNU Lesser General Public
                                                                      ##    License along with this library; if not, write to the Free Software
                                                                      ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                      ##    
                                                                      ##     
                                                                      ##    \file mlt_repository.h
                                                                      ##    \brief provides a map between service and shared objects
                                                                      ##    \see mlt_repository_s
                                                                      ##   
                                                                      ##    Copyright (C) 2003-2014 Meltytech, LLC
                                                                      ##   
                                                                      ##    This library is free software; you can redistribute it and/or
                                                                      ##    modify it under the terms of the GNU Lesser General Public
                                                                      ##    License as published by the Free Software Foundation; either
                                                                      ##    version 2.1 of the License, or (at your option) any later version.
                                                                      ##   
                                                                      ##    This library is distributed in the hope that it will be useful,
                                                                      ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                      ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                      ##    Lesser General Public License for more details.
                                                                      ##   
                                                                      ##    You should have received a copy of the GNU Lesser General Public
                                                                      ##    License along with this library; if not, write to the Free Software
                                                                      ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                      ##    
                                                                      ##     
                                                                      ##    \file mlt_log.h
                                                                      ##    \brief logging functions
                                                                      ##   
                                                                      ##    Copyright (C) 2004-2014 Meltytech, LLC
                                                                      ##   
                                                                      ##    This library is free software; you can redistribute it and/or
                                                                      ##    modify it under the terms of the GNU Lesser General Public
                                                                      ##    License as published by the Free Software Foundation; either
                                                                      ##    version 2.1 of the License, or (at your option) any later version.
                                                                      ##   
                                                                      ##    This library is distributed in the hope that it will be useful,
                                                                      ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                      ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                      ##    Lesser General Public License for more details.
                                                                      ##   
                                                                      ##    You should have received a copy of the GNU Lesser General Public
                                                                      ##    License along with this library; if not, write to the Free Software
                                                                      ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                      ## ```
proc mlt_log*(service: pointer; level: cint; fmt: cstring) {.importc, cdecl,
    impmltDyn, varargs.}
proc mlt_vlog*(service: pointer; level: cint; fmt: cstring; a4: va_list) {.
    importc, cdecl, impmltDyn.}
proc mlt_log_get_level*(): cint {.importc, cdecl, impmltDyn.}
proc mlt_log_set_level*(a1: cint) {.importc, cdecl, impmltDyn.}
proc mlt_log_set_callback*(a1: proc (a1: pointer; a2: cint; a3: cstring;
                                     a4: va_list) {.cdecl.}) {.importc, cdecl,
    impmltDyn.}
proc mlt_log_timings_now*(): int64 {.importc, cdecl, impmltDyn.}
  ## ```
                                                                ##   \file mlt_cache.h
                                                                ##    \brief least recently used cache
                                                                ##    \see mlt_cache_s
                                                                ##   
                                                                ##    Copyright (C) 2007-2014 Meltytech, LLC
                                                                ##   
                                                                ##    This library is free software; you can redistribute it and/or
                                                                ##    modify it under the terms of the GNU Lesser General Public
                                                                ##    License as published by the Free Software Foundation; either
                                                                ##    version 2.1 of the License, or (at your option) any later version.
                                                                ##   
                                                                ##    This library is distributed in the hope that it will be useful,
                                                                ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                ##    Lesser General Public License for more details.
                                                                ##   
                                                                ##    You should have received a copy of the GNU Lesser General Public
                                                                ##    License along with this library; if not, write to the Free Software
                                                                ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                ## ```
proc mlt_cache_item_data*(item: mlt_cache_item; size: ptr cint): pointer {.
    importc, cdecl, impmltDyn.}
proc mlt_cache_item_close*(item: mlt_cache_item) {.importc, cdecl, impmltDyn.}
proc mlt_cache_init*(): mlt_cache {.importc, cdecl, impmltDyn.}
proc mlt_cache_set_size*(cache: mlt_cache; size: cint) {.importc, cdecl,
    impmltDyn.}
proc mlt_cache_get_size*(cache: mlt_cache): cint {.importc, cdecl, impmltDyn.}
proc mlt_cache_close*(cache: mlt_cache) {.importc, cdecl, impmltDyn.}
proc mlt_cache_purge*(cache: mlt_cache; `object`: pointer) {.importc, cdecl,
    impmltDyn.}
proc mlt_cache_put*(cache: mlt_cache; `object`: pointer; data: pointer;
                    size: cint; destructor: mlt_destructor) {.importc, cdecl,
    impmltDyn.}
proc mlt_cache_get*(cache: mlt_cache; `object`: pointer): mlt_cache_item {.
    importc, cdecl, impmltDyn.}
proc mlt_cache_put_frame*(cache: mlt_cache; frame: mlt_frame) {.importc, cdecl,
    impmltDyn.}
proc mlt_cache_get_frame*(cache: mlt_cache; position: mlt_position): mlt_frame {.
    importc, cdecl, impmltDyn.}
  ## ```
                               ##   \file mlt_version.h
                               ##    \brief contains version information
                               ##   
                               ##    Copyright (C) 2010-2021 Meltytech, LLC
                               ##   
                               ##    This library is free software; you can redistribute it and/or
                               ##    modify it under the terms of the GNU Lesser General Public
                               ##    License as published by the Free Software Foundation; either
                               ##    version 2.1 of the License, or (at your option) any later version.
                               ##   
                               ##    This library is distributed in the hope that it will be useful,
                               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                               ##    Lesser General Public License for more details.
                               ##   
                               ##    You should have received a copy of the GNU Lesser General Public
                               ##    License along with this library; if not, write to the Free Software
                               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                               ## ```
proc mlt_version_get_int*(): cint {.importc, cdecl, impmltDyn.}
proc mlt_version_get_major*(): cint {.importc, cdecl, impmltDyn.}
proc mlt_version_get_minor*(): cint {.importc, cdecl, impmltDyn.}
proc mlt_version_get_revision*(): cint {.importc, cdecl, impmltDyn.}
proc mlt_version_get_string*(): cstring {.importc, cdecl, impmltDyn.}
  ## ```
                                                                     ##   \file mlt_slices.h
                                                                     ##    \brief sliced threading processing helper
                                                                     ##    \see mlt_slices_s
                                                                     ##   
                                                                     ##    Copyright (C) 2016-2021 Meltytech, LLC
                                                                     ##   
                                                                     ##    This library is free software; you can redistribute it and/or
                                                                     ##    modify it under the terms of the GNU Lesser General Public
                                                                     ##    License as published by the Free Software Foundation; either
                                                                     ##    version 2.1 of the License, or (at your option) any later version.
                                                                     ##   
                                                                     ##    This library is distributed in the hope that it will be useful,
                                                                     ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                     ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                     ##    Lesser General Public License for more details.
                                                                     ##   
                                                                     ##    You should have received a copy of the GNU Lesser General Public
                                                                     ##    License along with this library; if not, write to the Free Software
                                                                     ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                     ## ```
proc mlt_slices_count_normal*(): cint {.importc, cdecl, impmltDyn.}
proc mlt_slices_count_rr*(): cint {.importc, cdecl, impmltDyn.}
proc mlt_slices_count_fifo*(): cint {.importc, cdecl, impmltDyn.}
proc mlt_slices_run_normal*(jobs: cint; `proc`: mlt_slices_proc; cookie: pointer) {.
    importc, cdecl, impmltDyn.}
proc mlt_slices_run_rr*(jobs: cint; `proc`: mlt_slices_proc; cookie: pointer) {.
    importc, cdecl, impmltDyn.}
proc mlt_slices_run_fifo*(jobs: cint; `proc`: mlt_slices_proc; cookie: pointer) {.
    importc, cdecl, impmltDyn.}
  ## ```
                               ##   \file mlt_link.h
                               ##    \brief link service class
                               ##    \see mlt_link_s
                               ##   
                               ##    Copyright (C) 2020 Meltytech, LLC
                               ##   
                               ##    This library is free software; you can redistribute it and/or
                               ##    modify it under the terms of the GNU Lesser General Public
                               ##    License as published by the Free Software Foundation; either
                               ##    version 2.1 of the License, or (at your option) any later version.
                               ##   
                               ##    This library is distributed in the hope that it will be useful,
                               ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                               ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                               ##    Lesser General Public License for more details.
                               ##   
                               ##    You should have received a copy of the GNU Lesser General Public
                               ##    License along with this library; if not, write to the Free Software
                               ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                               ## ```
proc mlt_link_init*(): mlt_link {.importc, cdecl, impmltDyn.}
proc mlt_link_connect_next*(self: mlt_link; next: mlt_producer;
                            chain_profile: mlt_profile): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_link_close*(self: mlt_link) {.importc, cdecl, impmltDyn.}
  ## ```
                                                                  ##   \file mlt_chain.h
                                                                  ##    \brief chain service class
                                                                  ##    \see mlt_chain_s
                                                                  ##   
                                                                  ##    Copyright (C) 2020 Meltytech, LLC
                                                                  ##   
                                                                  ##    This library is free software; you can redistribute it and/or
                                                                  ##    modify it under the terms of the GNU Lesser General Public
                                                                  ##    License as published by the Free Software Foundation; either
                                                                  ##    version 2.1 of the License, or (at your option) any later version.
                                                                  ##   
                                                                  ##    This library is distributed in the hope that it will be useful,
                                                                  ##    but WITHOUT ANY WARRANTY; without even the implied warranty of
                                                                  ##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                                                                  ##    Lesser General Public License for more details.
                                                                  ##   
                                                                  ##    You should have received a copy of the GNU Lesser General Public
                                                                  ##    License along with this library; if not, write to the Free Software
                                                                  ##    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
                                                                  ## ```
proc mlt_chain_init*(a1: mlt_profile): mlt_chain {.importc, cdecl, impmltDyn.}
proc mlt_chain_set_source*(self: mlt_chain; source: mlt_producer) {.importc,
    cdecl, impmltDyn.}
proc mlt_chain_get_source*(self: mlt_chain): mlt_producer {.importc, cdecl,
    impmltDyn.}
proc mlt_chain_attach*(self: mlt_chain; link: mlt_link): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_chain_detach*(self: mlt_chain; link: mlt_link): cint {.importc, cdecl,
    impmltDyn.}
proc mlt_chain_link_count*(self: mlt_chain): cint {.importc, cdecl, impmltDyn.}
proc mlt_chain_move_link*(self: mlt_chain; `from`: cint; to: cint): cint {.
    importc, cdecl, impmltDyn.}
proc mlt_chain_link*(self: mlt_chain; index: cint): mlt_link {.importc, cdecl,
    impmltDyn.}
proc mlt_chain_close*(self: mlt_chain) {.importc, cdecl, impmltDyn.}
{.pop.}
