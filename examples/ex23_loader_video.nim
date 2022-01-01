# nim c --threads:on -r ex23_loader_video
import mlt
import os
let f = initFactory("/usr/lib/mlt-7")

# Create the consumer
let p = newProfile("hdv_720_50p")
var sdl = newFactoryConsumer(p, "sdl2")

sdl["terminate_on_pause"] = 1 # Stop the consumer when finished

# Create via the default producer
var clip1 = newFactoryProducer(p, "loader", "/home/jose/Descargas/sygic.mp4")

clip1 > sdl # Connect producer to consumer




sdl.start # Start the consumer

while not sdl.stopped:
  sleep(1)