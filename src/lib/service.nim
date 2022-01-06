import ../wrapper/mlt
import typs, os#, filter, producer


converter toProperties*(self:Service):Properties =
  result.data = mlt_service_properties(self.data)

#converter toProperties*(self:Filter):Properties =
#  self.toService.toProperties



proc attach*(self:Service; f:Filter) =
  let res = mlt_service_attach(self.data, f.data).int
  if res > 0:
    quit("unable to attach filter to service")

proc detach*(self:Service; f:Filter) =
  let res = mlt_service_detach(self.data, f.data).int
  if res > 0:
    quit("unable to detach filter to service")



proc getFrame*(self:Service, index:int):Frame =
  # mlt_frame_ptr = ptr ptr mlt_frame_s  = ptr mlt_frame
  # mlt_frame = ptr mlt_frame_s
  var frame:mlt_frame_ptr
  #echo "service: ", repr self.data
  var res = mlt_service_get_frame(self.data, frame, index.cint)
  #echo "frame: ", repr frame
  result.data = cast[mlt_frame](frame)
  if res > 0:
    quit("unable to get a frame from service")

#[
proc mlt_service_init*(self: mlt_service; child: pointer): cint
proc mlt_service_lock*(self: mlt_service)
proc mlt_service_unlock*(self: mlt_service)
proc mlt_service_identify*(self: mlt_service): mlt_service_type
proc mlt_service_connect_producer*(self: mlt_service; producer: mlt_service;
                                   index: cint): cint
proc mlt_service_insert_producer*(self: mlt_service; producer: mlt_service;
                                  index: cint): cint
proc mlt_service_disconnect_producer*(self: mlt_service; index: cint): cint
proc mlt_service_disconnect_all_producers*(self: mlt_service): cint
proc mlt_service_get_producer*(self: mlt_service): mlt_service

proc mlt_service_properties*(self: mlt_service): mlt_properties
proc mlt_service_consumer*(self: mlt_service): mlt_service
proc mlt_service_producer*(self: mlt_service): mlt_service



proc mlt_service_apply_filters*(self: mlt_service; frame: mlt_frame; index: cint)
proc mlt_service_filter_count*(self: mlt_service): cint
proc mlt_service_move_filter*(self: mlt_service; `from`: cint; to: cint): cint
proc mlt_service_filter*(self: mlt_service; index: cint): mlt_filter
proc mlt_service_profile*(self: mlt_service): mlt_profile
proc mlt_service_set_profile*(self: mlt_service; profile: mlt_profile)
proc mlt_service_close*(self: mlt_service)

proc mlt_service_cache_put*(self: mlt_service; name: cstring; data: pointer;
                            size: cint; destructor: mlt_destructor)
proc mlt_service_cache_get*(self: mlt_service; name: cstring): mlt_cache_item
proc mlt_service_cache_set_size*(self: mlt_service; name: cstring; size: cint)
proc mlt_service_cache_get_size*(self: mlt_service; name: cstring): cint
proc mlt_service_cache_purge*(self: mlt_service)

]#