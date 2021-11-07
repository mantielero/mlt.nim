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

## * \brief Parser class
##
##  \extends mlt_properties_s
##

type
  ParserS* {.importc: "mlt_parser_s", header: "mlt_parser.h", bycopy.} = object
    parent* {.importc: "parent".}: PropertiesS
    onInvalid* {.importc: "on_invalid".}: proc (self: Parser; `object`: Service): cint {.
        cdecl.}
    onUnknown* {.importc: "on_unknown".}: proc (self: Parser; `object`: Service): cint {.
        cdecl.}
    onStartProducer* {.importc: "on_start_producer".}: proc (self: Parser;
        `object`: Producer): cint {.cdecl.}
    onEndProducer* {.importc: "on_end_producer".}: proc (self: Parser;
        `object`: Producer): cint {.cdecl.}
    onStartPlaylist* {.importc: "on_start_playlist".}: proc (self: Parser;
        `object`: Playlist): cint {.cdecl.}
    onEndPlaylist* {.importc: "on_end_playlist".}: proc (self: Parser;
        `object`: Playlist): cint {.cdecl.}
    onStartTractor* {.importc: "on_start_tractor".}: proc (self: Parser;
        `object`: Tractor): cint {.cdecl.}
    onEndTractor* {.importc: "on_end_tractor".}: proc (self: Parser; `object`: Tractor): cint {.
        cdecl.}
    onStartMultitrack* {.importc: "on_start_multitrack".}: proc (self: Parser;
        `object`: Multitrack): cint {.cdecl.}
    onEndMultitrack* {.importc: "on_end_multitrack".}: proc (self: Parser;
        `object`: Multitrack): cint {.cdecl.}
    onStartTrack* {.importc: "on_start_track".}: proc (self: Parser): cint {.cdecl.}
    onEndTrack* {.importc: "on_end_track".}: proc (self: Parser): cint {.cdecl.}
    onStartFilter* {.importc: "on_start_filter".}: proc (self: Parser;
        `object`: Filter): cint {.cdecl.}
    onEndFilter* {.importc: "on_end_filter".}: proc (self: Parser; `object`: Filter): cint {.
        cdecl.}
    onStartTransition* {.importc: "on_start_transition".}: proc (self: Parser;
        `object`: Transition): cint {.cdecl.}
    onEndTransition* {.importc: "on_end_transition".}: proc (self: Parser;
        `object`: Transition): cint {.cdecl.}
    onStartChain* {.importc: "on_start_chain".}: proc (self: Parser; `object`: Chain): cint {.
        cdecl.}
    onEndChain* {.importc: "on_end_chain".}: proc (self: Parser; `object`: Chain): cint {.
        cdecl.}
    onStartLink* {.importc: "on_start_link".}: proc (self: Parser; `object`: Link): cint {.
        cdecl.}
    onEndLink* {.importc: "on_end_link".}: proc (self: Parser; `object`: Link): cint {.
        cdecl.}


proc parserNew*(): Parser {.cdecl, importc: "mlt_parser_new", dynlib: mltlib.}
proc parserProperties*(self: Parser): Properties {.cdecl,
    importc: "mlt_parser_properties", dynlib: mltlib.}
proc parserStart*(self: Parser; `object`: Service): cint {.cdecl,
    importc: "mlt_parser_start", dynlib: mltlib.}
proc parserClose*(self: Parser) {.cdecl, importc: "mlt_parser_close", dynlib: mltlib.}