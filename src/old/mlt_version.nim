# Generated at 2020-04-15T23:31:32+02:00
# Command line:
#   /home/jose/.nimble/pkgs/nimterop-#head/nimterop/toast -pnrk mlt_version.h

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

const

  # *
  #  * \file mlt_version.h
  #  * \brief contains version information
  #  *
  #  * Copyright (C) 2010-2020 Meltytech, LLC
  #  *
  #  * This library is free software; you can redistribute it and/or
  #  * modify it under the terms of the GNU Lesser General Public
  #  * License as published by the Free Software Foundation; either
  #  * version 2.1 of the License, or (at your option) any later version.
  #  *
  #  * This library is distributed in the hope that it will be useful,
  #  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  #  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  #  * Lesser General Public License for more details.
  #  *
  #  * You should have received a copy of the GNU Lesser General Public
  #  * License along with this library; if not, write to the Free Software
  #  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  # 
  #  Add quotes around any #define variables
  LIBMLT_VERSION_MAJOR* = 6
  LIBMLT_VERSION_MINOR* = 21
  LIBMLT_VERSION_REVISION* = 0

#{.pragma: impmlt_version, importc.}
{.pragma: libmlt, importc, dynlib: libName.}


proc mlt_version_get_int*(): cint {.libmlt.}
proc mlt_version_get_major*(): cint {.libmlt.}
proc mlt_version_get_minor*(): cint {.libmlt.}
proc mlt_version_get_revision*(): cint {.libmlt.}
proc mlt_version_get_string*(): cstring {.libmlt.}

when isMainModule:
  assert( $mlt_version_get_string() == "6.20.0" )