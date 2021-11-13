import ../wrapper/mlt
import typs, os


proc connect*(self:Consumer, producer:Service) =
  let res = mlt_consumer_connect(self, producer).int
  if res > 0:
    quit("""mlt_consumer_connect returned >0""")

proc `>`*(self:Consumer, producer:Service) =
  connect(self, producer)

proc start*(self:Consumer) =
  let res = mlt_consumer_start(self).int
  if res > 0:
    quit("""failed to start the consumer""")


proc isStopped*(self:Consumer):bool =
  let res = mlt_consumer_is_stopped(self)
  #echo res
  if res == 0:
    return true
  return false


proc close*(a:Consumer) =
  mlt_consumer_close(a) 

#[
proc mlt_consumer_init*(self: mlt_consumer; child: pointer; profile: mlt_profile): cint 
proc mlt_consumer_new*(profile: mlt_profile): mlt_consumer 
proc mlt_consumer_service*(self: mlt_consumer): mlt_service 
proc mlt_consumer_properties*(self: mlt_consumer): mlt_properties 


proc mlt_consumer_purge*(self: mlt_consumer) 
proc mlt_consumer_put_frame*(self: mlt_consumer; frame: mlt_frame): cint 
proc mlt_consumer_get_frame*(self: mlt_consumer): mlt_frame 
proc mlt_consumer_rt_frame*(self: mlt_consumer): mlt_frame 
proc mlt_consumer_stop*(self: mlt_consumer): cint 

proc mlt_consumer_stopped*(self: mlt_consumer) 

proc mlt_consumer_position*(a1: mlt_consumer): mlt_position 
]#