# nim c -r --threads:on ex06_playlist
import mlt, os

var f = initFactory()
var p = newProfile() 

# Create a playlist
var pl = newPlaylist()

#[ var clip1 = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")
pl.append(clip1, 0, 60)
close(clip1) ]#
pl.add(p, "avformat:/home/jose/Descargas/sygic.mp4", 0, 60)

#var clip2 = newFactoryProducer(p, resource = "color:red")
#pl.append(clip2, 0, 60)
#close(clip2)
pl.add(p,"color:red", 0, 60)

# Consumer
var sdl = newFactoryConsumer(p, "sdl2")
sdl["terminate_on_pause"] = 1
# Connect the producer to the consumer
pl > sdl

# Start the consumer
sdl.start

while not sdl.stopped:
  sleep(1)
