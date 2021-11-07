## *
##  \file mlt_playlist.h
##  \brief playlist service class
##  \see mlt_playlist_s
##
##  Copyright (C) 2003-2014 Meltytech, LLC
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

## * \brief structure for returning clip information from a playlist entry
##

type
  PlaylistClipInfo* {.importc: "mlt_playlist_clip_info", header: "mlt_playlist.h",
                     bycopy.} = object
    clip* {.importc: "clip".}: cint ## *< the index of the clip within the playlist
    producer* {.importc: "producer".}: Producer ## *< the clip's producer (or parent producer of a cut)
    cut* {.importc: "cut".}: Producer ## *< the clips' cut producer
    start* {.importc: "start".}: Position ## *< the time this begins relative to the beginning of the playlist
    resource* {.importc: "resource".}: cstring ## *< the file name or address of the clip
    frameIn* {.importc: "frame_in".}: Position ## *< the clip's in point
    frameOut* {.importc: "frame_out".}: Position ## *< the clip's out point
    frameCount* {.importc: "frame_count".}: Position ## *< the duration of the clip
    length* {.importc: "length".}: Position ## *< the unedited duration of the clip
    fps* {.importc: "fps".}: cfloat ## *< the frame rate of the clip
    repeat* {.importc: "repeat".}: cint ## *< the number of times the clip is repeated


## * Playlist Entry
##

type
  PlaylistEntry* {.importc:"playlist_entry_s",header:"mlt_playlist.h", bycopy.} = object

## * \brief Playlist class
##
##  A playlist is a sequential container of producers and blank spaces. The class provides all
##  sorts of playlist assembly and manipulation routines. A playlist is also a producer within
##  the framework.
##
##  \extends mlt_producer_s
##  \properties \em autoclose Set this true if you are doing sequential processing and want to
##  automatically close producers as they are finished being used to free resources.
##  \properties \em meta.fx_cut Set true on a producer to indicate that it is a "fx_cut,"
##  which is a way to add filters as a playlist entry - useful only in a multitrack. See FxCut on the wiki.
##  \properties \em mix_in
##  \properties \em mix_out
##  \properties \em hide Set to 1 to hide the video (make it an audio-only track),
##  2 to hide the audio (make it a video-only track), or 3 to hide audio and video (hidden track).
##  This property only applies when using a multitrack or transition.
##  \event \em playlist-next The playlist fires this when it moves to the next item in the list.
##    The event data is an integer of the index of the entry that just completed.
##

type
  PlaylistS* {.importc: "mlt_playlist_s", header: "mlt_playlist.h", bycopy.} = object
    parent* {.importc: "parent".}: ProducerS
    blank* {.importc: "blank".}: ProducerS
    size* {.importc: "size".}: cint
    count* {.importc: "count".}: cint
    list* {.importc: "list".}: ptr ptr PlaylistEntry


template mlt_Playlist_Producer*(playlist: untyped): untyped =
  (addr((playlist).parent))

template mlt_Playlist_Service*(playlist: untyped): untyped =
  mlt_Producer_Service(mlt_Playlist_Producer(playlist))

template mlt_Playlist_Properties*(playlist: untyped): untyped =
  mlt_Service_Properties(mlt_Playlist_Service(playlist))

proc playlistInit*(): Playlist {.cdecl, importc: "mlt_playlist_init", dynlib: mltlib.}
proc playlistNew*(profile: Profile): Playlist {.cdecl, importc: "mlt_playlist_new",
    dynlib: mltlib.}
proc playlistProducer*(self: Playlist): Producer {.cdecl,
    importc: "mlt_playlist_producer", dynlib: mltlib.}
proc playlistService*(self: Playlist): Service {.cdecl,
    importc: "mlt_playlist_service", dynlib: mltlib.}
proc playlistProperties*(self: Playlist): Properties {.cdecl,
    importc: "mlt_playlist_properties", dynlib: mltlib.}
proc playlistCount*(self: Playlist): cint {.cdecl, importc: "mlt_playlist_count",
                                        dynlib: mltlib.}
proc playlistClear*(self: Playlist): cint {.cdecl, importc: "mlt_playlist_clear",
                                        dynlib: mltlib.}
proc playlistAppend*(self: Playlist; producer: Producer): cint {.cdecl,
    importc: "mlt_playlist_append", dynlib: mltlib.}
proc playlistAppendIo*(self: Playlist; producer: Producer; `in`: Position;
                      `out`: Position): cint {.cdecl,
    importc: "mlt_playlist_append_io", dynlib: mltlib.}
proc playlistBlank*(self: Playlist; `out`: Position): cint {.cdecl,
    importc: "mlt_playlist_blank", dynlib: mltlib.}
proc playlistBlankTime*(self: Playlist; length: cstring): cint {.cdecl,
    importc: "mlt_playlist_blank_time", dynlib: mltlib.}
proc playlistClip*(self: Playlist; whence: Whence; index: cint): Position {.cdecl,
    importc: "mlt_playlist_clip", dynlib: mltlib.}
proc playlistCurrentClip*(self: Playlist): cint {.cdecl,
    importc: "mlt_playlist_current_clip", dynlib: mltlib.}
proc playlistCurrent*(self: Playlist): Producer {.cdecl,
    importc: "mlt_playlist_current", dynlib: mltlib.}
proc playlistGetClipInfo*(self: Playlist; info: ptr PlaylistClipInfo; index: cint): cint {.
    cdecl, importc: "mlt_playlist_get_clip_info", dynlib: mltlib.}
proc playlistInsert*(self: Playlist; producer: Producer; where: cint; `in`: Position;
                    `out`: Position): cint {.cdecl, importc: "mlt_playlist_insert",
    dynlib: mltlib.}
proc playlistRemove*(self: Playlist; where: cint): cint {.cdecl,
    importc: "mlt_playlist_remove", dynlib: mltlib.}
proc playlistMove*(self: Playlist; `from`: cint; to: cint): cint {.cdecl,
    importc: "mlt_playlist_move", dynlib: mltlib.}
proc playlistReorder*(self: Playlist; indices: ptr cint): cint {.cdecl,
    importc: "mlt_playlist_reorder", dynlib: mltlib.}
proc playlistResizeClip*(self: Playlist; clip: cint; `in`: Position; `out`: Position): cint {.
    cdecl, importc: "mlt_playlist_resize_clip", dynlib: mltlib.}
proc playlistRepeatClip*(self: Playlist; clip: cint; repeat: cint): cint {.cdecl,
    importc: "mlt_playlist_repeat_clip", dynlib: mltlib.}
proc playlistSplit*(self: Playlist; clip: cint; position: Position): cint {.cdecl,
    importc: "mlt_playlist_split", dynlib: mltlib.}
proc playlistSplitAt*(self: Playlist; position: Position; left: cint): cint {.cdecl,
    importc: "mlt_playlist_split_at", dynlib: mltlib.}
proc playlistJoin*(self: Playlist; clip: cint; count: cint; merge: cint): cint {.cdecl,
    importc: "mlt_playlist_join", dynlib: mltlib.}
proc playlistMix*(self: Playlist; clip: cint; length: cint; transition: Transition): cint {.
    cdecl, importc: "mlt_playlist_mix", dynlib: mltlib.}
proc playlistMixIn*(self: Playlist; clip: cint; length: cint): cint {.cdecl,
    importc: "mlt_playlist_mix_in", dynlib: mltlib.}
proc playlistMixOut*(self: Playlist; clip: cint; length: cint): cint {.cdecl,
    importc: "mlt_playlist_mix_out", dynlib: mltlib.}
proc playlistMixAdd*(self: Playlist; clip: cint; transition: Transition): cint {.cdecl,
    importc: "mlt_playlist_mix_add", dynlib: mltlib.}
proc playlistGetClip*(self: Playlist; clip: cint): Producer {.cdecl,
    importc: "mlt_playlist_get_clip", dynlib: mltlib.}
proc playlistGetClipAt*(self: Playlist; position: Position): Producer {.cdecl,
    importc: "mlt_playlist_get_clip_at", dynlib: mltlib.}
proc playlistGetClipIndexAt*(self: Playlist; position: Position): cint {.cdecl,
    importc: "mlt_playlist_get_clip_index_at", dynlib: mltlib.}
proc playlistClipIsMix*(self: Playlist; clip: cint): cint {.cdecl,
    importc: "mlt_playlist_clip_is_mix", dynlib: mltlib.}
proc playlistConsolidateBlanks*(self: Playlist; keepLength: cint) {.cdecl,
    importc: "mlt_playlist_consolidate_blanks", dynlib: mltlib.}
proc playlistIsBlank*(self: Playlist; clip: cint): cint {.cdecl,
    importc: "mlt_playlist_is_blank", dynlib: mltlib.}
proc playlistIsBlankAt*(self: Playlist; position: Position): cint {.cdecl,
    importc: "mlt_playlist_is_blank_at", dynlib: mltlib.}
proc playlistInsertBlank*(self: Playlist; clip: cint; `out`: cint) {.cdecl,
    importc: "mlt_playlist_insert_blank", dynlib: mltlib.}
proc playlistPadBlanks*(self: Playlist; position: Position; length: cint; find: cint) {.
    cdecl, importc: "mlt_playlist_pad_blanks", dynlib: mltlib.}
proc playlistReplaceWithBlank*(self: Playlist; clip: cint): Producer {.cdecl,
    importc: "mlt_playlist_replace_with_blank", dynlib: mltlib.}
proc playlistInsertAt*(self: Playlist; position: Position; producer: Producer;
                      mode: cint): cint {.cdecl, importc: "mlt_playlist_insert_at",
                                       dynlib: mltlib.}
proc playlistClipStart*(self: Playlist; clip: cint): cint {.cdecl,
    importc: "mlt_playlist_clip_start", dynlib: mltlib.}
proc playlistClipLength*(self: Playlist; clip: cint): cint {.cdecl,
    importc: "mlt_playlist_clip_length", dynlib: mltlib.}
proc playlistBlanksFrom*(self: Playlist; clip: cint; bounded: cint): cint {.cdecl,
    importc: "mlt_playlist_blanks_from", dynlib: mltlib.}
proc playlistRemoveRegion*(self: Playlist; position: Position; length: cint): cint {.
    cdecl, importc: "mlt_playlist_remove_region", dynlib: mltlib.}
proc playlistClose*(self: Playlist) {.cdecl, importc: "mlt_playlist_close",
                                   dynlib: mltlib.}