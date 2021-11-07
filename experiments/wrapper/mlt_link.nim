## *
##  \file mlt_link.h
##  \brief link service class
##  \see mlt_link_s
##
##  Copyright (C) 2020 Meltytech, LLC
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

## * \brief Link class
##
##  The link is a producer class that that can be connected to other link producers in a Chain.
##
##  \extends mlt_producer_s
##  \properties \em next holds a reference to the next producer in the chain
##

type
  LinkS* {.importc: "mlt_link_s", header: "mlt_link.h", bycopy.} = object
    parent* {.importc: "parent".}: ProducerS ## * \publicsection
    ## * \protectedsection
    ## * Get a frame of data (virtual function).
    ##
    ##  \param mlt_link a link
    ##  \param mlt_frame_ptr a frame pointer by reference
    ##  \param int an index
    ##  \return true if there was an error
    ##
    getFrame* {.importc: "get_frame".}: proc (a1: Link; a2: ptr Frame; a3: cint): cint {.
        cdecl.}               ## * Configure the link (virtual function).
               ##
               ##  \param mlt_link a link
               ##  \param mlt_profile a default profile to use
               ##
    configure* {.importc: "configure".}: proc (a1: Link; a2: Profile) {.cdecl.} ## * Virtual close function
    close* {.importc: "close".}: proc (a1: Link) {.cdecl.} ## * \privatesection
    next* {.importc: "next".}: Producer ## * the object of a subclass
    child* {.importc: "child".}: pointer


template mlt_Link_Producer*(link: untyped): untyped =
  (addr((link).parent))

template mlt_Link_Service*(link: untyped): untyped =
  mlt_Producer_Service(mlt_Link_Producer(link))

template mlt_Link_Properties*(link: untyped): untyped =
  mlt_Service_Properties(mlt_Link_Service(link))

proc linkInit*(): Link {.cdecl, importc: "mlt_link_init", dynlib: mltlib.}
proc linkConnectNext*(self: Link; next: Producer; chainProfile: Profile): cint {.cdecl,
    importc: "mlt_link_connect_next", dynlib: mltlib.}
proc linkClose*(self: Link) {.cdecl, importc: "mlt_link_close", dynlib: mltlib.}