# nim c --threads:on -r ex23_loader_video
import mlt
import os

proc main =
  let f = initFactory("/usr/lib/mlt-7")

  # Create the consumer
  let p = newProfile("hdv_720_50p")
  var sdl = newFactoryConsumer(p, "sdl2")

  sdl["terminate_on_pause"] = 1 # Stop the consumer when finished

  # Create via the default producer
  var clip1 = p.newMedia( "./resources/sygic.mp4")

  var aff = newFactoryFilter(p, "affine")   
  aff["transition.ox"] = "0=0;100=200"
  #aff["transition.rotate_x"] = "0=0;100=360"

  clip1.attach(aff)

  clip1 > sdl

  sdl.start # Start the consumer

  while not sdl.stopped:
    sleep(1)

main()
