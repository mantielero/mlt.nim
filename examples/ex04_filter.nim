# nim c -r --threads:on ex04_filter
import mlt, os

var f = initFactory()

# Create the default consumer
var p = newProfile("hdv_720_50p") 
var sdl = newFactoryConsumer(p, "sdl2")

# Create via the default producer
var clip = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")

# Create filter
var filter = newFactoryFilter(p, "greyscale") # invert, tcolor, threshold

# Connect
clip > filter
filter > sdl

# Start the consumer
sdl.start

while not sdl.stopped:
  sleep(1)
