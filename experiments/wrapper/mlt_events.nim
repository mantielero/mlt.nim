## *
##  \file mlt_events.h
##  \brief event handling
##  \see mlt_events_struct
##
##  Copyright (C) 2004-2021 Meltytech, LLC
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

## * A container for data that may be supplied with an event

type
  INNER_C_UNION_mlt_events_34* {.importc: "mlt_event_data::no_name",
                                header: "mlt_events.h", bycopy, union.} = object
    i* {.importc: "i".}: cint
    p* {.importc: "p".}: pointer

  EventData* {.importc: "mlt_event_data", header: "mlt_events.h", bycopy.} = object
    u* {.importc: "u".}: INNER_C_UNION_mlt_events_34


## * An event data structure to convey thread parameters

type
  EventDataThread* {.importc: "mlt_event_data_thread", header: "mlt_events.h", bycopy.} = object
    thread* {.importc: "thread".}: ptr pointer ## *< a pointer to a thread object or handle as determined by you
    priority* {.importc: "priority".}: ptr cint ## *< a priority level for the thread
    function* {.importc: "function".}: ThreadFunctionT ## *< a pointer to the function that thread will run
    data* {.importc: "data".}: pointer ## *< an opaque data pointer to pass along


## * event handler when receiving an event message
##  \param the properties object on which the event was registered
##  \param an opaque pointer to the listener's data
##  \param an event data object
##

type
  Listener* = proc (a1: Properties; a2: pointer; a3: EventData) {.cdecl.}

proc eventsInit*(self: Properties) {.cdecl, importc: "mlt_events_init", dynlib: mltlib.}
proc eventsRegister*(self: Properties; id: cstring): cint {.cdecl,
    importc: "mlt_events_register", dynlib: mltlib.}
proc eventsFire*(self: Properties; id: cstring; a3: EventData): cint {.cdecl,
    importc: "mlt_events_fire", dynlib: mltlib.}
proc eventsListen*(self: Properties; listenerData: pointer; id: cstring;
                  listener: Listener): Event {.cdecl, importc: "mlt_events_listen",
    dynlib: mltlib.}
proc eventsBlock*(self: Properties; listenerData: pointer) {.cdecl,
    importc: "mlt_events_block", dynlib: mltlib.}
proc eventsUnblock*(self: Properties; listenerData: pointer) {.cdecl,
    importc: "mlt_events_unblock", dynlib: mltlib.}
proc eventsDisconnect*(self: Properties; listenerData: pointer) {.cdecl,
    importc: "mlt_events_disconnect", dynlib: mltlib.}
proc eventsSetupWaitFor*(self: Properties; id: cstring): Event {.cdecl,
    importc: "mlt_events_setup_wait_for", dynlib: mltlib.}
proc eventsWaitFor*(self: Properties; event: Event) {.cdecl,
    importc: "mlt_events_wait_for", dynlib: mltlib.}
proc eventsCloseWaitFor*(self: Properties; event: Event) {.cdecl,
    importc: "mlt_events_close_wait_for", dynlib: mltlib.}
proc eventIncRef*(self: Event) {.cdecl, importc: "mlt_event_inc_ref", dynlib: mltlib.}
proc eventBlock*(self: Event) {.cdecl, importc: "mlt_event_block", dynlib: mltlib.}
proc eventUnblock*(self: Event) {.cdecl, importc: "mlt_event_unblock", dynlib: mltlib.}
proc eventClose*(self: Event) {.cdecl, importc: "mlt_event_close", dynlib: mltlib.}
proc eventDataNone*(): EventData {.cdecl, importc: "mlt_event_data_none",
                                dynlib: mltlib.}
proc eventDataFromInt*(value: cint): EventData {.cdecl,
    importc: "mlt_event_data_from_int", dynlib: mltlib.}
proc eventDataToInt*(a1: EventData): cint {.cdecl, importc: "mlt_event_data_to_int",
                                        dynlib: mltlib.}
proc eventDataFromString*(value: cstring): EventData {.cdecl,
    importc: "mlt_event_data_from_string", dynlib: mltlib.}
proc eventDataToString*(a1: EventData): cstring {.cdecl,
    importc: "mlt_event_data_to_string", dynlib: mltlib.}
proc eventDataFromFrame*(a1: Frame): EventData {.cdecl,
    importc: "mlt_event_data_from_frame", dynlib: mltlib.}
proc eventDataToFrame*(a1: EventData): Frame {.cdecl,
    importc: "mlt_event_data_to_frame", dynlib: mltlib.}
proc eventDataFromObject*(a1: pointer): EventData {.cdecl,
    importc: "mlt_event_data_from_object", dynlib: mltlib.}
proc eventDataToObject*(a1: EventData): pointer {.cdecl,
    importc: "mlt_event_data_to_object", dynlib: mltlib.}