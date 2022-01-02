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

  # Create the tractor
  var tr = newTractor()

  # Create a composite transition
  # https://www.mltframework.org/plugins/TransitionComposite/
  # Position: 10%/10%
  # Size: 15%/15%
  var transComposite = newFactoryTransition(p, "composite", "10%/10%:15%x15%" )

  # Playlist
  var pl = newPlaylist()

  var clip1 = p.newMedia("./resources/big_buck_bunny_720p_2mb.mp4")
  pl.append(clip1, 0, 60)
  #close(clip1)

  var clip2 = p.newMedia( "color:red")
  pl.append(clip2, 0, 60)
  #close(clip2)

  #var track0:Producer = pl
  var ptime = getPlaytime(pl)   # Get the length of track0

  # Create the watermark track - note we NEED loader for scaling here
  # https://www.mltframework.org/plugins/ProducerPango/
  var track1 = newMedia(p, "pango" )
  track1["text"] = "Hello\nWorld"
  track1.setPosition( "in", 0 )
  track1.setPosition( "out", ptime - 1 )
  track1.setPosition( "length", ptime )

  # Make the composition cover from the beginning to the end of the playlist
  transComposite.setPosition( "in", 0 )
  transComposite.setPosition( "out", ptime - 1 )

  # Add our tracks to the multitrack (automatically converted)
  tr.connect( pl, 0 )      # We use the playlist as track0
  tr.connect( track1, 1 )  # We use the pango producer as track1 

  # Now plant the transition (the composition between the tracks)
  tr.plant( transComposite, 0, 1 )  # Plant transition between tracks 0 y 1

  # Consumer
  var sdl = newFactoryConsumer(p, "sdl2")
  sdl["terminate_on_pause"] = 1

  # From tractor to SDL2
  tr > sdl

  # Start the consumer
  sdl.run

main()