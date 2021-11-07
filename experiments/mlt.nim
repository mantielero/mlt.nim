{.passL:"-lmlt-7".}

when defined(windows):
  const mltlib* = "libmlt-7.dll"
elif defined(macosx):
  const mltlib* = "libmlt-7.dylib"
else:
  const mltlib* = "libmlt-7.so" 


#[ type
  MltProperty*  = object
  MltKeyframeType* = object
  mltAnimationItemS* = object
  MltAnimation* = object ]#


include wrapper/mlt_includes