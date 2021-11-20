# https://www.mltframework.org/doxygen/event.html
# Events provide messages and notifications between services and the 
# application. A service can register an event and fire/send it upon
# certain conditions or times. Likewise, a service or an application
# can listen/receive specific events on specific services.
# https://github.com/mltframework/mlt/blob/master/src/tests/test_events/test_events.cpp
# https://mirror.git.trinitydesktop.org/gitea/TDE/mltpp/src/branch/master/src/MltEvent.cpp

import ../wrapper/mlt
import typs, os, strutils


proc setupWaitFor*(p:Properties; id:string):Event =
  result.data = mlt_events_setup_wait_for( p.data, id.cstring )

proc waitFor*(self:Properties; e:Event) = 
  mlt_events_wait_for(self.data, e.data)

proc closeWaitFor*(self:Properties; e:Event) =
  mlt_events_close_wait_for(self.data, e.data)


proc close*(e:Event) =
  mlt_event_close(e.data)
  
#[

void Properties::wait_for( const char *id )
{
	Event *event = setup_wait_for( id );
	wait_for( event );
	delete event;
}   

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

#[
proc mlt_events_init*(self: mlt_properties)
proc mlt_events_register*(self: mlt_properties; id: cstring): cint
proc mlt_events_fire*(self: mlt_properties; id: cstring; a3: mlt_event_data): cint
proc mlt_events_listen*(self: mlt_properties; listener_data: pointer;
                        id: cstring; listener: mlt_listener): mlt_event
proc mlt_events_block*(self: mlt_properties; listener_data: pointer)
proc mlt_events_unblock*(self: mlt_properties; listener_data: pointer)
proc mlt_events_disconnect*(self: mlt_properties; listener_data: pointer)




proc mlt_event_inc_ref*(self: mlt_event)
proc mlt_event_block*(self: mlt_event)
proc mlt_event_unblock*(self: mlt_event)
proc mlt_event_close*(self: mlt_event)

proc mlt_event_data_none*(): mlt_event_data
proc mlt_event_data_from_int*(value: cint): mlt_event_data
proc mlt_event_data_to_int*(a1: mlt_event_data): cint
proc mlt_event_data_from_string*(value: cstring): mlt_event_data
proc mlt_event_data_to_string*(a1: mlt_event_data): cstring
proc mlt_event_data_from_frame*(a1: mlt_frame): mlt_event_data
proc mlt_event_data_to_frame*(a1: mlt_event_data): mlt_frame
proc mlt_event_data_from_object*(a1: pointer): mlt_event_data
proc mlt_event_data_to_object*(a1: mlt_event_data): pointer    
]#

#[
-				if ( pause && speed == 0.0 )
 				{
-					// Wait for last frame to be shown and then fire paused event

-					mlt_events_close_wait_for( properties, event );
-					mlt_events_fire( properties, "consumer-sdl-paused", NULL );
+					mlt_consumer_put_frame( this->active, frame );
+					if ( pause && speed == 0.0 )
+					{

+						mlt_events_fire( properties, "consumer-sdl-paused", NULL );
+					}
 				}
 			}
 			// Allow a little grace time before switching consumers on speed changes


]#