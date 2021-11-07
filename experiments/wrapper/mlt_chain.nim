## *
##  \file mlt_chain.h
##  \brief chain service class
##  \see mlt_chain_s
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

## * \brief Chain class
##
##  The chain is a producer class that that can connect multiple link producers in a sequence.
##
##  \extends mlt_producer_s
##

type
  ChainS* {.importc: "mlt_chain_s", header: "mlt_chain.h", bycopy.} = object
    parent* {.importc: "parent".}: ProducerS
    local* {.importc: "local".}: pointer ## *< \private instance object
  Chain* = ptr ChainS


template mlt_Chain_Producer*(chain: untyped): untyped =
  (addr((chain).parent))

template mlt_Chain_Service*(chain: untyped): untyped =
  mlt_Producer_Service(mlt_Chain_Producer(chain))

template mlt_Chain_Properties*(chain: untyped): untyped =
  mlt_Service_Properties(mlt_Chain_Service(chain))

proc chainInit*(a1: Profile): Chain {.cdecl, importc: "mlt_chain_init", dynlib: mltlib.}
proc chainSetSource*(self: Chain; source: Producer) {.cdecl,
    importc: "mlt_chain_set_source", dynlib: mltlib.}
proc chainGetSource*(self: Chain): Producer {.cdecl, importc: "mlt_chain_get_source",
    dynlib: mltlib.}
proc chainAttach*(self: Chain; link: Link): cint {.cdecl, importc: "mlt_chain_attach",
    dynlib: mltlib.}
proc chainDetach*(self: Chain; link: Link): cint {.cdecl, importc: "mlt_chain_detach",
    dynlib: mltlib.}
proc chainLinkCount*(self: Chain): cint {.cdecl, importc: "mlt_chain_link_count",
                                      dynlib: mltlib.}
proc chainMoveLink*(self: Chain; `from`: cint; to: cint): cint {.cdecl,
    importc: "mlt_chain_move_link", dynlib: mltlib.}
proc chainLink*(self: Chain; index: cint): Link {.cdecl, importc: "mlt_chain_link",
    dynlib: mltlib.}
proc chainClose*(self: Chain) {.cdecl, importc: "mlt_chain_close", dynlib: mltlib.}