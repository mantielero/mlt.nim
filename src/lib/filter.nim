import ../wrapper/mlt
import typs, os


proc connect*(self:Filter; producer: Service; index:int = 0) =
  let res = mlt_filter_connect(self.data, producer.data, index.cint)
  if res > 0:
    quit("""mlt_consumer_connect returned >0""")  

converter toService*(self:Filter):Service =
  result.data = mlt_filter_service(self.data) 

converter toProperties*(self:Filter):Properties =
  result.data = mlt_filter_properties(self.data)
  #result.data = mlt_service_properties(mlt_filter_service(self.data))  #mlt_filter_properties(self.data)


proc close*(a:Filter) = 
  mlt_filter_close(a.data)

# Sugar
proc `>`*(a:Service; b:Filter) =
  connect(b,a)

#[
proc mlt_filter_init*(self: mlt_filter; child: pointer): cint 
proc mlt_filter_new*(): mlt_filter 

proc mlt_filter_process*(self: mlt_filter; that: mlt_frame): mlt_frame 

proc mlt_filter_set_in_and_out*(self: mlt_filter; `in`: mlt_position;
                                `out`: mlt_position) 
proc mlt_filter_get_track*(self: mlt_filter): cint
proc mlt_filter_get_in*(self: mlt_filter): mlt_position 
proc mlt_filter_get_out*(self: mlt_filter): mlt_position 
proc mlt_filter_get_length*(self: mlt_filter): mlt_position 
proc mlt_filter_get_length2*(self: mlt_filter; frame: mlt_frame): mlt_position 
proc mlt_filter_get_position*(self: mlt_filter; frame: mlt_frame): mlt_position 
proc mlt_filter_get_progress*(self: mlt_filter; frame: mlt_frame): cdouble 
 
]#