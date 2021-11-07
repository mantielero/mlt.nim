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
proc mlt_pool_init*() {.cdecl, importc: "mlt_pool_init", dynlib: libName.}
proc mlt_pool_alloc*(size: cint): pointer {.cdecl, importc: "mlt_pool_alloc",
                                        dynlib: libName.}
proc mlt_pool_realloc*(`ptr`: pointer; size: cint): pointer {.cdecl,
    importc: "mlt_pool_realloc", dynlib: libName.}
proc mlt_pool_release*(release: pointer) {.cdecl, importc: "mlt_pool_release",
                                        dynlib: libName.}
proc mlt_pool_purge*() {.cdecl, importc: "mlt_pool_purge", dynlib: libName.}
proc mlt_pool_close*() {.cdecl, importc: "mlt_pool_close", dynlib: libName.}
proc mlt_pool_stat*() {.cdecl, importc: "mlt_pool_stat", dynlib: libName.}