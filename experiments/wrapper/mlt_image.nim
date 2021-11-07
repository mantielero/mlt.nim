## *
##  \file mlt_image.h
##  \brief Image class
##  \see mlt_image_s
##
##  Copyright (C) 2021 Meltytech, LLC
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

## * \brief Image class
##
##  Image is the data object that represents image for a period of time.
##

const
  ImageMaxPlanes* = 4

type
  ImageS* {.importc: "mlt_image_s", header: "mlt_image.h", bycopy.} = object
    format* {.importc: "format".}: ImageFormat
    width* {.importc: "width".}: cint
    height* {.importc: "height".}: cint
    colorspace* {.importc: "colorspace".}: cint
    planes* {.importc: "planes".}: array[ImageMaxPlanes, ptr uint8]
    strides* {.importc: "strides".}: array[ImageMaxPlanes, cint]
    data* {.importc: "data".}: pointer
    releaseData* {.importc: "release_data".}: Destructor
    alpha* {.importc: "alpha".}: pointer
    releaseAlpha* {.importc: "release_alpha".}: Destructor
    close* {.importc: "close".}: Destructor
  Image* = ptr ImageS


proc imageNew*(): Image {.cdecl, importc: "mlt_image_new", dynlib: mltlib.}
proc imageClose*(self: Image) {.cdecl, importc: "mlt_image_close", dynlib: mltlib.}
proc imageSetValues*(self: Image; data: pointer; format: ImageFormat; width: cint;
                    height: cint) {.cdecl, importc: "mlt_image_set_values",
                                  dynlib: mltlib.}
proc imageGetValues*(self: Image; data: ptr pointer; format: ptr ImageFormat;
                    width: ptr cint; height: ptr cint) {.cdecl,
    importc: "mlt_image_get_values", dynlib: mltlib.}
proc imageAllocData*(self: Image) {.cdecl, importc: "mlt_image_alloc_data",
                                 dynlib: mltlib.}
proc imageAllocAlpha*(self: Image) {.cdecl, importc: "mlt_image_alloc_alpha",
                                  dynlib: mltlib.}
proc imageCalculateSize*(self: Image): cint {.cdecl,
    importc: "mlt_image_calculate_size", dynlib: mltlib.}
proc imageFillBlack*(self: Image) {.cdecl, importc: "mlt_image_fill_black",
                                 dynlib: mltlib.}
proc imageFillOpaque*(self: Image) {.cdecl, importc: "mlt_image_fill_opaque",
                                  dynlib: mltlib.}
proc imageFormatName*(format: ImageFormat): cstring {.cdecl,
    importc: "mlt_image_format_name", dynlib: mltlib.}
proc imageFormatId*(name: cstring): ImageFormat {.cdecl,
    importc: "mlt_image_format_id", dynlib: mltlib.}
##  Deprecated functions

proc imageFormatSize*(format: ImageFormat; width: cint; height: cint; bpp: ptr cint): cint {.
    cdecl, importc: "mlt_image_format_size", dynlib: mltlib.}
proc imageFormatPlanes*(format: ImageFormat; width: cint; height: cint; data: pointer;
                       planes: array[4, ptr uint8]; strides: array[4, cint]) {.cdecl,
    importc: "mlt_image_format_planes", dynlib: mltlib.}