# nim c -r ex02
{.passL: "-pthread".}
import mlt
import os

nle "/usr/lib/mlt-7":
  var dvProfile:Profile = newProfile()
  # Create the default consumer
  var c:Consumer = newConsumer(dvProfile, "sdl2")

  # Create via the default producer
  var p:Producer = newFactoryProducer(dvProfile, resource = "avformat:/home/jose/Descargas/sygic.mp4") #salida.mp4") #"color:red")
  echo "Producer creado: ", repr p.data
  p > c 
  echo "Producer conectado"

  # Start the consumer
  start(c)
  echo "Arrancamos el consumidor"
  var n = 0
  while not stopped(c):
    sleep(1)
    echo n
    n += 1
    if n == 3000:
      discard mlt_consumer_stop(c) 
  #sleep(1000)
  #sleep(1000)
  echo "EL consumidor ha terminado"
  # Close the consumer
  c.close

  # Close the producer
  #p.close
 
echo "DONE"
#[
Fix events:

mlt_events_setup_wait_for

x04.nim:let event = consumer.mlt_consumer_properties.mlt_events_setup_wait_for("consumer-stopped")
ex04.nim:Note that the consumer is threaded - waiting for an event of some sort is always required after starting and before stopping or closing the consumer.


https://www.mltframework.org/doxygen/structmlt__consumer__s.html#a4406e166e2d4f6c240358ab6c5a57f65
https://www.mltframework.org/doxygen/structmlt__consumer__s.html#a6ee847c6d980a4e947d5755245a4cafa

https://www.mltframework.org/doxygen/structmlt__events__struct.html#ac600675dfd633161085fcae55b737206
https://www.mltframework.org/doxygen/structmlt__events__struct.html#ab0458708ca4e376469ebe40b24374032

]#

#[
Event *Properties::setup_wait_for( const char *id )
{
	return new Event( mlt_events_setup_wait_for( get_properties( ), id ) );
}

void Properties::delete_event( Event *event )
{
	delete event;
}

void Properties::wait_for( Event *event, bool destroy )
{
	mlt_events_wait_for( get_properties( ), event->get_event( ) );
	if ( destroy )
		mlt_events_close_wait_for( get_properties( ), event->get_event( ) );
}

void Properties::wait_for( const char *id )
{
	Event *event = setup_wait_for( id );
	wait_for( event );
	delete event;
}
]#

#[
            // Make an event handler for when a frame's image should be displayed
            m_consumer->listen ("consumer-frame-show", this, (mlt_listener) on_frame_show);  
]#

#[

		mlt_events_init( &server->parent );
		mlt_events_register( &server->parent, "command-received", ( mlt_transmitter )melted_command_received );
		mlt_events_register( &server->parent, "doc-received", ( mlt_transmitter )melted_doc_received );
		mlt_events_register( &server->parent, "push-received", ( mlt_transmitter )melted_push_received );
]#

#[
mlt_events_fire( owner, "command-received", &response, command, NULL );
]#