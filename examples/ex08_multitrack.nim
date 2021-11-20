# nim c -r --threads:on ex08_multitrack
import mlt, os

var f = initFactory()
var p = newProfile() 

# Multi track
var tr = newTractor()

# Obtain the field
var fld = toField(tr)

# Obtain the multitrack
var mt = toMultitrack(tr)

# Create a composite transition
var transComposite = newFactoryTransition(p, "composite", "10%/10%:15%x15%" )

# Playlist
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
props.setPosition( "in", 0 )
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

var sdl = newFactoryConsumer(p, "sdl2")

producer1.toService > sdl

# Start the consumer
sdl.start

while not sdl.stopped:
  sleep(1)