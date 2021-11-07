## *
##  \file mlt_deque.h
##  \brief double ended queue
##  \see mlt_deque_s
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
  mlt_types

## * The callback function used to compare items for insert sort.
##
##  \public \memberof mlt_deque_s
##  \param a the first object
##  \param b the second object
##  \returns 0 if equal, < 0 if a < b, or > 0 if a > b
##

type
  mlt_deque_compare* = proc (a: pointer; b: pointer): cint {.cdecl.}

proc mlt_deque_init*(): mlt_deque {.cdecl, importc: "mlt_deque_init", dynlib: libName.}
proc mlt_deque_count*(self: mlt_deque): cint {.cdecl, importc: "mlt_deque_count",
    dynlib: libName.}
proc mlt_deque_push_back*(self: mlt_deque; item: pointer): cint {.cdecl,
    importc: "mlt_deque_push_back", dynlib: libName.}
proc mlt_deque_pop_back*(self: mlt_deque): pointer {.cdecl,
    importc: "mlt_deque_pop_back", dynlib: libName.}
proc mlt_deque_push_front*(self: mlt_deque; item: pointer): cint {.cdecl,
    importc: "mlt_deque_push_front", dynlib: libName.}
proc mlt_deque_pop_front*(self: mlt_deque): pointer {.cdecl,
    importc: "mlt_deque_pop_front", dynlib: libName.}
proc mlt_deque_peek_back*(self: mlt_deque): pointer {.cdecl,
    importc: "mlt_deque_peek_back", dynlib: libName.}
proc mlt_deque_peek_front*(self: mlt_deque): pointer {.cdecl,
    importc: "mlt_deque_peek_front", dynlib: libName.}
proc mlt_deque_peek*(self: mlt_deque; index: cint): pointer {.cdecl,
    importc: "mlt_deque_peek", dynlib: libName.}
proc mlt_deque_insert*(self: mlt_deque; item: pointer; a3: mlt_deque_compare): cint {.
    cdecl, importc: "mlt_deque_insert", dynlib: libName.}
proc mlt_deque_push_back_int*(self: mlt_deque; item: cint): cint {.cdecl,
    importc: "mlt_deque_push_back_int", dynlib: libName.}
proc mlt_deque_pop_back_int*(self: mlt_deque): cint {.cdecl,
    importc: "mlt_deque_pop_back_int", dynlib: libName.}
proc mlt_deque_push_front_int*(self: mlt_deque; item: cint): cint {.cdecl,
    importc: "mlt_deque_push_front_int", dynlib: libName.}
proc mlt_deque_pop_front_int*(self: mlt_deque): cint {.cdecl,
    importc: "mlt_deque_pop_front_int", dynlib: libName.}
proc mlt_deque_peek_back_int*(self: mlt_deque): cint {.cdecl,
    importc: "mlt_deque_peek_back_int", dynlib: libName.}
proc mlt_deque_peek_front_int*(self: mlt_deque): cint {.cdecl,
    importc: "mlt_deque_peek_front_int", dynlib: libName.}
proc mlt_deque_push_back_double*(self: mlt_deque; item: cdouble): cint {.cdecl,
    importc: "mlt_deque_push_back_double", dynlib: libName.}
proc mlt_deque_pop_back_double*(self: mlt_deque): cdouble {.cdecl,
    importc: "mlt_deque_pop_back_double", dynlib: libName.}
proc mlt_deque_push_front_double*(self: mlt_deque; item: cdouble): cint {.cdecl,
    importc: "mlt_deque_push_front_double", dynlib: libName.}
proc mlt_deque_pop_front_double*(self: mlt_deque): cdouble {.cdecl,
    importc: "mlt_deque_pop_front_double", dynlib: libName.}
proc mlt_deque_peek_back_double*(self: mlt_deque): cdouble {.cdecl,
    importc: "mlt_deque_peek_back_double", dynlib: libName.}
proc mlt_deque_peek_front_double*(self: mlt_deque): cdouble {.cdecl,
    importc: "mlt_deque_peek_front_double", dynlib: libName.}
proc mlt_deque_close*(self: mlt_deque) {.cdecl, importc: "mlt_deque_close",
                                      dynlib: libName.}