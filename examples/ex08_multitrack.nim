# nim c -r ex05
{.passL: "-pthread".}
import mlt
import os

var f:Repository = initFactory("/usr/lib/mlt-7")
if f == nil:
    quit("""mlt_factory_init returned "nil"""")


var p:Profile = newProfile() 



# Multi track
var tr = newTractor()

# Obtain the field
var fld = toField(tr)

# Obtain the multitrack
var mt = toMultitrack(tr)

# Create a composite transition
var transComposite = newFactoryTransition(p, "composite", "10%/10%:15%x15%" )

# Create track 0
#    mlt_producer track0 = create_playlist( argc, argv );

var pl = newPlaylist()

var clip1 = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")
pl.append(clip1, 0, 60)
close(clip1)

var clip2 = newFactoryProducer(p, resource = "color:red")
pl.append(clip2, 0, 60)
close(clip2)

var track0:Producer = pl

# Create the watermark track - note we NEED loader for scaling here
var track1 = newFactoryProducer(p, "loader", "pango" )

# Get the length of track0
var ptime = getPlaytime(track0)

# Set the properties of track1
var props = toProperties( track1 )
props["text"] = "Hello\nWorld"
setPosition( props, "in", 0 )
setPosition( props, "out", ptime - 1 )
setPosition( props, "length", ptime )
props["a_track"] = 0
props["b_track"] = 0


# Now set the properties on the transition
var propsTransition = toProperties( transComposite )
setPosition( propsTransition, "in", 0 )
setPosition( propsTransition, "out", ptime - 1 )


# Add our tracks to the multitrack
connect( mt, track0, 0 )
connect( mt, track1, 1 )

# Now plant the transition
plantTransition( fld, transComposite, 0, 1 )


# Close our references
close( track0 )
close( track1 )
close( transComposite )

# Return the tractor
var producer1:Producer = tr


#mlt_transition transition = mlt_factor_transition( "luma", NULL );
#[ var transLuma = newFactoryTransition(p, "luma")
mix(pl, 0, 50, transLuma)
close(transLuma) ]#


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

sdlOut > toService(producer1)  #connect( hello, filter) 
#connect( filter, world )


# Start the consumer
start(sdlOut)

while isStopped(sdlOut):
  sleep(1)

# Closing everything
close(pl)
close( sdlOut )
closeFactory()    
