## *
##  \file mlt_version.h
##  \brief contains version information
##
##  Copyright (C) 2010-2021 Meltytech, LLC
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

##  Add quotes around any #define variables
##  #define MLT_STRINGIZE2(s)           #s
##  #define MLT_STRINGIZE(s)            MLT_STRINGIZE2(s)
##
##  #define LIBMLT_VERSION_MAJOR    7
##  #define LIBMLT_VERSION_MINOR    0
##  #define LIBMLT_VERSION_REVISION 0
##  #define LIBMLT_VERSION_INT      ((LIBMLT_VERSION_MAJOR<<16)+(LIBMLT_VERSION_MINOR<<8)+LIBMLT_VERSION_REVISION)
##  #define LIBMLT_VERSION          MLT_STRINGIZE(LIBMLT_VERSION_MAJOR.LIBMLT_VERSION_MINOR.LIBMLT_VERSION_REVISION)

proc versionGetInt*(): cint {.cdecl, importc: "mlt_version_get_int", dynlib: mltlib.}
proc versionGetMajor*(): cint {.cdecl, importc: "mlt_version_get_major",
                             dynlib: mltlib.}
proc versionGetMinor*(): cint {.cdecl, importc: "mlt_version_get_minor",
                             dynlib: mltlib.}
proc versionGetRevision*(): cint {.cdecl, importc: "mlt_version_get_revision",
                                dynlib: mltlib.}
proc versionGetString*(): cstring {.cdecl, importc: "mlt_version_get_string",
                                 dynlib: mltlib.}