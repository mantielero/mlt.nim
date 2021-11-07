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

proc cacheItemData*(item: CacheItem; size: ptr cint): pointer {.cdecl,
    importc: "mlt_cache_item_data", dynlib: mltlib.}
proc cacheItemClose*(item: CacheItem) {.cdecl, importc: "mlt_cache_item_close",
                                     dynlib: mltlib.}
proc cacheInit*(): Cache {.cdecl, importc: "mlt_cache_init", dynlib: mltlib.}
proc cacheSetSize*(cache: Cache; size: cint) {.cdecl, importc: "mlt_cache_set_size",
    dynlib: mltlib.}
proc cacheGetSize*(cache: Cache): cint {.cdecl, importc: "mlt_cache_get_size",
                                     dynlib: mltlib.}
proc cacheClose*(cache: Cache) {.cdecl, importc: "mlt_cache_close", dynlib: mltlib.}
proc cachePurge*(cache: Cache; `object`: pointer) {.cdecl, importc: "mlt_cache_purge",
    dynlib: mltlib.}
proc cachePut*(cache: Cache; `object`: pointer; data: pointer; size: cint;
              destructor: Destructor) {.cdecl, importc: "mlt_cache_put",
                                      dynlib: mltlib.}
proc cacheGet*(cache: Cache; `object`: pointer): CacheItem {.cdecl,
    importc: "mlt_cache_get", dynlib: mltlib.}
proc cachePutFrame*(cache: Cache; frame: Frame) {.cdecl,
    importc: "mlt_cache_put_frame", dynlib: mltlib.}
proc cacheGetFrame*(cache: Cache; position: Position): Frame {.cdecl,
    importc: "mlt_cache_get_frame", dynlib: mltlib.}