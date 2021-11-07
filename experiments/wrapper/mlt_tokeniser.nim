## *
##  \file mlt_tokeniser.h
##  \brief string tokeniser
##  \see mlt_tokeniser_s
##
##  Copyright (C) 2002-2014 Meltytech, LLC
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

## * \brief Tokeniser class
##
##

type
  Tokeniser* {.importc: "mlt_tokeniser", header: "mlt_tokeniser.h", bycopy.} = object
    input* {.importc: "input".}: cstring
    tokens* {.importc: "tokens".}: cstringArray
    count* {.importc: "count".}: cint
    size* {.importc: "size".}: cint

  TokeniserT* = Tokeniser

##  Remote parser API.
##

proc tokeniserInit*(): Tokeniser {.cdecl, importc: "mlt_tokeniser_init",
                                dynlib: mltlib.}
proc tokeniserParseNew*(tokeniser: Tokeniser; text: cstring; delimiter: cstring): cint {.
    cdecl, importc: "mlt_tokeniser_parse_new", dynlib: mltlib.}
proc tokeniserGetInput*(tokeniser: Tokeniser): cstring {.cdecl,
    importc: "mlt_tokeniser_get_input", dynlib: mltlib.}
proc tokeniserCount*(tokeniser: Tokeniser): cint {.cdecl,
    importc: "mlt_tokeniser_count", dynlib: mltlib.}
proc tokeniserGetString*(tokeniser: Tokeniser; index: cint): cstring {.cdecl,
    importc: "mlt_tokeniser_get_string", dynlib: mltlib.}
proc tokeniserClose*(tokeniser: Tokeniser) {.cdecl, importc: "mlt_tokeniser_close",
    dynlib: mltlib.}