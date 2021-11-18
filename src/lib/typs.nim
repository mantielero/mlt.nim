import ../wrapper/mlt

type
  Consumer*   = mlt_consumer 
  Repository* = mlt_repository 
  Profile*    = mlt_profile
  Service*    = mlt_service
  Filter*     = mlt_filter
  Properties* = mlt_properties
  Playlist*   = mlt_playlist
  Position*   = mlt_position
  Transition* = mlt_transition
  Tractor*    = mlt_tractor
  Field*      = mlt_field
  Multitrack* = mlt_multitrack

  #Producer*   = mlt_producer
  Producer* = object
    data*: mlt_producer   # where: mlt_producer* {.importc, impmltHdr.} = ptr mlt_producer_s

proc `=destroy`*(p: var Producer) =
  if not p.data.isNil:
    echo "destroying producer"
    p.data.mlt_producer_close
    
    #p.data.close = nil
    #c_producer_close(p.self)
  else:
    echo "=destroy nil"