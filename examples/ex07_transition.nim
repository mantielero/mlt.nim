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
pl.append(clip1, 0, 60)
close(clip1)

var clip2 = newFactoryProducer(p, resource = "color:red")
pl.append(clip2, 0, 60)
close(clip2)

var plProducer:Producer = pl



#mlt_transition transition = mlt_factor_transition( "luma", NULL );
var transLuma = newFactoryTransition(p, "luma")
mix(pl, 0, 50, transLuma)
close(transLuma)


# Create the default consumer

var sdlOut:Consumer = newFactoryConsumer(p, "sdl2")
if sdlOut == nil:
    quit("""mlt_factory_consumer returned "nil"""")

# Connect the producer to the consumer
#if world == nil:
#    quit("""mlt_factory_producer returned "nil"""")

#connect( hello, mlt_producer_service( world ) )

#[
var filter = newFactoryFilter(p, "frei0r.pixeliz0r")

set(filter, "BlockSizeX", 0.1 )
set(filter, "BlockSizeY", 0.1 )
filter["BlockSizeY"] = 0.2
]#

sdlOut > toService(plProducer)  #connect( hello, filter) 
#connect( filter, world )


# Start the consumer
start(sdlOut)

while isStopped(sdlOut):
  sleep(1)

# Closing everything
close(pl)
close( sdlOut )
closeFactory()    
