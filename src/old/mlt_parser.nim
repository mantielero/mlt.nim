## *
##  \file mlt_parser.h
##  \brief service parsing functionality
##  \see mlt_parser_s
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

## * \brief Parser class
##
##  \extends mlt_properties_s
##

type
  mlt_parser_s* {.bycopy.} = object
    parent*: mlt_properties_s
    on_invalid*: proc (self: mlt_parser; `object`: mlt_service): cint {.cdecl.}
    on_unknown*: proc (self: mlt_parser; `object`: mlt_service): cint {.cdecl.}
    on_start_producer*: proc (self: mlt_parser; `object`: mlt_producer): cint {.cdecl.}
    on_end_producer*: proc (self: mlt_parser; `object`: mlt_producer): cint {.cdecl.}
    on_start_playlist*: proc (self: mlt_parser; `object`: mlt_playlist): cint {.cdecl.}
    on_end_playlist*: proc (self: mlt_parser; `object`: mlt_playlist): cint {.cdecl.}
    on_start_tractor*: proc (self: mlt_parser; `object`: mlt_tractor): cint {.cdecl.}
    on_end_tractor*: proc (self: mlt_parser; `object`: mlt_tractor): cint {.cdecl.}
    on_start_multitrack*: proc (self: mlt_parser; `object`: mlt_multitrack): cint {.
        cdecl.}
    on_end_multitrack*: proc (self: mlt_parser; `object`: mlt_multitrack): cint {.cdecl.}
    on_start_track*: proc (self: mlt_parser): cint {.cdecl.}
    on_end_track*: proc (self: mlt_parser): cint {.cdecl.}
    on_start_filter*: proc (self: mlt_parser; `object`: mlt_filter): cint {.cdecl.}
    on_end_filter*: proc (self: mlt_parser; `object`: mlt_filter): cint {.cdecl.}
    on_start_transition*: proc (self: mlt_parser; `object`: mlt_transition): cint {.
        cdecl.}
    on_end_transition*: proc (self: mlt_parser; `object`: mlt_transition): cint {.cdecl.}


proc mlt_parser_new*(): mlt_parser {.cdecl, importc: "mlt_parser_new", dynlib: libName.}
proc mlt_parser_properties*(self: mlt_parser): mlt_properties {.cdecl,
    importc: "mlt_parser_properties", dynlib: libName.}
proc mlt_parser_start*(self: mlt_parser; `object`: mlt_service): cint {.cdecl,
    importc: "mlt_parser_start", dynlib: libName.}
proc mlt_parser_close*(self: mlt_parser) {.cdecl, importc: "mlt_parser_close",
                                        dynlib: libName.}