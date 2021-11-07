#!/usr/bin/env nim
import strutils, os, algorithm
let lib = "/usr/include/mlt-7/framework/"
let packageName = "mlt7"
let c2nimFile = packageName & ".c2nim"
#[ let beg = """
when defined(windows):
  const tkernel* = "TKernel.dll"
elif defined(macosx):
  const tkernel* = "libTKernel.dylib"
else:
  const tkernel* = "libTKernel.so" 

""" ]#
proc genFiles*( infile:string;
               remove:seq[tuple[a,b:int]] = @[]; 
               comment:seq[tuple[a,b:int]] = @[]; 
               addSemiColon:seq[int] = @[];
               replaceAll:seq[tuple[sub,by:string]] = @[];
               removeFuncBody:seq[tuple[a,b:int]] = @[]) =
    var (dir, name, ext) = splitFile(infile)
    if dir == "":
      dir = lib
    if ext == "":
      ext = ".h"
    cpFile(dir & name & ext, name & ".h")
    var rem:seq[tuple[a,b:int]] = remove
    var semiColon = addSemiColon
    if removeFuncBody.len > 0:
      for item in removeFuncBody:
        rem &= item
        semiColon &= item.a - 1
    #echo semiColon
    # Replace text strings
    if replaceAll.len > 0:    
      for item in replaceAll:
        var txt = readFile(name & ".h")        
        txt = txt.replace(item.sub, item.by)
        writeFile(name & ".h", txt)


    # Colons to add at the end of line
    if semiColon.len > 0:
        for line in semiColon:
            var edit = "'" & $line & " s/$/;/i'"
            edit = "sed -e " & edit & " -i " & name & ".h"
            exec edit

    # Lines to remove from the header
    if rem.len > 0:
        var edit = ""
        var n = 0
        for item in rem:
            edit &= $item.a & "," & $item.b & "d"
            n += 1
            if n != rem.len:
                edit &= ";"
        exec "sed -e '" & edit & "' -i " & name & ".h"

    # Comment lines
    if comment.len > 0:
      var txt = readFile(name & ".h") 
      var lines = txt.splitLines()
      for rng in comment:
        for i in (rng.a - 1) .. (rng.b - 1):
          lines[i] = "// " & lines[i]
      writeFile(name & ".h", lines.join("\n"))
        
    # Search and comment


    let execLine = "c2nim --header --strict --nep1 --out:" & name.toLower & ".nim " & c2nimFile & " " & name & ".h"
    echo execLine
    exec execLine
    let txt = readFile(name.toLower & ".nim")
    writeFile(name.toLower & ".nim", txt ) #beg & txt)
    rmFile(name & ".h")
    echo name


proc pp*(file:string,
        insert:seq[tuple[line:int;value:string]] = @[],
        replaceAll:seq[tuple[sub,by:string]] = @[];        
        comment:seq[int] = @[];
        commentRange:seq[tuple[a,b:int]] = @[] ) =
  echo "Postprocessing.... " & file
  # Reemplazar
  if replaceAll.len > 0:    
    for item in replaceAll:
      var txt = readFile(file)        
      txt = txt.replace(item.sub, item.by)
      writeFile(file, txt)

  var lines = file.readFile.splitLines

  # Comment lines
  for i in 0..<lines.len:
    if i+1 in comment:
      lines[i] = "#" & lines[i]


  for item in commentRange:
      for i in item.a .. item.b:
        lines[i-1] = "#" & lines[i-1]

  # Insert lines
  var n = 0
  for item in insert:
    var tmp1 = lines[0 .. item.line - 2 + n] 
    var tmp2 = lines[item.line - 1 + n .. lines.len-1]
    lines = tmp1 & item.value & tmp2
    n += 1
  writeFile( file, lines.join("\n"))
  
  

#=====================================================

# ls /usr/include/mlt-7/framework/*.h | cut -c 30-


genFiles("mlt_animation")
pp("mlt_animation.nim",
  replaceAll = @[("animationItemS", "AnimationItemS")]
) #, commentRange  = @[(23,24)])
genFiles("mlt_audio")
pp("mlt_audio.nim",
  insert = @[(39, "  Audio* = ptr AudioS")],
  replaceAll = @[("uint8T", "uint8"), ("int64T", "int")]
)
genFiles("mlt_cache")
genFiles("mlt_chain")
pp("mlt_chain.nim",
  insert = @[(34, "  Chain* = ptr ChainS" )]
)




genFiles("mlt_consumer")
pp("mlt_consumer.nim",
  insert = @[(113, "  Consumer* = ptr ConsumerS")]
)

genFiles("mlt_deque")
genFiles("mlt_events")
genFiles("mlt_factory")
genFiles("mlt_field")
genFiles("mlt_filter")

genFiles("mlt_frame",
  comment = @[(102, 105), (144,161)]
)
#[ pp("mlt_frame.nim",
  replaceAll = @[("""    convertImage* {.importc: "convert_image".}: proc (self: Frame;
        image: ptr ptr uint8T; input: ptr ImageFormat; output: ImageFormat): cint {.cdecl.} ##""", "" ),
  ("""    convertAudio* {.importc: "convert_audio".}: proc (self: Frame; audio: ptr pointer;
        input: ptr AudioFormat; output: AudioFormat): cint {.cdecl.}""",""  ),
  
  ],
  insert = @[(131, "  Frame* = ptr FrameS"),
  
  (132,  """proc convertAudio* (self: Frame; audio: ptr pointer; input: ptr AudioFormat;
        output: AudioFormat): cint {.importc: "convert_audio",cdecl.}
proc convertImage*(self: Frame; image: ptr ptr uint8T; 
                   input: ptr ImageFormat; output: ImageFormat): cint   {.importc: "convert_image",cdecl.}      
  """ )],

) ]#
pp("mlt_frame.nim",
  replaceAll = @[("uint8T", "uint8")]
)

#genFiles("mlt")
genFiles("mlt_image")
pp("mlt_image.nim",
  insert = @[(44, "  Image* = ptr ImageS")],
  replaceAll = @[("MLT_IMAGE_MAX_PLANES","ImageMaxPlanes"),
  ("mlt_Image_Max_Planes", "ImageMaxPlanes"),
  ("uint8T", "uint8")]
)
genFiles("mlt_link")
pp("mlt_link.nim",
  replaceAll = @[ ("FramePtr", "ptr Frame")]#("uint8T", "uint8")]
)
#[ genFiles("mlt_log",
  replaceAll = @[("""#ifdef __GNUC__
void mlt_log( void *service, int level, const char *fmt, ... ) __attribute__ ((__format__ (__printf__, 3, 4)));
#else
void mlt_log( void *service, int level, const char *fmt, ... );
#endif""", "") ] #"void mlt_log( void *service, int level, const char *fmt, ... );")]
) ]#
genFiles("mlt_luma_map")
pp("mlt_luma_map.nim",
  replaceAll = @[("lumaMapS", "LumaMapS"), ("uint16T", "uint16"),("uint8T", "uint8")]
)
genFiles("mlt_multitrack")
pp("mlt_multitrack.nim",
  replaceAll = @[("trackS", "TrackS")]#, ("uint16T", "uint16"),("uint8T", "uint8")]
)
genFiles("mlt_parser")
genFiles("mlt_playlist")
pp("mlt_playlist.nim",
  replaceAll = @[("playlistEntryS", "PlaylistEntryS"),
  ("PlaylistEntry* = PlaylistEntryS",
  """PlaylistEntry* {.importc:"playlist_entry_s",header:"mlt_playlist.h", bycopy.} = object""")]#, ("uint16T", "uint16"),("uint8T", "uint8")]
)

genFiles("mlt_pool")
genFiles("mlt_producer")
pp("mlt_producer.nim",
  replaceAll = @[("FramePtr", "ptr Frame"), ("int64T", "int")]
)
genFiles("mlt_profile")
genFiles("mlt_properties")
pp("mlt_properties.nim",
  insert = @[(39, "  Properties* = ptr PropertiesS")],
  replaceAll = @[("int64T", "int")]
)

genFiles("mlt_property",
  comment = @[(26,42)]
)
pp("mlt_property.nim",
  insert = @[(22, """type
  LocaleT* = cstring
  """)],
  replaceAll = @[("int64T", "int")]
)
genFiles("mlt_repository",
  comment = @[(48, 54)]
)
genFiles("mlt_service")
pp("mlt_service.nim",
  replaceAll = @[("FramePtr", "ptr Frame")]

)
genFiles("mlt_slices")
genFiles("mlt_tokeniser",
  replaceAll = @[("*mlt_tokeniser, mlt_tokeniser_t;", "mlt_tokeniser, mlt_tokeniser_t;")]
)
genFiles("mlt_tractor")
genFiles("mlt_transition")
genFiles("mlt_types",
  comment = @[(205, 231), (237, 282)]
)
pp("mlt_types.nim",
  commentRange = @[(22,27)],
  insert = @[(168, "type")],
  replaceAll = @[
  ("int32T", "cint"), ("uint8T", "uint8"),
  ("##  typedef struct mlt_audio_s *mlt_audio;                  /**< pointer to Audio object */", ""),
  ("##  typedef struct mlt_image_s *mlt_image;                  /**< pointer to Image object */", ""),
  ("##  typedef struct mlt_frame_s *mlt_frame, **mlt_frame_ptr; /**< pointer to Frame object */", ""),
  ("##  typedef struct mlt_properties_s *mlt_properties;        /**< pointer to Properties object */", ""),
  ("##  typedef struct mlt_filter_s *mlt_filter;                /**< pointer to Filter object */", ""),
  ("##  typedef struct mlt_link_s *mlt_link;                    /**< pointer to Link object */", ""),
  ("##  typedef struct mlt_service_s *mlt_service;              /**< pointer to Service object */",""),
  ("##  typedef struct mlt_property_s *mlt_property;            /**< pointer to Property object */",
  """
  PropertySS {.importc:"mlt_property_s", header:"mlt_types.h", bycopy.} = object
  Property* {.importc:"mlt_property", header:"mlt_types.h", bycopy.} = object #ptr PropertySS

  ServiceSS* {.importc: "mlt_service_s", header: "mlt_service.h", bycopy.} = object
  Service* {.importc: "mlt_service", header: "mlt_service.h", bycopy.} = object #ptr ServiceSS  

  FilterSS* {.importc: "mlt_filter_s", header: "mlt_filter.h", bycopy.} = object
  Filter* {.importc: "mlt_filter", header: "mlt_filter.h", bycopy.} = object #ptr FilterSS

  FrameSS* {.importc: "mlt_frame_s", header: "mlt_frame.h", bycopy.} = object
  Frame* {.importc: "mlt_frame", header: "mlt_filter.h", bycopy.} = object # ptr FrameSS  

  LinkSS* {.importc: "mlt_link_s", header: "mlt_link.h", bycopy.} = object
  Link* {.importc: "mlt_link_s", header: "mlt_link.h", bycopy.} = object #ptr LinkSS  
  """),

  ("##  typedef struct mlt_event_struct *mlt_event;             /**< pointer to Event object */",
  """
  EventStructSS {.importc:"mlt_event_struct", header:"mlt_types.h", bycopy.} = object
  Event* {.importc:"mlt_event_struct", header:"mlt_types.h", bycopy.} = object #ptr EventStructSS
  """),


  ("##  typedef struct mlt_producer_s *mlt_producer;            /**< pointer to Producer object */",
  """
  ProducerSS {.importc:"mlt_producer_s", header:"mlt_types.h", bycopy.} = object
  Producer* {.importc:"mlt_producer", header:"mlt_types.h", bycopy.} = object #ptr ProducerSS
  """),
  ("##  typedef struct mlt_playlist_s *mlt_playlist;            /**< pointer to Playlist object */",
  """
  PlaylistSS {.importc:"mlt_playlist_s", header:"mlt_types.h", bycopy.} = object
  Playlist* {.importc:"mlt_playlist", header:"mlt_types.h", bycopy.} = object #ptr PlaylistSS
  """),
  ("##  typedef struct mlt_multitrack_s *mlt_multitrack;        /**< pointer to Multitrack object */",
  """
  MultitrackSS {.importc:"mlt_multitrack_s", header:"mlt_types.h", bycopy.} = object
  Multitrack* {.importc:"mlt_multitrack", header:"mlt_types.h", bycopy.}  = object #ptr MultitrackSS
  """),

  ("##  typedef struct mlt_transition_s *mlt_transition;        /**< pointer to Transition object */",
  """
  TransitionSS {.importc:"mlt_transition_s", header:"mlt_types.h", bycopy.} = object
  Transition* {.importc:"mlt_transition", header:"mlt_types.h", bycopy.} = object # ptr TransitionSS
  """),
  ("##  typedef struct mlt_tractor_s *mlt_tractor;              /**< pointer to Tractor object */",
  """
  TractorSS {.importc:"mlt_tractor_s", header:"mlt_types.h", bycopy.} = object
  Tractor*  {.importc:"mlt_tractor", header:"mlt_types.h", bycopy.} = object #ptr TractorSS
  """),
  ("##  typedef struct mlt_field_s *mlt_field;                  /**< pointer to Field object */",
  """
  FieldSS {.importc:"mlt_field_s", header:"mlt_types.h", bycopy.} = object
  Field* {.importc:"mlt_field", header:"mlt_types.h", bycopy.} = object #ptr FieldSS
  """),
  ("##  typedef struct mlt_consumer_s *mlt_consumer;            /**< pointer to Consumer object */",
  "  "),
  ("##  typedef struct mlt_parser_s *mlt_parser;                /**< pointer to Properties object */",
  """
  ParserSS {.importc:"mlt_parser_s", header:"mlt_types.h", bycopy.} = object
  Parser* {.importc:"mlt_parser", header:"mlt_types.h", bycopy.} = object #ptr ParserSS
  """),
  ("##  typedef struct mlt_deque_s *mlt_deque;                  /**< pointer to Deque object */",
  """
  DequeSS {.importc:"mlt_deque_s", header:"mlt_types.h", bycopy.} = object
  Deque*  {.importc:"mlt_deque", header:"mlt_types.h", bycopy.} = object #ptr DequeSS
  """),
  ("##  typedef struct mlt_geometry_s *mlt_geometry;            /**< pointer to Geometry object */",
  """
  GeometrySS {.importc:"mlt_geometry_s", header:"mlt_types.h", bycopy.} = object
  Geometry* {.importc:"mlt_geometry", header:"mlt_types.h", bycopy.} = object #ptr GeometrySS
  """),
  ("##  typedef struct mlt_geometry_item_s *mlt_geometry_item;  /**< pointer to Geometry Item object */",
  """
  GeometryItemSS {.importc:"mlt_geometry_item_s", header:"mlt_types.h", bycopy.} = object
  GeometryItem* {.importc:"mlt_geometry_item", header:"mlt_types.h", bycopy.} = object #ptr GeometryItemSS
  """),
  ("##  typedef struct mlt_profile_s *mlt_profile;              /**< pointer to Profile object */",
  """
  ProfileSS {.importc:"mlt_profile_s", header:"mlt_types.h", bycopy.} = object
  Profile* {.importc:"mlt_profile", header:"mlt_types.h", bycopy.} = object #ptr ProfileSS
  """),
  ("##  typedef struct mlt_repository_s *mlt_repository;        /**< pointer to Repository object */",
  """
  RepositorySS {.importc:"mlt_repository_s", header:"mlt_types.h", bycopy.} = object
  Repository* {.importc:"mlt_repository", header:"mlt_types.h", bycopy.}  = ptr RepositorySS
  """),
  ("##  typedef struct mlt_cache_s *mlt_cache;                  /**< pointer to Cache object */",
  """
  CacheSS {.importc:"mlt_cache_s", header:"mlt_types.h", bycopy.} = object
  Cache* {.importc:"mlt_cache", header:"mlt_types.h", bycopy.} = object #ptr CacheSS
  """),
  ("##  typedef struct mlt_cache_item_s *mlt_cache_item;        /**< pointer to CacheItem object */",
  """
  CacheItemSS {.importc:"mlt_cache_item_s", header:"mlt_types.h", bycopy.} = object
  CacheItem* {.importc:"mlt_cache_item", header:"mlt_types.h", bycopy.} = object #ptr CacheItemSS
  """),
  ("##  typedef struct mlt_animation_s *mlt_animation;          /**< pointer to Property Animation object */",
  """
  AnimationSS {.importc:"mlt_animation_s", header:"mlt_types.h", bycopy.} = object
  Animation*  {.importc:"mlt_animation", header:"mlt_types.h", bycopy.} = object #ptr AnimationSS
  """),
  ("##  typedef struct mlt_slices_s *mlt_slices;                /**< pointer to Sliced processing context object */",
  """
  SlicesSS {.importc:"mlt_slices_s", header:"mlt_types.h", bycopy.} = object
  Slices* {.importc:"mlt_slices", header:"mlt_types.h", bycopy.} = object #ptr SlicesSS
  """)

  ]

)
genFiles("mlt_version",
  comment = @[(26, 33)]
)



# Create the import/export file (to be modified manually)
var txt = ""
var files = listFiles("./")
files.sort()
for path in files:
  var (dir, name, ext) = splitFile(path)


  if ext == ".nim" and name != "gen" and name != packageName & "_includes":
    txt &= "include " & name & "\n"
    #exp &= name & ", "
  #txt &= exp


var beggining = "{.passL:\"-lmlt-7\".}\n"
beggining &= "{.passC:\"-I" & lib & "\" .}\n"
beggining &= "{.experimental: \"codeReordering\".}\n\n"
#[ beggining &= """
when defined(windows):
  const tkmath* = "TKMath.dll"
elif defined(macosx):
  const tkmath* = "libTKMath.dylib"
else:
  const tkmath* = "libTKMath.so" 


""" ]#

writeFile(packageName & "_includes.nim", beggining & txt )#& exp)
pp(packageName & "_includes.nim")