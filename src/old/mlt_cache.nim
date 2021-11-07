## *
##  \file mlt_cache.h
##  \brief least recently used cache
##  \see mlt_cache_s
##
##  Copyright (C) 2007-2014 Meltytech, LLC
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
  mlt_types

proc mlt_cache_item_data*(item: mlt_cache_item; size: ptr cint): pointer {.cdecl,
    importc: "mlt_cache_item_data", dynlib: libName.}
proc mlt_cache_item_close*(item: mlt_cache_item) {.cdecl,
    importc: "mlt_cache_item_close", dynlib: libName.}
proc mlt_cache_init*(): mlt_cache {.cdecl, importc: "mlt_cache_init", dynlib: libName.}
proc mlt_cache_set_size*(cache: mlt_cache; size: cint) {.cdecl,
    importc: "mlt_cache_set_size", dynlib: libName.}
proc mlt_cache_get_size*(cache: mlt_cache): cint {.cdecl,
    importc: "mlt_cache_get_size", dynlib: libName.}
proc mlt_cache_close*(cache: mlt_cache) {.cdecl, importc: "mlt_cache_close",
                                       dynlib: libName.}
proc mlt_cache_purge*(cache: mlt_cache; `object`: pointer) {.cdecl,
    importc: "mlt_cache_purge", dynlib: libName.}
proc mlt_cache_put*(cache: mlt_cache; `object`: pointer; data: pointer; size: cint;
                   destructor: mlt_destructor) {.cdecl, importc: "mlt_cache_put",
    dynlib: libName.}
proc mlt_cache_get*(cache: mlt_cache; `object`: pointer): mlt_cache_item {.cdecl,
    importc: "mlt_cache_get", dynlib: libName.}
proc mlt_cache_put_frame*(cache: mlt_cache; frame: mlt_frame) {.cdecl,
    importc: "mlt_cache_put_frame", dynlib: libName.}
proc mlt_cache_get_frame*(cache: mlt_cache; position: mlt_position): mlt_frame {.
    cdecl, importc: "mlt_cache_get_frame", dynlib: libName.}