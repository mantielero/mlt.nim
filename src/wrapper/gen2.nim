# The following creates: mlt.nim
# nim c gen.nim
import nimterop/[build, cimport]

static:
  cDebug()
  cDisableCaching()           # Regenerate Nim wrapper every time

#cDefine("HAS_ABC")            # Set #defines for preprocessor and compiler
#cDefine("HAS_ABC", "DEF")

const
  mltlib =
    when defined(Windows):
        "mlt-7.dll"
    elif hostOS == "macosx":
      "libmlt(.3|.1|).dylib"
    else:
      "libmlt-7.so"

const
  baseDir = getProjectCacheDir("testwrapper")             # Download library within nimcache


getHeader(
  "src/framework/mlt.h",                                             # The header file to wrap, full path is returned in `headerPath`
  giturl = "https://github.com/mltframework/mlt",            # Git repo URL
  #dlurl = "https://website.org/download/repo-$1.tar.gz",  # Download URL for archive or raw file
  #conanuri = "repo/$1",                                   # Conan.io URI
  #jbburi = "repo/$1",                                     # BinaryBuilder.org URI
  outdir = baseDir,                                       # Where to download/build/search
  #conFlags = "--disable-comp --enable-feature",           # Flags to pass configure script
  cmakeFlags = "",#-DENABLE_STATIC_LIB=ON"                   # Flags to pass to Cmake
  altNames = "mlt"                                        # Alterate names of the library binary, full path returned in `headerLPath`
)

# Wrap headerPath as returned from getHeader() and link statically
# or dynamically depending on user input

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
    locale_t = cstring  
    mlt_tokeniser = object
#    property = object
#    position = object

when not isDefined(headerStatic):
  cImport(headerPath, recurse = true, dynlib = "headerLPath")       # Pass dynlib if not static link
else:
  cImport(headerPath, recurse = true)




#cIncludeDir("/usr/include/mlt-7/framework")   # Setup any include directories
#cExclude("clib/file.h")       # Exclude file from wrapped output


#cImport("/usr/include/mlt-7/framework/mlt.h", recurse = true, dynlib = mltlib, nimfile = "mlt.nim")             # Generate wrappers for header specified 
