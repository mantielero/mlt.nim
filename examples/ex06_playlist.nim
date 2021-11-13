# nim c -r ex05
{.passL: "-pthread".}
import mlt
import os



var f:Repository = initFactory("/usr/lib/mlt-7")
if f == nil:
    quit("""mlt_factory_init returned "nil"""")

# Create a playlist
var p:Profile = newProfile() 

var pl = newPlaylist()

var clip1 = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")
pl.append(clip1)
close(clip1)

var clip2 = newFactoryProducer(p, resource = "color:red")
pl.append(clip2)
close(clip2)

close(pl)




# Create the default consumer

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
filter["BlockSizeY"] = 0.2

hello > filter  #connect( hello, filter) 
connect( filter, world )


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
connect( filter, world )


# Start the consumer
start(hello)

while isStopped(hello):
    sleep(1)

# Closing everything
close( hello )
close( filter )
close( world )
closeFactory()    
