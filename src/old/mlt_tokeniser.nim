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
## * \brief Tokeniser class
##
##

type
  mlt_tokeniser* {.bycopy.} = object
    input*: cstring
    tokens*: cstringArray
    count*: cint
    size*: cint


##  mlt_tokeniser_t;
##  Remote parser API.
##

proc mlt_tokeniser_init*(): mlt_tokeniser {.cdecl, importc: "mlt_tokeniser_init",
    dynlib: libName.}
proc mlt_tokeniser_parse_new*(tokeniser: mlt_tokeniser; text: cstring;
                             delimiter: cstring): cint {.cdecl,
    importc: "mlt_tokeniser_parse_new", dynlib: libName.}
proc mlt_tokeniser_get_input*(tokeniser: mlt_tokeniser): cstring {.cdecl,
    importc: "mlt_tokeniser_get_input", dynlib: libName.}
proc mlt_tokeniser_count*(tokeniser: mlt_tokeniser): cint {.cdecl,
    importc: "mlt_tokeniser_count", dynlib: libName.}
proc mlt_tokeniser_get_string*(tokeniser: mlt_tokeniser; index: cint): cstring {.
    cdecl, importc: "mlt_tokeniser_get_string", dynlib: libName.}
proc mlt_tokeniser_close*(tokeniser: mlt_tokeniser) {.cdecl,
    importc: "mlt_tokeniser_close", dynlib: libName.}