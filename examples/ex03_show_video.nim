# nim c --threads:on -r ex03_show_video.nim
#{.passL: "-pthread".}
import mlt
import os


let f = initFactory("/usr/lib/mlt-7")

# Create the consumer
let p = newProfile("hdv_720_50p")
var sdl = newFactoryConsumer(p, "sdl2")

# Create via the default producer
var clip1 = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")

clip1 > sdl # Connect producer to consumer

sdl.start # Start the consumer

# Stop the consumer when finished
let nFrames =  clip1.length - 1
while not stopped(sdl):
  let pos = sdl.position #mlt_consumer_position(hello.data).int
  #echo world.length     #<----------- NOT WORKING
  if pos == nFrames:
    sdl.stop
  sleep(1)
