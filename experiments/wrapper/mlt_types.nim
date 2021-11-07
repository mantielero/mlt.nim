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

#when not defined(GCC_VERSION):
#  const
#    GCC_VERSION* = (gnuc * 10000 + gnuc_Minor * 100 + gnuc_Patchlevel)
#when not defined(PATH_MAX):
#  const
#    PATH_MAX* = 4096
## * The set of supported image formats

type
  ImageFormat* {.size: sizeof(cint).} = enum
    imageNone = 0,              ## *< image not available
    imageRgb,                 ## *< 8-bit RGB
    imageRgba,                ## *< 8-bit RGB with alpha channel
    imageYuv422,              ## *< 8-bit YUV 4:2:2 packed
    imageYuv420p,             ## *< 8-bit YUV 4:2:0 planar
    imageMovit,               ## *< for movit module internal use only
    imageOpenglTexture,       ## *< an OpenGL texture name
    imageYuv422p16,           ## *< planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    imageInvalid


## * The set of supported audio formats

type
  AudioFormat* {.size: sizeof(cint).} = enum
    audioNone = 0,              ## *< audio not available
    audioS16 = 1,               ## *< signed 16-bit interleaved PCM
    audioS32,                 ## *< signed 32-bit non-interleaved PCM
    audioFloat,               ## *< 32-bit non-interleaved floating point
    audioS32le,               ## *< signed 32-bit interleaved PCM
    audioF32le,               ## *< 32-bit interleaved floating point
    audioU8                   ## *< unsigned 8-bit interleaved PCM
  ChannelLayout* {.size: sizeof(cint).} = enum
    channelAuto = 0,            ## *< MLT will determine the default configuration based on channel number
    channelIndependent,       ## *< channels are not related
    channelMono, channelStereo, channel2p1, channel3p0, channel3p0Back, channel4p0,
    channelQuadBack, channelQuadSide, channel3p1, channel5p0Back, channel5p0,
    channel4p1, channel5p1Back, channel5p1, channel6p0, channel6p0Front,
    channelHexagonal, channel6p1, channel6p1Back, channel6p1Front, channel7p0,
    channel7p0Front, channel7p1, channel7p1WideSide, channel7p1WideBack



## * Colorspace definitions

type
  Colorspace* {.size: sizeof(cint).} = enum
    colorspaceRgb = 0,          ## /< order of coefficients is actually GBR, also IEC 61966-2-1 (sRGB)
    colorspaceBt709 = 1,        ## /< also ITU-R BT1361 / IEC 61966-2-4 xvYCC709 / SMPTE RP177 Annex B
    colorspaceUnspecified = 2, colorspaceReserved = 3, colorspaceFcc = 4, ## /< FCC Title 47 Code of Federal Regulations 73.682 (a)(20)
    colorspaceBt470bg = 5,      ## /< also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM / IEC 61966-2-4 xvYCC601
    colorspaceSmpte170m = 6,    ## /< also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC
    colorspaceSmpte240m = 7,    ## /< functionally identical to above
    colorspaceYcgco = 8,        ## /< Used by Dirac / VC-2 and H.264 FRext, see ITU-T SG16
    colorspaceBt2020Ncl = 9,    ## /< ITU-R BT2020 non-constant luminance system
    colorspaceBt2020Cl = 10,    ## /< ITU-R BT2020 constant luminance system
    colorspaceSmpte2085 = 11    ## /< SMPTE 2085, Y'D'zD'x


## * The time string formats

type
  TimeFormat* {.size: sizeof(cint).} = enum
    timeFrames = 0,             ## *< frame count
    timeClock,                ## *< SMIL clock-value as [[hh:]mm:]ss[.fraction]
    timeSmpteDf,              ## *< SMPTE timecode as [[[hh:]mm:]ss{:|;}]frames
    timeSmpteNdf              ## *< SMPTE NDF timecode as [[[hh:]mm:]ss:]frames


## * Interpolation methods for animation keyframes

type
  KeyframeType* {.size: sizeof(cint).} = enum
    keyframeDiscrete = 0,       ## *< non-interpolated; value changes instantaneously at the key frame
    keyframeLinear,           ## *< simple, constant pace from this key frame to the next
    keyframeSmooth            ## *< eased pacing from this keyframe to the next using a Catmull-Rom spline


## * The relative time qualifiers

type
  Whence* {.size: sizeof(cint).} = enum
    whenceRelativeStart = 0,    ## *< relative to the beginning
    whenceRelativeCurrent,    ## *< relative to the current position
    whenceRelativeEnd         ## *< relative to the end


## * The recognized subclasses of mlt_service

type
  ServiceType* {.size: sizeof(cint).} = enum
    serviceInvalidType = 0,     ## *< invalid service
    serviceUnknownType,       ## *< unknown class
    serviceProducerType,      ## *< Producer class
    serviceTractorType,       ## *< Tractor class
    servicePlaylistType,      ## *< Playlist class
    serviceMultitrackType,    ## *< Multitrack class
    serviceFilterType,        ## *< Filter class
    serviceTransitionType,    ## *< Transition class
    serviceConsumerType,      ## *< Consumer class
    serviceFieldType,         ## *< Field class
    serviceLinkType,          ## *< Link class
    serviceChainType          ## *< Chain class


##  I don't want to break anyone's applications without warning. -Zach

when defined(DOUBLE_MLT_POSITION):
  const
    MLT_POSITION_FMT* = "%f"
  template mlt_Position_Mod*(a, b: untyped): untyped =
    ((a) - (b) * ((int)((a) div (b))))

  type
    Position* = cdouble
else:
  template mlt_Position_Mod*(a, b: untyped): untyped =
    ((a) mod (b))

  const
    MLT_POSITION_FMT* = "%d"
  type
    Position* = cint
## * A rectangle type with coordinates, size, and opacity

type
  Rect* {.importc: "mlt_rect", header: "mlt_types.h", bycopy.} = object
    x* {.importc: "x".}: cdouble ## *< X coordinate
    y* {.importc: "y".}: cdouble ## *< Y coordinate
    w* {.importc: "w".}: cdouble ## *< width
    h* {.importc: "h".}: cdouble ## *< height
    o* {.importc: "o".}: cdouble ## *< opacity / mix-level


## * A tuple of color components

type
  Color* {.importc: "mlt_color", header: "mlt_types.h", bycopy.} = object
    r* {.importc: "r".}: uint8  ## *< red
    g* {.importc: "g".}: uint8  ## *< green
    b* {.importc: "b".}: uint8  ## *< blue
    a* {.importc: "a".}: uint8  ## *< alpha




type

  PropertySS {.importc:"mlt_property_s", header:"mlt_types.h", bycopy.} = object
  Property* = ptr PropertySS

  ServiceSS* {.importc: "mlt_service_s", header: "mlt_service.h", bycopy.} = object
  Service* = ptr ServiceSS  

  FilterSS* {.importc: "mlt_filter_s", header: "mlt_filter.h", bycopy.} = object
  Filter* = ptr FilterSS

  FrameSS* {.importc: "mlt_frame_s", header: "mlt_frame.h", bycopy.} = object
  Frame* = ptr FrameSS  

  LinkSS* {.importc: "mlt_link_s", header: "mlt_link.h", bycopy.} = object
  Link* = ptr LinkSS  
  

  EventStructSS {.importc:"mlt_event_struct", header:"mlt_types.h", bycopy.} = object
  Event* = ptr EventStructSS
  

  ProducerSS {.importc:"mlt_producer_s", header:"mlt_types.h", bycopy.} = object
  Producer* = ptr ProducerSS
  
  PlaylistSS {.importc:"mlt_playlist_s", header:"mlt_types.h", bycopy.} = object
  Playlist* = ptr PlaylistSS
  
  MultitrackSS {.importc:"mlt_multitrack_s", header:"mlt_types.h", bycopy.} = object
  Multitrack* = ptr MultitrackSS
  

  TransitionSS {.importc:"mlt_transition_s", header:"mlt_types.h", bycopy.} = object
  Transition* = ptr TransitionSS
  
  TractorSS {.importc:"mlt_tractor_s", header:"mlt_types.h", bycopy.} = object
  Tractor* = ptr TractorSS
  
  FieldSS {.importc:"mlt_field_s", header:"mlt_types.h", bycopy.} = object
  Field* = ptr FieldSS
  
  
  ParserSS {.importc:"mlt_parser_s", header:"mlt_types.h", bycopy.} = object
  Parser* = ptr ParserSS
  
  DequeSS {.importc:"mlt_deque_s", header:"mlt_types.h", bycopy.} = object
  Deque* = ptr DequeSS
  
  GeometrySS {.importc:"mlt_geometry_s", header:"mlt_types.h", bycopy.} = object
  Geometry* = ptr GeometrySS
  
  GeometryItemSS {.importc:"mlt_geometry_item_s", header:"mlt_types.h", bycopy.} = object
  GeometryItem* = ptr GeometryItemSS
  
  ProfileSS {.importc:"mlt_profile_s", header:"mlt_types.h", bycopy.} = object
  Profile* = ptr ProfileSS
  
  RepositorySS {.importc:"mlt_repository_s", header:"mlt_types.h", bycopy.} = object
  Repository* {.importc:"mlt_repository", header:"mlt_types.h", bycopy.}  = object#ptr RepositorySS
  
  CacheSS {.importc:"mlt_cache_s", header:"mlt_types.h", bycopy.} = object
  Cache* = ptr CacheSS
  
  CacheItemSS {.importc:"mlt_cache_item_s", header:"mlt_types.h", bycopy.} = object
  CacheItem* = ptr CacheItemSS
  
  AnimationSS {.importc:"mlt_animation_s", header:"mlt_types.h", bycopy.} = object
  Animation* = ptr AnimationSS
  
  SlicesSS {.importc:"mlt_slices_s", header:"mlt_types.h", bycopy.} = object
  Slices* = ptr SlicesSS
  

##  typedef struct mlt_chain_s *mlt_chain;                  /**< pointer to Chain object */

type
  Destructor* = proc (a1: pointer) {.cdecl.}

## *< pointer to destructor function

type
  Serialiser* = proc (a1: pointer; length: cint): cstring {.cdecl.}

## *< pointer to serialization function

type
  ThreadFunctionT* = proc (a1: pointer): pointer {.cdecl.}

## *< generic thread function pointer
##  #define MLT_SERVICE(x)    ( ( mlt_service )( x ) )      /**< Cast to a Service pointer */
##  #define MLT_PRODUCER(x)   ( ( mlt_producer )( x ) )     /**< Cast to a Producer pointer */
##  #define MLT_MULTITRACK(x) ( ( mlt_multitrack )( x ) )   /**< Cast to a Multitrack pointer */
##  #define MLT_PLAYLIST(x)   ( ( mlt_playlist )( x ) )     /**< Cast to a Playlist pointer */
##  #define MLT_TRACTOR(x)    ( ( mlt_tractor )( x ) )      /**< Cast to a Tractor pointer */
##  #define MLT_FILTER(x)     ( ( mlt_filter )( x ) )       /**< Cast to a Filter pointer */
##  #define MLT_TRANSITION(x) ( ( mlt_transition )( x ) )   /**< Cast to a Transition pointer */
##  #define MLT_CONSUMER(x) ( ( mlt_consumer )( x ) )       /**< Cast to a Consumer pointer */
##  #define MLT_FRAME(x)      ( ( mlt_frame )( x ) )        /**< Cast to a Frame pointer */
##  #define MLT_LINK(x)       ( ( mlt_link )( x ) )         /**< Cast to a Link pointer */
##  #define MLT_CHAIN(x)      ( ( mlt_chain )( x ) )        /**< Cast to a Chain pointer */
##
##  #ifndef MIN
##  #define MIN(x, y) ((x) < (y) ? (x) : (y))
##  #endif
##  #ifndef MAX
##  #define MAX(x, y) ((x) > (y) ? (x) : (y))
##  #endif
##  #ifndef CLAMP
##  #define CLAMP(x, min, max) ((x) < (min) ? (min) : (x) > (max) ? (max) : (x))
##  #endif
##
##  #ifdef _WIN32
##  #include <pthread.h>
##  /* Win32 compatibility function declarations */
##  #if !defined(__MINGW32__)
##  extern int usleep(unsigned int useconds);
##  #endif
##  #ifndef WIN_PTHREADS_TIME_H
##  extern int nanosleep( const struct timespec * rqtp, struct timespec * rmtp );
##  #endif
##  extern int setenv(const char *name, const char *value, int overwrite);
##  extern char* getlocale();
##  extern FILE* win32_fopen(const char *filename_utf8, const char *mode_utf8);
##  #include <time.h>
##  extern char* strptime(const char *buf, const char *fmt, struct tm *tm);
##  #define mlt_fopen win32_fopen
##  #define MLT_DIRLIST_DELIMITER ";"
##  #else
##  #define mlt_fopen fopen
##  #define MLT_DIRLIST_DELIMITER ":"
##  #endif /* ifdef _WIN32 */
##
##  #ifdef __cplusplus
##  }
##  #endif
