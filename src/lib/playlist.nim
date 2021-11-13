#[
to organise producers in playlists.    
]#
import ../wrapper/mlt
import typs, os, std/strformat

proc newPlaylist*():Playlist = 
  mlt_playlist_init()

proc append*(self: Playlist; producer: Producer) =
  let res = mlt_playlist_append( self,  producer )
  if res > 0:
    quit("""unable to append producer to the playlist""")

proc close*(self:Playlist) =
  mlt_playlist_close(self)




#[

proc mlt_playlist_new*(profile: mlt_profile): mlt_playlist
proc mlt_playlist_producer*(self: mlt_playlist): mlt_producer
proc mlt_playlist_service*(self: mlt_playlist): mlt_service
proc mlt_playlist_properties*(self: mlt_playlist): mlt_properties
proc mlt_playlist_count*(self: mlt_playlist): cint
proc mlt_playlist_clear*(self: mlt_playlist): cint

proc mlt_playlist_append_io*(self: mlt_playlist; producer: mlt_producer;
                             `in`: mlt_position; `out`: mlt_position): cint
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
proc mlt_playlist_mix*(self: mlt_playlist; clip: cint; length: cint;
                       transition: mlt_transition): cint
proc mlt_playlist_mix_in*(self: mlt_playlist; clip: cint; length: cint): cint
proc mlt_playlist_mix_out*(self: mlt_playlist; clip: cint; length: cint): cint
proc mlt_playlist_mix_add*(self: mlt_playlist; clip: cint;
                           transition: mlt_transition): cint
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