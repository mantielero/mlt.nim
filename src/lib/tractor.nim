import ../wrapper/mlt
import typs, os, std/strformat


proc newTractor*():Tractor =
  result.data = mlt_tractor_new()

converter toProducer*(self:Tractor):Producer = 
  #var tmp:Producer
  result.data = mlt_tractor_producer(self.data)
  #return tmp

converter toService*(self:Tractor):Service =
  result.data = mlt_tractor_service(self.data)

converter toField*(self:Tractor):Field =
  result.data = mlt_tractor_field(self.data)

converter toMultitrack*(self:Tractor):Multitrack =
  result.data = mlt_tractor_multitrack(self.data)

converter toProperties*(self:Tractor):Properties =
 result.data =  mlt_tractor_properties(self.data)

proc close*(self:Tractor) =
  mlt_tractor_close(self.data)


proc connect*(self: Tractor; service: Service) = 
  let res = mlt_tractor_connect(self.data, service.data)
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