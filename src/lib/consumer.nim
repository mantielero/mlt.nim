import ../wrapper/mlt
import typs, os, strutils


proc connect*(self:Consumer, producer:Service) =
  let res = mlt_consumer_connect(self, producer).int
  if res > 0:
    quit("""mlt_consumer_connect returned >0""")

proc `>`*(produ:Service, consu:Consumer ) =
  #echo consu
  #echo repr produ
  connect(consu, produ)

proc start*(self:Consumer) =
  let res = mlt_consumer_start(self).int
  if res > 0:
    quit("""failed to start the consumer""")


proc stopped*(self:Consumer):bool =
  let res = mlt_consumer_is_stopped(self).int
  if res > 0:
    return true
  return false


proc close*(self:Consumer) =
  mlt_consumer_close(self)


#proc `=destroy`[T:Consumer](x: var T) =
#  x.close()

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


proc newConsumer*():Consumer =
  mlt_factory_consumer(nil, nil, nil)


proc newConsumer*(prof:Profile):Consumer =
  mlt_factory_consumer(prof, nil, nil)


proc newConsumer*(prof:Profile; id:string = "";arg:string = ""):Consumer =
  if id == "" and arg != "":
    result = mlt_factory_consumer( prof, nil, arg.cstring )
  
  else:
    let tmp = id.split(':', 1)
    if len(tmp) == 1:
      result = mlt_factory_consumer( prof, tmp[0].cstring, nil )
    else:
      result = mlt_factory_consumer( prof, tmp[0].cstring, tmp[1].cstring )




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

Consumer::~Consumer( )
{
	mlt_consumer_close( instance );
}

mlt_consumer Consumer::get_consumer( )
{
	return instance;
}

mlt_service Consumer::get_service( )
{
	return mlt_consumer_service( get_consumer( ) );
}

int Consumer::connect( Service &service )
{
	return connect_producer( service );
}






int Consumer::start( )
{
	return mlt_consumer_start( get_consumer( ) );
}

void Consumer::purge( )
{
	mlt_consumer_purge( get_consumer( ) );
}

int Consumer::stop( )
{
	return mlt_consumer_stop( get_consumer( ) );
}

bool Consumer::is_stopped( )
{
	return mlt_consumer_is_stopped( get_consumer( ) ) != 0;
}



int Consumer::position( )
{
	return mlt_consumer_position( get_consumer() );
}  
]#


#[ 
proc run*(self:Consumer) =
  let res = mlt_consumer_start(self).int
  if res > 0:

]#

#[
int Consumer::run( )
{
	int ret = start( );
	if ( !is_stopped( ) )
	{
		Event *e = setup_wait_for( "consumer-stopped" );
		wait_for( e );
		delete e;
	}
	return ret;
}  
]#