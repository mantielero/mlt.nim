import ../wrapper/mlt

type
  Profile* = object
    data*: mlt_profile

  Producer* = object
    data*: mlt_producer   # where: mlt_producer* {.importc, impmltHdr.} = ptr mlt_producer_s

  Consumer* = object
    data*: mlt_consumer

  Repository* = object
    data*: mlt_repository

  Properties* = object
    data*: mlt_properties

  Service* = object
    data*: mlt_service

  Filter* = object
    data*: mlt_filter

  Frame* = object
    data*: mlt_frame

  Playlist* = object
    data*: mlt_playlist

  Transition* = object
    data*: mlt_transition



  Tractor* = object
    data*: mlt_tractor

  Field* = object
    data*: mlt_field

  Multitrack* = object
    data*: mlt_multitrack

  Event* = object
    data*: mlt_event

  Position* = mlt_position
  #  data*: mlt_position

  # CUSTOM API
#[   NLE* = object
    repo*: Repository
    currentProfile*: Profile
    consumers*: seq[Consumer]
    producers*: seq[Producer] ]#




#[ proc `=destroy`*(p: var Producer) =
  if not p.data.isNil:
    echo "destroying producer"
    p.data.mlt_producer_close
    
    #p.data.close = nil
    #c_producer_close(p.self)
  else:
    echo "Producer trying to destroy nil" ]#

#[ proc `=destroy`*(c: var Consumer) =
  if not c.data.isNil:
    echo "destroying consumer"
    c.data.mlt_consumer_close
    
    #p.data.close = nil
    #c_producer_close(p.self)
  else:
    echo "=destroy nil"
 ]#
proc `=destroy`*(p: var Repository) =
  if not p.data.isNil:
  #  echo "destroying Repository"
    #p.data.mlt_producer_close
    mlt_factory_close()
    
    #p.data.close = nil
    #c_producer_close(p.self)
  #else:
  #  echo "=destroy nil"

#[ proc `=destroy`*(c: var Properties) =
  if not c.data.isNil:
    echo "destroying properties"
    c.data.mlt_properties_close
    
    #p.data.close = nil
    #c_producer_close(p.self)
  else:
    echo "=destroy nil" ]#

#[ proc `=destroy`*(c: var Event) =
  if not c.data.isNil:
    echo "destroying event"
    c.data.mlt_event_close
    
    #p.data.close = nil
    #c_producer_close(p.self)
  else:
    echo "=destroy nil" ]#

#[ proc `=destroy`*(c: var Profile) =
  if not c.data.isNil:
    echo "destroying profile"
    c.data.mlt_profile_close
    
    #p.data.close = nil
    #c_producer_close(p.self)
  else:
    echo "=destroy nil" ]#

#[ proc `=destroy`*(c: var Playlist) =
  if not c.data.isNil:
    echo "destroying profile"
    c.data.mlt_playlist_close
    
    #p.data.close = nil
    #c_producer_close(p.self)
  else:
    echo "=destroy nil" ]#