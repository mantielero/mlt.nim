#[
It creates two tracks:
  - Track 0: Contains a playlist with two videos (a cartoon and a red video)
  - Track 1: 
]#
# nim c -r --threads:on ex08_multitrack
import mlt, strformat

proc addMirrorEffect(p:Profile; fname:string; xin:string = "0%";xout:string = "0%";opacity = "100%"):Tractor =
  # "0=30%/0%:50%x50%:100%;100=20%/0%:50%x50%:100%" 
  # Create the tractor
  var tr = newTractor()

  # Playlist
  var pl1 = newPlaylist()
  var clip1 = p.newMedia("./resources/big_buck_bunny_720p_2mb.mp4")
  var ptime = getPlaytime(clip1) 
  pl1.append(clip1, 0, 200)
  var aff1 = newFactoryFilter(p, "affine")  
  
  if xin == xout:
    #echo &"{xin}/0%:50%x50%:100%"
    aff1["transition.rect"] = &"{xin}/0%:50%x50%:{opacity}"
  else:
    #echo &"0:{xin}/0%:50%x50%:100%; {ptime-1}:{xout}/0%:50%x50%:100%"  
    aff1["transition.rect"] = &"0={xin}/0%:50%x50%:100%; {ptime-1}={xout}/0%:50%x50%:{opacity}" 
  clip1.attach(aff1)

  var pl2   = newPlaylist()
  var clip2 = p.newMedia("./resources/big_buck_bunny_720p_2mb.mp4")
  var grad  = p.newFactoryFilter( "frei0r.cairogradient")
  grad["0"] = "gradient_linear"
  grad["1"] = "#030303" 
  grad["2"] = 0.5
  grad["3"] = "#000000"
  grad["4"] = 1
  grad["6"] = 0.6 
  clip2.attach(grad)
  pl2.append(clip2, 0, 200)

  var aff2 = newFactoryFilter(p, "affine")  
  aff2["transition.fix_rotate_y"] = 180   # Mirror
  if xin == xout:
    aff2["transition.rect"] = &"{xin}/50%:50%x50%:100%"
  else:    
    echo &"0:{xin}/50%:50%x50%:100%; {ptime-1}:{xout}/50%:50%x50%:{opacity}"  
    aff2["transition.rect"] = &"0={xin}/50%:50%x50%:100%; {ptime-1}={xout}/50%:50%x50%:{opacity}"  
  clip2.attach(aff2)

  tr.connect( pl1, 0 )      # We use the playlist as track0
  tr.connect( pl2, 1 ) 

  var compose = p.newFactoryTransition("frei0r.addition")    

  tr.plant(compose, 0, 1)
  return tr

proc main =
  var f = initFactory()
  var p = newProfile("hdv_720_50p") 

  # Create the tractor
  var tr = newTractor()

  var v1 = p.addMirrorEffect( "./resources/big_buck_bunny_720p_2mb.mp4", opacity = "0%" )
  var v2 = p.addMirrorEffect( "./resources/big_buck_bunny_720p_2mb.mp4", xin="50%", xout= "30%", opacity = "100%" )
  
  #var transparent = p.newFactoryFilter("frei0r.transparency")
  #transparent["0"] = 0.0
  #v2.attach(transparent)
  # Add our tracks to the multitrack (automatically converted)
  tr.connect(v1, 0)
  tr.connect(v2, 1)  

  # Now plant the transition (the composition between the tracks)
  #var sum1 = p.newFactoryTransition("frei0r.addition") 
  #var compose = p.newFactoryTransition("frei0r.alphaover")
  #var compose = p.newFactoryTransition("frei0r.alphaout")  
  #var compose = p.newFactoryTransition("frei0r.alphaatop")   
  #var compose = p.newFactoryTransition("frei0r.cairoblend")
  var compose = p.newFactoryTransition("frei0r.composition")  
  #compose["0"] = 0.5 
  #compose["1"] = "add"#"overlay"
  var ptime = getPlaytime(v1) 
  compose.setPosition( "in", 0 )
  compose.setPosition( "out", 50)#ptime - 1 )

  tr.plant(compose, 1, 0)

  # Consumer
  var sdl = newFactoryConsumer(p, "sdl2")
  sdl["terminate_on_pause"] = 1

  # From tractor to SDL2
  tr > sdl

  # Start the consumer
  sdl.run

main()