##
##  \file mlt_luma_map.h
##  \brief functions to generate and read luma-wipe transition maps
##
##  Copyright (C) 2003-2019 Meltytech, LLC
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

type
  LumaMapS* {.importc: "mlt_luma_map_s", header: "mlt_luma_map.h", bycopy.} = object
    `type`* {.importc: "type".}: cint
    w* {.importc: "w".}: cint
    h* {.importc: "h".}: cint
    bands* {.importc: "bands".}: cint
    rband* {.importc: "rband".}: cint
    vmirror* {.importc: "vmirror".}: cint
    hmirror* {.importc: "hmirror".}: cint
    dmirror* {.importc: "dmirror".}: cint
    invert* {.importc: "invert".}: cint
    offset* {.importc: "offset".}: cint
    flip* {.importc: "flip".}: cint
    flop* {.importc: "flop".}: cint
    pflip* {.importc: "pflip".}: cint
    pflop* {.importc: "pflop".}: cint
    quart* {.importc: "quart".}: cint
    rotate* {.importc: "rotate".}: cint

  LumaMap* = ptr LumaMapS

proc lumaMapInit*(self: LumaMap) {.cdecl, importc: "mlt_luma_map_init", dynlib: mltlib.}
proc lumaMapNew*(path: cstring): LumaMap {.cdecl, importc: "mlt_luma_map_new",
                                       dynlib: mltlib.}
proc lumaMapRender*(self: LumaMap): ptr uint16 {.cdecl,
    importc: "mlt_luma_map_render", dynlib: mltlib.}
proc lumaMapFromPgm*(filename: cstring; map: ptr ptr uint16; width: ptr cint;
                    height: ptr cint): cint {.cdecl,
    importc: "mlt_luma_map_from_pgm", dynlib: mltlib.}
proc lumaMapFromYuv422*(image: ptr uint8; map: ptr ptr uint16; width: cint; height: cint) {.
    cdecl, importc: "mlt_luma_map_from_yuv422", dynlib: mltlib.}