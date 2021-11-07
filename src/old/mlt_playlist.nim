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

{.deadCodeElim: on.}
when defined(windows):
  const
    libName* = "mlt.dll"
elif defined(macosx):
  const
    libName* = "libmlt.dylib"
else:
  const
    libName* = "libmlt.so"
import
  mlt_producer

## * \brief structure for returning clip information from a playlist entry
##

type
  mlt_playlist_clip_info* {.bycopy.} = object
    clip*: cint                ## *< the index of the clip within the playlist
    producer*: mlt_producer    ## *< the clip's producer (or parent producer of a cut)
    cut*: mlt_producer         ## *< the clips' cut producer
    start*: mlt_position       ## *< the time this begins relative to the beginning of the playlist
    resource*: cstring         ## *< the file name or address of the clip
    frame_in*: mlt_position    ## *< the clip's in point
    frame_out*: mlt_position   ## *< the clip's out point
    frame_count*: mlt_position ## *< the duration of the clip
    length*: mlt_position      ## *< the unedited duration of the clip
    fps*: cfloat               ## *< the frame rate of the clip
    repeat*: cint              ## *< the number of times the clip is repeated


## * Playlist Entry
##

type
  playlist_entry* = playlist_entry_s

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
##  The listener receives one argument that is the index of the entry that just completed.
##

type
  mlt_playlist_s* {.bycopy.} = object
    parent*: mlt_producer_s
    blank*: mlt_producer_s
    size*: cint
    count*: cint
    list*: ptr ptr playlist_entry


template MLT_PLAYLIST_PRODUCER*(playlist: untyped): untyped =
  (addr((playlist).parent))

template MLT_PLAYLIST_SERVICE*(playlist: untyped): untyped =
  MLT_PRODUCER_SERVICE(MLT_PLAYLIST_PRODUCER(playlist))

template MLT_PLAYLIST_PROPERTIES*(playlist: untyped): untyped =
  MLT_SERVICE_PROPERTIES(MLT_PLAYLIST_SERVICE(playlist))

proc mlt_playlist_init*(): mlt_playlist {.cdecl, importc: "mlt_playlist_init",
                                       dynlib: libName.}
proc mlt_playlist_new*(profile: mlt_profile): mlt_playlist {.cdecl,
    importc: "mlt_playlist_new", dynlib: libName.}
proc mlt_playlist_producer*(self: mlt_playlist): mlt_producer {.cdecl,
    importc: "mlt_playlist_producer", dynlib: libName.}
proc mlt_playlist_service*(self: mlt_playlist): mlt_service {.cdecl,
    importc: "mlt_playlist_service", dynlib: libName.}
proc mlt_playlist_properties*(self: mlt_playlist): mlt_properties {.cdecl,
    importc: "mlt_playlist_properties", dynlib: libName.}
proc mlt_playlist_count*(self: mlt_playlist): cint {.cdecl,
    importc: "mlt_playlist_count", dynlib: libName.}
proc mlt_playlist_clear*(self: mlt_playlist): cint {.cdecl,
    importc: "mlt_playlist_clear", dynlib: libName.}
proc mlt_playlist_append*(self: mlt_playlist; producer: mlt_producer): cint {.cdecl,
    importc: "mlt_playlist_append", dynlib: libName.}
proc mlt_playlist_append_io*(self: mlt_playlist; producer: mlt_producer;
                            `in`: mlt_position; `out`: mlt_position): cint {.cdecl,
    importc: "mlt_playlist_append_io", dynlib: libName.}
proc mlt_playlist_blank*(self: mlt_playlist; `out`: mlt_position): cint {.cdecl,
    importc: "mlt_playlist_blank", dynlib: libName.}
proc mlt_playlist_blank_time*(self: mlt_playlist; length: cstring): cint {.cdecl,
    importc: "mlt_playlist_blank_time", dynlib: libName.}
proc mlt_playlist_clip*(self: mlt_playlist; whence: mlt_whence; index: cint): mlt_position {.
    cdecl, importc: "mlt_playlist_clip", dynlib: libName.}
proc mlt_playlist_current_clip*(self: mlt_playlist): cint {.cdecl,
    importc: "mlt_playlist_current_clip", dynlib: libName.}
proc mlt_playlist_current*(self: mlt_playlist): mlt_producer {.cdecl,
    importc: "mlt_playlist_current", dynlib: libName.}
proc mlt_playlist_get_clip_info*(self: mlt_playlist;
                                info: ptr mlt_playlist_clip_info; index: cint): cint {.
    cdecl, importc: "mlt_playlist_get_clip_info", dynlib: libName.}
proc mlt_playlist_insert*(self: mlt_playlist; producer: mlt_producer; where: cint;
                         `in`: mlt_position; `out`: mlt_position): cint {.cdecl,
    importc: "mlt_playlist_insert", dynlib: libName.}
proc mlt_playlist_remove*(self: mlt_playlist; where: cint): cint {.cdecl,
    importc: "mlt_playlist_remove", dynlib: libName.}
proc mlt_playlist_move*(self: mlt_playlist; `from`: cint; to: cint): cint {.cdecl,
    importc: "mlt_playlist_move", dynlib: libName.}
proc mlt_playlist_reorder*(self: mlt_playlist; indices: ptr cint): cint {.cdecl,
    importc: "mlt_playlist_reorder", dynlib: libName.}
proc mlt_playlist_resize_clip*(self: mlt_playlist; clip: cint; `in`: mlt_position;
                              `out`: mlt_position): cint {.cdecl,
    importc: "mlt_playlist_resize_clip", dynlib: libName.}
proc mlt_playlist_repeat_clip*(self: mlt_playlist; clip: cint; repeat: cint): cint {.
    cdecl, importc: "mlt_playlist_repeat_clip", dynlib: libName.}
proc mlt_playlist_split*(self: mlt_playlist; clip: cint; position: mlt_position): cint {.
    cdecl, importc: "mlt_playlist_split", dynlib: libName.}
proc mlt_playlist_split_at*(self: mlt_playlist; position: mlt_position; left: cint): cint {.
    cdecl, importc: "mlt_playlist_split_at", dynlib: libName.}
proc mlt_playlist_join*(self: mlt_playlist; clip: cint; count: cint; merge: cint): cint {.
    cdecl, importc: "mlt_playlist_join", dynlib: libName.}
proc mlt_playlist_mix*(self: mlt_playlist; clip: cint; length: cint;
                      transition: mlt_transition): cint {.cdecl,
    importc: "mlt_playlist_mix", dynlib: libName.}
proc mlt_playlist_mix_in*(self: mlt_playlist; clip: cint; length: cint): cint {.cdecl,
    importc: "mlt_playlist_mix_in", dynlib: libName.}
proc mlt_playlist_mix_out*(self: mlt_playlist; clip: cint; length: cint): cint {.cdecl,
    importc: "mlt_playlist_mix_out", dynlib: libName.}
proc mlt_playlist_mix_add*(self: mlt_playlist; clip: cint; transition: mlt_transition): cint {.
    cdecl, importc: "mlt_playlist_mix_add", dynlib: libName.}
proc mlt_playlist_get_clip*(self: mlt_playlist; clip: cint): mlt_producer {.cdecl,
    importc: "mlt_playlist_get_clip", dynlib: libName.}
proc mlt_playlist_get_clip_at*(self: mlt_playlist; position: mlt_position): mlt_producer {.
    cdecl, importc: "mlt_playlist_get_clip_at", dynlib: libName.}
proc mlt_playlist_get_clip_index_at*(self: mlt_playlist; position: mlt_position): cint {.
    cdecl, importc: "mlt_playlist_get_clip_index_at", dynlib: libName.}
proc mlt_playlist_clip_is_mix*(self: mlt_playlist; clip: cint): cint {.cdecl,
    importc: "mlt_playlist_clip_is_mix", dynlib: libName.}
proc mlt_playlist_consolidate_blanks*(self: mlt_playlist; keep_length: cint) {.cdecl,
    importc: "mlt_playlist_consolidate_blanks", dynlib: libName.}
proc mlt_playlist_is_blank*(self: mlt_playlist; clip: cint): cint {.cdecl,
    importc: "mlt_playlist_is_blank", dynlib: libName.}
proc mlt_playlist_is_blank_at*(self: mlt_playlist; position: mlt_position): cint {.
    cdecl, importc: "mlt_playlist_is_blank_at", dynlib: libName.}
proc mlt_playlist_insert_blank*(self: mlt_playlist; clip: cint; `out`: cint) {.cdecl,
    importc: "mlt_playlist_insert_blank", dynlib: libName.}
proc mlt_playlist_pad_blanks*(self: mlt_playlist; position: mlt_position;
                             length: cint; find: cint) {.cdecl,
    importc: "mlt_playlist_pad_blanks", dynlib: libName.}
proc mlt_playlist_replace_with_blank*(self: mlt_playlist; clip: cint): mlt_producer {.
    cdecl, importc: "mlt_playlist_replace_with_blank", dynlib: libName.}
proc mlt_playlist_insert_at*(self: mlt_playlist; position: mlt_position;
                            producer: mlt_producer; mode: cint): cint {.cdecl,
    importc: "mlt_playlist_insert_at", dynlib: libName.}
proc mlt_playlist_clip_start*(self: mlt_playlist; clip: cint): cint {.cdecl,
    importc: "mlt_playlist_clip_start", dynlib: libName.}
proc mlt_playlist_clip_length*(self: mlt_playlist; clip: cint): cint {.cdecl,
    importc: "mlt_playlist_clip_length", dynlib: libName.}
proc mlt_playlist_blanks_from*(self: mlt_playlist; clip: cint; bounded: cint): cint {.
    cdecl, importc: "mlt_playlist_blanks_from", dynlib: libName.}
proc mlt_playlist_remove_region*(self: mlt_playlist; position: mlt_position;
                                length: cint): cint {.cdecl,
    importc: "mlt_playlist_remove_region", dynlib: libName.}
proc mlt_playlist_move_region*(self: mlt_playlist; position: mlt_position;
                              length: cint; new_position: cint): cint {.cdecl,
    importc: "mlt_playlist_move_region", dynlib: libName.}
proc mlt_playlist_close*(self: mlt_playlist) {.cdecl, importc: "mlt_playlist_close",
    dynlib: libName.}