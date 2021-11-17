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

  Producer*   = mlt_producer
  #Producer* = object
  #  self: mlt_producer   # where: mlt_producer* {.importc, impmltHdr.} = ptr mlt_producer_s