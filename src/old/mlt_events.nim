## *
##  \file mlt_events.h
##  \brief event handling
##  \see mlt_events_struct
##
##  Copyright (C) 2004-2014 Meltytech, LLC
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

type
  mlt_properties_s {.bycopy.} = object
    child*: pointer            ## *< \private the object of a subclass
    local*: pointer            ## *< \private instance object
                  ## * the destructor virtual function
    close*: mlt_destructor
    close_object*: pointer     ## *< the object supplied to the close virtual function
  mlt_properties = ptr mlt_properties_s
#[
when GCC_VERSION >= 40000:
  type
    mlt_transmitter* = proc (a1: pointer) {.cdecl, varargs.}
    mlt_listener* = proc (a1: pointer) {.cdecl, varargs.}
else:
  ## * callback function to send an event message
  ##
  ##
  type
    mlt_transmitter* = proc () {.cdecl.}
  ## * event handler when receiving an event message
  ##  \param the properties object on which the event was registered
  ##  \param an opaque pointer to a service or really an object
  ##  \param variable args supplied by the transmitter
  ##
  type
    mlt_listener* = proc () {.cdecl.}
]#

type
  mlt_transmitter* = proc (a1: pointer) {.cdecl, varargs.}
  mlt_listener* = proc (a1: pointer) {.cdecl, varargs.}

proc mlt_events_init*(self: mlt_properties) {.cdecl, importc: "mlt_events_init",
    dynlib: libName.}
proc mlt_events_register*(self: mlt_properties; id: cstring;
                         transmitter: mlt_transmitter): cint {.cdecl,
    importc: "mlt_events_register", dynlib: libName.}
proc mlt_events_fire*(self: mlt_properties; id: cstring): cint {.varargs, cdecl,
    importc: "mlt_events_fire", dynlib: libName.}
proc mlt_events_listen*(self: mlt_properties; service: pointer; id: cstring;
                       listener: mlt_listener): mlt_event {.cdecl,
    importc: "mlt_events_listen", dynlib: libName.}
proc mlt_events_block*(self: mlt_properties; service: pointer) {.cdecl,
    importc: "mlt_events_block", dynlib: libName.}
proc mlt_events_unblock*(self: mlt_properties; service: pointer) {.cdecl,
    importc: "mlt_events_unblock", dynlib: libName.}
proc mlt_events_disconnect*(self: mlt_properties; service: pointer) {.cdecl,
    importc: "mlt_events_disconnect", dynlib: libName.}
proc mlt_events_setup_wait_for*(self: mlt_properties; id: cstring): mlt_event {.cdecl,
    importc: "mlt_events_setup_wait_for", dynlib: libName.}
proc mlt_events_wait_for*(self: mlt_properties; event: mlt_event) {.cdecl,
    importc: "mlt_events_wait_for", dynlib: libName.}
proc mlt_events_close_wait_for*(self: mlt_properties; event: mlt_event) {.cdecl,
    importc: "mlt_events_close_wait_for", dynlib: libName.}
proc mlt_event_inc_ref*(self: mlt_event) {.cdecl, importc: "mlt_event_inc_ref",
                                        dynlib: libName.}
proc mlt_event_block*(self: mlt_event) {.cdecl, importc: "mlt_event_block",
                                      dynlib: libName.}
proc mlt_event_unblock*(self: mlt_event) {.cdecl, importc: "mlt_event_unblock",
                                        dynlib: libName.}
proc mlt_event_close*(self: mlt_event) {.cdecl, importc: "mlt_event_close",
                                      dynlib: libName.}