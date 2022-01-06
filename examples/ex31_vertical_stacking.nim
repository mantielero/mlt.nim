#[
It creates two tracks:
  - Track 0: Contains a playlist with two videos (a cartoon and a red video)
  - Track 1: 
]#
# nim c -r --threads:on ex08_multitrack
import mlt

proc main =
  var f = initFactory()
  var p = newProfile()

  var v1 = p.newMedia("./resources/big_buck_bunny_360p.mp4")

  var v2 = p.newMedia("./resources/big_buck_bunny_360p.mp4")   
  var gray = p.newFactoryFilter("grayscale")
  v2.attach(gray)

  # Call the function to stack vertically two videos.
  # The tractor and new profile are returned
  var (newProducer, profile) = stackVertically2( v1, v2 )
 
  # Consumer using the new calculated profile
  var sdl = profile.newFactoryConsumer( "sdl2" )
  sdl["terminate_on_pause"] = 1

  # From tractor to SDL2
  newProducer > sdl
 

  # Start the consumer
  sdl.run

main()
