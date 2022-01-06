#[
It creates two tracks:
  - Track 0: Contains a playlist with two videos (a cartoon and a red video)
  - Track 1: 
]#
# nim c -r --threads:on ex08_multitrack
import mlt, strformat
import std/strutils





#[ proc addMirrorEffect( fname:string ):Tractor =
  # "0=30%/0%:50%x50%:100%; 100=20%/0%:50%x50%:100%" 
  # Get an appropriate profile
  #var profile = newProfile()

  #var clip = profile.newMedia("./resources/big_buck_bunny_720p_2mb.mp4")
  #var frame = clip.getFrame(0)
  #var height = frame.height()
  #profile.setHeight(2 * height)

  # Create the tractor
  #var tr = newTractor()
  
  #var clip1 = profile.newMedia("./resources/big_buck_bunny_720p_2mb.mp4")

  #var clip2 = profile.newMedia("./resources/big_buck_bunny_720p_2mb.mp4")
  var grad  = profile.newFactoryFilter( "frei0r.cairogradient")
  grad["0"] = "gradient_linear"
  grad["1"] = "#030303" 
  grad["2"] = 0.5
  grad["3"] = "#000000"
  grad["4"] = 1
  grad["6"] = 0.6 
  clip2.attach(grad)

  var aff2 = newFactoryFilter(profile, "affine")  
  #aff2["transition.oy"] = 1.0
  aff2["transition.fix_rotate_y"] = 180   # Mirror
  aff2["transition.rect"] = "0/90%:100%x100%:100%" #&"0%/50%:100%x100%:100%" 
  #echo height
 
  clip2.attach(aff2)

  tr.connect( clip1, 0 )      # We use the playlist as track0
  tr.connect( clip2, 1 ) 

  var compose = profile.newFactoryTransition("frei0r.addition")    

  tr.plant(compose, 0, 1)
  for i in tr.keys:
    echo i

  return tr ]#

#---------------------------------------------------------------

proc main =
  var f = initFactory()
  #var p = newProfile("hdv_720_25p") 
  var p = newProfile()

  echo p.dar, " ", p.sar
  var v1 = p.newMedia("./resources/big_buck_bunny_360p.mp4")
  #var v1 = p.newMedia("./resources/big_buck_bunny_720p_2mb.mp4")  
  echo "v1 DAR: ", v1.sampleAspect
  for i in v1.items:
    echo i
  echo p.dar, " ", p.sar

  var v2 = p.newMedia("./resources/big_buck_bunny_360p.mp4")
  v2.mirroredGradient
  #var v2 = p.newMedia("./resources/big_buck_bunny_720p_2mb.mp4")   
  #echo "v2 DAR: ", v2.sampleAspect
  #var gray = p.newFactoryFilter("grayscale")
  #v2.attach(gray)
  var (newProducer, profile) = stackVertically( v1, v2 )
 
  #echo profile.sampleAspect
  #echo profile.displayAspect 
  #var v3 = profile.newMedia("./resources/big_buck_bunny_360p.mp4")


  #p.setHeight()
  # Create the tractor
  #var tr = newTractor()

  #var v1 = addMirrorEffect( "./resources/big_buck_bunny_720p_2mb.mp4" )
  #var v2, profile = p.addMirrorEffect( "./resources/big_buck_bunny_720p_2mb.mp4", xin="50%", xout= "30%" )

  # Add our tracks to the multitrack (automatically converted)
  #tr.connect(v1, 0)
  #tr.connect(v2, 1)  

  # Now plant the transition (the composition between the tracks)
  #var sum1 = p.newFactoryTransition("frei0r.addition") 
  #var compose = p.newFactoryTransition("frei0r.alphaover")
  #var compose = p.newFactoryTransition("frei0r.alphaout")  
  #var compose = p.newFactoryTransition("frei0r.alphaatop")   
  #var compose = p.newFactoryTransition("frei0r.cairoblend")
  #var compose = p.newFactoryTransition("frei0r.composition")  
  #compose["0"] = 0.5 
  #compose["1"] = "add"#"overlay"
  #var ptime = getPlaytime(v1) 
  #compose.setPosition( "in", 0 )
  #compose.setPosition( "out", 50)#ptime - 1 )

  #tr.plant(compose, 1, 0)
  #var aff1 = newFactoryFilter(p, "affine")  
  #aff2["transition.fix_rotate_y"] = 180   # Mirror
  #aff1["transition.rect"] = &"0%/0%:50%x50%:100%"  
  #tr.plant(aff1, 0)

  # Consumer
  var sdl = profile.newFactoryConsumer( "sdl2" )
  sdl["terminate_on_pause"] = 1

  # From tractor to SDL2
  #v1.attach(aff1)
  newProducer > sdl
  #v3 > sdl  

  # Start the consumer
  sdl.run

main()

#[
$ cat /usr/share/mlt-7/profiles/hdv_720_50p 
description=HD 720p 50 fps
frame_rate_num=50
frame_rate_den=1
width=1280
height=720
progressive=1
sample_aspect_num=1
sample_aspect_den=1
display_aspect_num=16
display_aspect_den=9
colorspace=709

]#

#[
PAR=Pixel Aspect Ratio
DAR=Display Aspect Ratio
SAR= Storage Aspect Ratio (ratio of pixels dimensions)

SAR × PAR = DAR.

SAR= 720/360 = 2
DAR= 16/9

PAR = DAR/ SAR = 16/9 /2 = 16 / 18

]#