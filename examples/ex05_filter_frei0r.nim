# nim c -r --threads:on ex05_filter_frei0r
import mlt, os
var f = initFactory()

# Create the default consumer
var p = newProfile()
var sdl = newFactoryConsumer(p, "sdl2")

# Create via the default producer
var clip = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")

var filter = newFactoryFilter(p, "frei0r.pixeliz0r")
filter["BlockSizeX"] = 0.1
filter["BlockSizeY"] = 0.2

clip   > filter
filter > sdl

# Start the consumer
sdl.start

while not sdl.stopped:
    sleep(1)