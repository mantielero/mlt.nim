import ../wrapper/mlt
import typs, os, strutils


proc newConsumer*():Consumer =
  result.data = mlt_factory_consumer(nil, nil, nil)


proc newConsumer*(prof:Profile):Consumer =
  result.data = mlt_factory_consumer(prof.data, nil, nil)


proc newConsumer*(prof:Profile; id:string = "";arg:string = ""):Consumer =
  if id == "" and arg != "":
    result.data = mlt_factory_consumer( prof.data, nil, arg.cstring )
  
  else:
    let tmp = id.split(':', 1)
    if len(tmp) == 1:
      result.data = mlt_factory_consumer( prof.data, tmp[0].cstring, nil )
    else:
      result.data = mlt_factory_consumer( prof.data, tmp[0].cstring, tmp[1].cstring )




#[
proc mlt_consumer_init*(self: mlt_consumer; child: pointer; profile: mlt_profile): cint 
proc mlt_consumer_new*(profile: mlt_profile): mlt_consumer   
]#


proc connect*(self:Consumer, producer:Service) =
  let res = mlt_consumer_connect(self.data, producer.data).int
  if res > 0:
    quit("""mlt_consumer_connect returned >0""")

proc `>`*(produ:Service, consu:Consumer ) =
  #echo consu
  #echo repr produ
  connect(consu, produ)

proc start*(self:Consumer) =
  let res = mlt_consumer_start(self.data).int
  if res > 0:
    quit("""failed to start the consumer""")


proc stopped*(self:Consumer):bool =
  let res = mlt_consumer_is_stopped(self.data).int
  if res > 0:
    return true
  return false


proc stop*(self:Consumer) =
  let tmp = mlt_consumer_stop(self.data).int
  if tmp > 0:
    quit("failed to stop the consumer")

proc close*(self:Consumer) =
  mlt_consumer_close(self.data)


converter toProperties*(self:Consumer):Properties =
  result.data = mlt_consumer_properties( self.data )

converter toService*(self:Consumer):Service =
  result.data = mlt_consumer_service( self.data )

proc position*(self:Consumer):int =
  mlt_consumer_position(self.data)


proc purge*(self:Consumer) =
  mlt_consumer_purge(self.data)

proc run*(self:Consumer) =
  self.start
  while not self.stopped:
    sleep(1)  
#[
proc mlt_consumer_put_frame*(self: mlt_consumer; frame: mlt_frame): cint 
proc mlt_consumer_get_frame*(self: mlt_consumer): mlt_frame 
proc mlt_consumer_rt_frame*(self: mlt_consumer): mlt_frame 
]#




#[
Consumer::Consumer( Service &consumer ) :
	instance( NULL )
{
	if ( consumer.type( ) == mlt_service_consumer_type )
	{
		instance = ( mlt_consumer )consumer.get_service( );
		inc_ref( );
	}
}

Consumer::Consumer( Consumer &consumer ) :
	Mlt::Service( consumer ),
	instance( consumer.get_consumer( ) )
{
	inc_ref( );
}

Consumer::Consumer( mlt_consumer consumer ) :
	instance( consumer )
{
	inc_ref( );
}

]#

