## *
##  \file mlt_slices.h
##  \brief sliced threading processing helper
##  \see mlt_slices_s
##
##  Copyright (C) 2016-2021 Meltytech, LLC
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

## *
##  \envvar \em MLT_SLICES_COUNT Set the number of slices to use, which
##  defaults to number of CPUs found.
##

discard "forward decl of mlt_slices_s"
type
  SlicesProc* = proc (id: cint; idx: cint; jobs: cint; cookie: pointer): cint {.cdecl.}

proc slicesCountNormal*(): cint {.cdecl, importc: "mlt_slices_count_normal",
                               dynlib: mltlib.}
proc slicesCountRr*(): cint {.cdecl, importc: "mlt_slices_count_rr", dynlib: mltlib.}
proc slicesCountFifo*(): cint {.cdecl, importc: "mlt_slices_count_fifo",
                             dynlib: mltlib.}
proc slicesRunNormal*(jobs: cint; `proc`: SlicesProc; cookie: pointer) {.cdecl,
    importc: "mlt_slices_run_normal", dynlib: mltlib.}
proc slicesRunRr*(jobs: cint; `proc`: SlicesProc; cookie: pointer) {.cdecl,
    importc: "mlt_slices_run_rr", dynlib: mltlib.}
proc slicesRunFifo*(jobs: cint; `proc`: SlicesProc; cookie: pointer) {.cdecl,
    importc: "mlt_slices_run_fifo", dynlib: mltlib.}