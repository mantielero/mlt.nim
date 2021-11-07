## *
##  \file mlt_pool.h
##  \brief memory pooling functionality
##  \see mlt_pool_s
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

proc poolInit*() {.cdecl, importc: "mlt_pool_init", dynlib: mltlib.}
proc poolAlloc*(size: cint): pointer {.cdecl, importc: "mlt_pool_alloc", dynlib: mltlib.}
proc poolRealloc*(`ptr`: pointer; size: cint): pointer {.cdecl,
    importc: "mlt_pool_realloc", dynlib: mltlib.}
proc poolRelease*(release: pointer) {.cdecl, importc: "mlt_pool_release",
                                   dynlib: mltlib.}
proc poolPurge*() {.cdecl, importc: "mlt_pool_purge", dynlib: mltlib.}
proc poolClose*() {.cdecl, importc: "mlt_pool_close", dynlib: mltlib.}
proc poolStat*() {.cdecl, importc: "mlt_pool_stat", dynlib: mltlib.}