# nim c --threads:on -r ex23_loader_video
import mlt
import os

proc main =
  let repo = initFactory("/usr/lib/mlt-7")

  # Create the consumer
  let p = newProfile("hdv_720_50p")

  #let sdl = p.outSDL2()
  var sdl = p.newFactoryConsumer("sdl2") #p.outSDL2()

  sdl["terminate_on_pause"] = 1 # Stop the consumer when finished

  # Create via the default producer
  var black = p.newMedia("color:black")
  var clip1 = p.newMedia( "./resources/big_buck_bunny_720p_2mb.mp4")
  var clip2 = p.newMedia( "./resources/spbtv_sample_bipbop_av1_960x540_25fps.mp4")  


  # Create a playlist
  var pl = newPlaylist()
  pl.append(black, 0, 49)
  pl.append(clip1, 0, 200)
  pl.append(clip2, 0, 200)


  # Transition
  var transLuma1 = newFactoryTransition(p, "luma")
  var transLuma2 = newFactoryTransition(p, "luma")  
  pl.mix(0, 50, transLuma1)
  pl.mix(1, 50, transLuma2)  
  pl > sdl

  sdl.run

main()

#[
Fundido de negro al vídeo:
melt colour:black out=59 ./resources/big_buck_bunny_720p_2mb.mp4 in=0 out=200 -mix 60 -mixer luma

Empieza y termina el fundido en negro:
melt colour:black out=59 ./resources/big_buck_bunny_720p_2mb.mp4 in=0 out=120 -mix 60 -mixer luma colour:black out=59 -mix 60 -mixer luma


]#

#[
#!/bin/sh
melt \
  colour:black out=59 $VIDEO1 in=0 out=600 -mix 60 -mixer luma \
  colour:black out=59 -mix 60 -mixer luma \
  colour:black out=59 $VIDEO2 in=0 out=600 -mix 60 -mixer luma \
  colour:black out=59 -mix 60 -mixer luma \
  colour:black out=59 $VIDEO3 in=0 out=600 -mix 60 -mixer luma \
  colour:black out=59 -mix 60 -mixer luma \
  -audio-track $AUDIO out=1802 -attach-track volume:0db end=-70db in=1703 out=1802 \
  -transition mix in=0 out=1802
]#
