## *
##  \file mlt_slices.h
##  \brief sliced threading processing helper
##  \see mlt_slices_s
##
##  Copyright (C) 2016-2017 Meltytech, LLC
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

## *
##  \envvar \em MLT_SLICES_COUNT Set the number of slices to use, which
##  defaults to number of CPUs found.
##

type
  mlt_slices_s* {.bycopy.} = object

  mlt_slices_proc* = proc (id: cint; idx: cint; jobs: cint; cookie: pointer): cint {.cdecl.}

proc mlt_slices_init*(threads: cint; policy: cint; priority: cint): mlt_slices {.cdecl,
    importc: "mlt_slices_init", dynlib: libName.}
proc mlt_slices_close*(ctx: mlt_slices) {.cdecl, importc: "mlt_slices_close",
                                       dynlib: libName.}
proc mlt_slices_run*(ctx: mlt_slices; jobs: cint; `proc`: mlt_slices_proc;
                    cookie: pointer) {.cdecl, importc: "mlt_slices_run",
                                     dynlib: libName.}
proc mlt_slices_count_normal*(): cint {.cdecl, importc: "mlt_slices_count_normal",
                                     dynlib: libName.}
proc mlt_slices_count_rr*(): cint {.cdecl, importc: "mlt_slices_count_rr",
                                 dynlib: libName.}
proc mlt_slices_count_fifo*(): cint {.cdecl, importc: "mlt_slices_count_fifo",
                                   dynlib: libName.}
proc mlt_slices_run_normal*(jobs: cint; `proc`: mlt_slices_proc; cookie: pointer) {.
    cdecl, importc: "mlt_slices_run_normal", dynlib: libName.}
proc mlt_slices_run_rr*(jobs: cint; `proc`: mlt_slices_proc; cookie: pointer) {.cdecl,
    importc: "mlt_slices_run_rr", dynlib: libName.}
proc mlt_slices_run_fifo*(jobs: cint; `proc`: mlt_slices_proc; cookie: pointer) {.
    cdecl, importc: "mlt_slices_run_fifo", dynlib: libName.}