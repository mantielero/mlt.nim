# The following creates: mlt.nim
# nim c gen.nim
import nimterop/cimport

const
  mltlib =
    when defined(Windows):
        "mlt-7.dll"
    elif hostOS == "macosx":
      "libmlt(.3|.1|).dylib"
    else:
      "libmlt-7.so"

static:
  cDebug()
  cDisableCaching()           # Regenerate Nim wrapper every time

#cDefine("HAS_ABC")            # Set #defines for preprocessor and compiler
#cDefine("HAS_ABC", "DEF")

cIncludeDir("/usr/include/mlt-7/framework")   # Setup any include directories
#cExclude("clib/file.h")       # Exclude file from wrapped output



cOverride:
  type
    mlt_property_s = object
    mlt_event_struct = object
    mlt_field_s = object
    mlt_deque_s = object
    mlt_geometry_s = object
    mlt_geometry_item_s = object
    mlt_repository_s = object    
    mlt_cache_s = object    
    mlt_cache_item_s = object       
    mlt_animation_s = object     
    playlist_entry_s = object        
    playlist_entry = object 
    locale_t = cstring  
    mlt_tokeniser = object
    pthread_mutex_t = object

    mlt_consumer_s = object   # parent, start, stop, is_stopped, purge, close, local, child 
    mlt_producer_s = object
#    property = object
#    position = object

cImport( "/usr/include/mlt-7/framework/mlt.h", 
         recurse = true, 
         dynlib = mltlib,
         flags = "--passL=-lX11", 
         nimfile = "mlt.nim")             # Generate wrappers for header specified 

#cCompile("clib/src/*.c")      # Compile in any implementation source files

#cImport(["/usr/include/mlt-7/framework/mlt_version.h", recurse = false, dynlib = "mlt", flags = """--prefix="mlt_"""", nimfile = "version.nim")
#cImport("/usr/include/mlt-7/framework/mlt_property.h", recurse = false, dynlib = "mlt", flags = """--prefix="mlt_"""", nimfile = "property.nim")
#[
include mlt_types
include mlt_property
include mlt_properties
include mlt_frame
include mlt_service

#include mlt
include mlt_animation
include mlt_audio

include mlt_cache
include mlt_producer
include mlt_link
include mlt_chain
include mlt_consumer
include mlt_deque
include mlt_events
include mlt_filter
include mlt_factory
include mlt_field


include mlt_image

include mlt_luma_map
include mlt_multitrack
include mlt_parser
include mlt_playlist
include mlt_pool

include mlt_profile


include mlt_repository

include mlt_slices
include mlt_tokeniser
include mlt_tractor
include mlt_transition


]#