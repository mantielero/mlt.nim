# nim c -r --threads:on ex07_transition
import mlt, os

var f = initFactory()
var p:Profile = newProfile() 

# Create a playlist
var pl = newPlaylist()
var clip1 = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")
pl.append(clip1, 0, 60)
close(clip1)

var clip2 = newFactoryProducer(p, resource = "color:red")
pl.append(clip2, 0, 60)
close(clip2)

# Transition
var transLuma = newFactoryTransition(p, "luma")
mix(pl, 0, 50, transLuma)
close(transLuma)

# Create the default consumer
var sdl = newFactoryConsumer(p, "sdl2")

pl > sdl

# Start the consumer
sdl.start

while not sdl.stopped:
  sleep(1)
