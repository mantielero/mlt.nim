#[
to organise producers in playlists.    
]#
import ../wrapper/mlt, producer, consumer
import typs, factory
import os, std/strformat

proc newPlaylist*():Playlist = 
  result.data = mlt_playlist_init()

proc append*(self:Playlist; producer: Producer) =
  let res = mlt_playlist_append( self.data,  producer.data )
  if res > 0:
    quit("""unable to append producer to the playlist""")


proc append*(self:Playlist; producer: Producer; `in`, `out`:int) =  
  let res = mlt_playlist_append_io(self.data, producer.data, `in`.cint, `out`.cint)
  if res > 0:
    quit("""unable to append producer to the playlist""")


proc add*(self:Playlist; profile:Profile; resource:string) =
  var clip = newFactoryProducer(profile, resource)
  self.append(clip)
  #close(clip)

proc add*(self:Playlist; profile:Profile; resource:string; `in`, `out`:int) =
  var clip = newFactoryProducer(profile, resource)
  self.append(clip, `in`, `out`)
  #close(clip)


proc close*(self:Playlist) =
  mlt_playlist_close(self.data)

converter toProducer*(self:Playlist):Producer =
  #result:Producer
  result.data = mlt_playlist_producer(self.data)
  #return tmp

proc connect*(self:Consumer; pl:Playlist) =
  connect(self, pl.toProducer.toService)

proc `>`*(pl:Playlist; c:Consumer) =
  connect(c,pl)


# Transitions

proc mix*(self:Playlist; clip, length:int; trn: Transition) =
  let res = mlt_playlist_mix(self.data, clip.cint, length.cint, trn.data)
  if res > 0:
    quit("""unable to apply transition to playlist""")

proc count*(self:Playlist):int =
  mlt_playlist_count(self.data).int


#[

proc mlt_playlist_mix_in*(self: mlt_playlist; clip: cint; length: cint): cint
proc mlt_playlist_mix_out*(self: mlt_playlist; clip: cint; length: cint): cint
proc mlt_playlist_mix_add*(self: mlt_playlist; clip: cint;
                           transition: mlt_transition): cint
]#


#[

proc mlt_playlist_new*(profile: mlt_profile): mlt_playlist
proc mlt_playlist_producer*(self: mlt_playlist): mlt_producer
proc mlt_playlist_service*(self: mlt_playlist): mlt_service
proc mlt_playlist_properties*(self: mlt_playlist): mlt_properties

proc mlt_playlist_clear*(self: mlt_playlist): cint


proc mlt_playlist_blank*(self: mlt_playlist; `out`: mlt_position): cint
proc mlt_playlist_blank_time*(self: mlt_playlist; length: cstring): cint
proc mlt_playlist_clip*(self: mlt_playlist; whence: mlt_whence; index: cint): mlt_position
proc mlt_playlist_current_clip*(self: mlt_playlist): cint
proc mlt_playlist_current*(self: mlt_playlist): mlt_producer
proc mlt_playlist_get_clip_info*(self: mlt_playlist;
                                 info: ptr mlt_playlist_clip_info; index: cint): cint
proc mlt_playlist_insert*(self: mlt_playlist; producer: mlt_producer;
                          where: cint; `in`: mlt_position; `out`: mlt_position): cint
proc mlt_playlist_remove*(self: mlt_playlist; where: cint): cint
proc mlt_playlist_move*(self: mlt_playlist; `from`: cint; to: cint): cint
proc mlt_playlist_reorder*(self: mlt_playlist; indices: ptr cint): cint
proc mlt_playlist_resize_clip*(self: mlt_playlist; clip: cint;
                               `in`: mlt_position; `out`: mlt_position): cint
proc mlt_playlist_repeat_clip*(self: mlt_playlist; clip: cint; repeat: cint): cint
proc mlt_playlist_split*(self: mlt_playlist; clip: cint; position: mlt_position): cint
proc mlt_playlist_split_at*(self: mlt_playlist; position: mlt_position;
                            left: cint): cint
proc mlt_playlist_join*(self: mlt_playlist; clip: cint; count: cint; merge: cint): cint



proc mlt_playlist_get_clip*(self: mlt_playlist; clip: cint): mlt_producer
proc mlt_playlist_get_clip_at*(self: mlt_playlist; position: mlt_position): mlt_producer
proc mlt_playlist_get_clip_index_at*(self: mlt_playlist; position: mlt_position): cint
proc mlt_playlist_clip_is_mix*(self: mlt_playlist; clip: cint): cint
proc mlt_playlist_consolidate_blanks*(self: mlt_playlist; keep_length: cint)
proc mlt_playlist_is_blank*(self: mlt_playlist; clip: cint): cint
proc mlt_playlist_is_blank_at*(self: mlt_playlist; position: mlt_position): cint
proc mlt_playlist_insert_blank*(self: mlt_playlist; clip: cint; `out`: cint)
proc mlt_playlist_pad_blanks*(self: mlt_playlist; position: mlt_position;
                              length: cint; find: cint)
proc mlt_playlist_replace_with_blank*(self: mlt_playlist; clip: cint): mlt_producer
proc mlt_playlist_insert_at*(self: mlt_playlist; position: mlt_position;
                             producer: mlt_producer; mode: cint): cint
proc mlt_playlist_clip_start*(self: mlt_playlist; clip: cint): cint
proc mlt_playlist_clip_length*(self: mlt_playlist; clip: cint): cint
proc mlt_playlist_blanks_from*(self: mlt_playlist; clip: cint; bounded: cint): cint
proc mlt_playlist_remove_region*(self: mlt_playlist; position: mlt_position;
                                 length: cint): cint

]#