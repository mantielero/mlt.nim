import ../wrapper/mlt
import typs, os, std/strformat


proc newTractor*():Tractor =
  mlt_tractor_new()

converter toProducer*(self:Tractor):Producer = 
  #var tmp:Producer
  result.data = mlt_tractor_producer(self)
  #return tmp

converter toService*(self:Tractor):Service =
  mlt_tractor_service(self)

proc toField*(self:Tractor):Field =
  mlt_tractor_field(self)

proc toMultitrack*(self:Tractor):Multitrack =
  mlt_tractor_multitrack(self)

proc toProperties*(self:Tractor):Properties =
  mlt_tractor_properties(self)

proc close*(self:Tractor) =
  mlt_tractor_close(self)


proc connect*(self: Tractor; service: Service) = 
  let res = mlt_tractor_connect(self, service)
  if res > 0:
    quit("""unable to connect tractor to service""")  
    
#[
proc mlt_tractor_init*(): mlt_tractor {.importc, cdecl, impmltDyn.}



proc mlt_tractor_refresh*(self: mlt_tractor) {.importc, cdecl, impmltDyn.}
proc mlt_tractor_set_track*(self: mlt_tractor; producer: mlt_producer;
                            index: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_tractor_insert_track*(self: mlt_tractor; producer: mlt_producer;
                               index: cint): cint {.importc, cdecl, impmltDyn.}
proc mlt_tractor_remove_track*(self: mlt_tractor; index: cint): cint {.importc,
    cdecl, impmltDyn.}
proc mlt_tractor_get_track*(self: mlt_tractor; index: cint): mlt_producer {.
    importc, cdecl, impmltDyn.}

]#