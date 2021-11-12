# nim c -r ex05
{.passL: "-pthread".}
import mlt
import os



# Create via the defaugreyscalelt producer
#var clip = "avformat:/home/jose/Descargas/sygic.mp4".cstring
#var world:mlt_producer = mlt_factory_producer(p, nil, clip )

var f:Repository = initFactory("/usr/lib/mlt-7")
if f == nil:
    quit("""mlt_factory_init returned "nil"""")


# Create the default consumer
var p:Profile = newProfile() #mlt_profile_init(nil)
var hello:Consumer = newFactoryConsumer(p, "sdl2")
if hello == nil:
    quit("""mlt_factory_consumer returned "nil"""")

# Create via the default producer
var world:Producer = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")

# Connect the producer to the consumer
if world == nil:
    quit("""mlt_factory_producer returned "nil"""")

connect( hello, mlt_producer_service( world ) )

var filter = newFactoryFilter(p, "frei0r.pixeliz0r")

set(filter, "BlockSizeX", 0.1 )
set(filter, "BlockSizeY", 0.1 )

connect( hello, filter) #getService(filter) 
connect( filter, getService(world) )


# Start the consumer
start(hello)

while isStopped(hello):
    sleep(1)

# Closing everything
close( hello )
close( filter )
close( world )
closeFactory()    


connect( hello, filter )
connect( filter, getService(world) )


# Start the consumer
start(hello)

while isStopped(hello):
    sleep(1)

# Closing everything
close( hello )
close( filter )
close( world )
closeFactory()    
