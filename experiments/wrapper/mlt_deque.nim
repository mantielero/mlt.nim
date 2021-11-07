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

## * The callback function used to compare items for insert sort.
##
##  \public \memberof mlt_deque_s
##  \param a the first object
##  \param b the second object
##  \returns 0 if equal, < 0 if a < b, or > 0 if a > b
##

type
  DequeCompare* = proc (a: pointer; b: pointer): cint {.cdecl.}

proc dequeInit*(): Deque {.cdecl, importc: "mlt_deque_init", dynlib: mltlib.}
proc dequeCount*(self: Deque): cint {.cdecl, importc: "mlt_deque_count", dynlib: mltlib.}
proc dequePushBack*(self: Deque; item: pointer): cint {.cdecl,
    importc: "mlt_deque_push_back", dynlib: mltlib.}
proc dequePopBack*(self: Deque): pointer {.cdecl, importc: "mlt_deque_pop_back",
                                       dynlib: mltlib.}
proc dequePushFront*(self: Deque; item: pointer): cint {.cdecl,
    importc: "mlt_deque_push_front", dynlib: mltlib.}
proc dequePopFront*(self: Deque): pointer {.cdecl, importc: "mlt_deque_pop_front",
                                        dynlib: mltlib.}
proc dequePeekBack*(self: Deque): pointer {.cdecl, importc: "mlt_deque_peek_back",
                                        dynlib: mltlib.}
proc dequePeekFront*(self: Deque): pointer {.cdecl, importc: "mlt_deque_peek_front",
    dynlib: mltlib.}
proc dequePeek*(self: Deque; index: cint): pointer {.cdecl, importc: "mlt_deque_peek",
    dynlib: mltlib.}
proc dequeInsert*(self: Deque; item: pointer; a3: DequeCompare): cint {.cdecl,
    importc: "mlt_deque_insert", dynlib: mltlib.}
proc dequePushBackInt*(self: Deque; item: cint): cint {.cdecl,
    importc: "mlt_deque_push_back_int", dynlib: mltlib.}
proc dequePopBackInt*(self: Deque): cint {.cdecl, importc: "mlt_deque_pop_back_int",
                                       dynlib: mltlib.}
proc dequePushFrontInt*(self: Deque; item: cint): cint {.cdecl,
    importc: "mlt_deque_push_front_int", dynlib: mltlib.}
proc dequePopFrontInt*(self: Deque): cint {.cdecl,
                                        importc: "mlt_deque_pop_front_int",
                                        dynlib: mltlib.}
proc dequePeekBackInt*(self: Deque): cint {.cdecl,
                                        importc: "mlt_deque_peek_back_int",
                                        dynlib: mltlib.}
proc dequePeekFrontInt*(self: Deque): cint {.cdecl,
    importc: "mlt_deque_peek_front_int", dynlib: mltlib.}
proc dequePushBackDouble*(self: Deque; item: cdouble): cint {.cdecl,
    importc: "mlt_deque_push_back_double", dynlib: mltlib.}
proc dequePopBackDouble*(self: Deque): cdouble {.cdecl,
    importc: "mlt_deque_pop_back_double", dynlib: mltlib.}
proc dequePushFrontDouble*(self: Deque; item: cdouble): cint {.cdecl,
    importc: "mlt_deque_push_front_double", dynlib: mltlib.}
proc dequePopFrontDouble*(self: Deque): cdouble {.cdecl,
    importc: "mlt_deque_pop_front_double", dynlib: mltlib.}
proc dequePeekBackDouble*(self: Deque): cdouble {.cdecl,
    importc: "mlt_deque_peek_back_double", dynlib: mltlib.}
proc dequePeekFrontDouble*(self: Deque): cdouble {.cdecl,
    importc: "mlt_deque_peek_front_double", dynlib: mltlib.}
proc dequeClose*(self: Deque) {.cdecl, importc: "mlt_deque_close", dynlib: mltlib.}