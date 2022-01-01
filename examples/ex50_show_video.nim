# nim c --threads:on -r ex03_show_video.nim
#{.passL: "-pthread".}
import mlt
import os

proc main =
  let f = initFactory("/usr/lib/mlt-7")
  let p = newProfile("hdv_720_50p")

  # Create the consumer
  let sdl = p.outSDL2  # Creates SDL2 consumer

  # Create via the default producer
  let clip1 = p.newMedia("./resources/sygic.mp4")

  clip1 > sdl # Connect producer to consumer

  #sdl.run
  sdl.start
  while not sdl.stopped:
    sleep(1)   

main()