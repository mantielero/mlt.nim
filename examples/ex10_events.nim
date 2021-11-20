# nim c --threads:on -r ex03_show_video.nim
#{.passL: "-pthread".}
import mlt
import os



#[ void MltController::on_frame_show (mlt_consumer, void* self, mlt_frame frame_ptr)
{
    MltController* controller = static_cast<MltController*> (self);
    Mlt::Frame* frame = new Mlt::Frame (frame_ptr);
    emit controller->frameReceived (frame, (unsigned) mlt_frame_get_position (frame_ptr));
}
 ]#
# Create via the default producer
#var clip = "avformat:/home/jose/Descargas/sygic.mp4".cstring
#var world:mlt_producer = mlt_factory_producer(p, nil, clip )
var f:Repository = initFactory("/usr/lib/mlt-7")

# Create the default consumer
#var p:Profile = newProfile() #mlt_profile_init(nil)
#var p = loadProfile("/usr/local/share/mlt-7/profiles/hdv_720_50p")  # hdv_1080_30p
var p = newProfile("hdv_720_50p")  # hdv_1080_30p
#echo p.fps
var hello:Consumer = newFactoryConsumer(p, "sdl2")

# Make an event handler for when a frame's image should be displayed
#            m_consumer->listen ("consumer-frame-show", this, (mlt_listener) on_frame_show);
#var e:mlt_event = mlt_events_listen(hello,  listener_data: pointer;
#                        id: cstring; listener: mlt_listener)

# Create via the default producer
var world:Producer = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")

#[ for i in 0 ..< world.len:
  let name:string = $mlt_properties_get_name(world.data, i.cint)
  let value:string = $mlt_properties_get_value(world.data, i.cint)
  echo name, " ", value ]#

#[ for i in world.keys:
  echo i

for i in world.values:
  echo i  

for i in world.items:
  echo i ]#
#[ echo world.getInt("length")
echo world.exists("length")
echo world.exists("lengthn")
echo "length" in world ]#
#var tmp:Properties = world
#echo tmp
#echo "PROPERTIES: ", repr tmp
#var tmp2 = toYaml( tmp )

#[ if tmp2.isNil:
    echo "mal"#repr tmp2
else:
    echo repr tmp2 ]#
#echo $mlt_properties_serialise_yaml(world.data)
# Connect the producer to the consumer
connect( hello, world )


# Start the consumer
start(hello)

#[
We wait until the consumer is stopped (in this case, by the action of the user closing 
the SDL window).

Note that the consumer is threaded - waiting for an event of some sort is always 
required after starting and before stopping or closing the consumer.    
]#

# Wait for last frame to be shown and then fire paused event
#var e = setupWaitFor(hello, "consumer-frame-show")
#hello.waitFor(e)

#[ while not stopped(hello):
  var e = setupWaitFor(hello, "consumer-stopped")
  hello.waitFor(e) ]#
 

let nFrames =  world.length - 1
while not stopped(hello):
  let pos = hello.position #mlt_consumer_position(hello.data).int
  #echo world.length     #<----------- NOT WORKING
  if pos == nFrames:
    hello.stop
  sleep(1)
  


#close( hello ) # Close the consumer
#close( world ) # Close the producer
#closeFactory() # Close the factory
