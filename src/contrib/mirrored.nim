import wrapper/mlt
import lib/[version, factory, profile, typs, consumer, producer, filter, properties, service, playlist, transition, tractor]
import lib/[field, multitrack, events, repository, frame]

proc mirroredGradient*(video:var Producer) =
  var profile = newProfile()
  var grad  = profile.newFactoryFilter( "frei0r.cairogradient")
  grad["0"] = "gradient_linear"
  grad["1"] = "#030303" 
  grad["2"] = 0.5
  grad["3"] = "#000000"
  grad["4"] = 1
  grad["6"] = 0.6 
  video.attach(grad)

  var aff = newFactoryFilter(profile, "affine")  
  aff["transition.fix_rotate_y"] = 180  
  video.attach(aff)