import ../lib/[typs, profile, producer, tractor, multitrack]
import ../lib/[repository, factory, filter, properties, field]

proc stackVertically2*( v1,v2:Producer ):tuple[tr:Tractor; p:Profile] =
  # Get an appropriate profile
  var profile = newProfile()

  var width1  = v1.width
  var height1 = v1.height  
  echo "v1: ", (width1, height1)
  var width2  = v2.width
  var height2 = v2.height    
  echo "v2: ", (width2, height2)
  profile.setWidth(width1)
  profile.setHeight(height1 + height2)
  var (PARnum1, PARden1) = v1.sampleAspect # Pixel aspect ratio
  echo "PAR1: ", (PARnum1, PARden1)  # 8/9 es igual que 16/18
  echo v1.sampleAspectAsFloat
  var SARnum1 = width1
  var SARden1 = height1
  var DARnum1 = PARnum1 * SARnum1
  var DARden1 = PARden1 * SARden1
  profile.setSampleAspect(PARnum1,  PARden1)
  profile.setDisplayAspect(DARnum1, DARden1 * 2)  
  echo $profile
  # Create the tractor
  var tr = newTractor()

  tr.connect( v1, 0 )      # We use the playlist as track0
  tr.connect( v2, 1 ) 
  var aff0 = newFactoryFilter(profile, "affine")  
  aff0["transition.valign"] = "top"
  tr.plant(aff0, 0)
  var aff1 = newFactoryFilter(profile, "affine")  
  aff1["transition.valign"] = "bottom"
  tr.plant(aff1, 1)

  var compose = profile.newFactoryTransition("frei0r.addition")    
  tr.plant(compose, 0, 1)

  return (tr, profile)

proc stackVertically*( v1,v2:Producer ):Producer =
  # Get an appropriate profile
  var profile = newProfile()

  var width1  = v1.width
  var height1 = v1.height  
  echo "v1: ", (width1, height1)
  var width2  = v2.width
  var height2 = v2.height    
  echo "v2: ", (width2, height2)
  profile.setWidth(width1)
  profile.setHeight(height1 + height2)
  var (PARnum1, PARden1) = v1.sampleAspect # Pixel aspect ratio
  echo "PAR1: ", (PARnum1, PARden1)  # 8/9 es igual que 16/18
  echo v1.sampleAspectAsFloat
  var SARnum1 = width1
  var SARden1 = height1
  var DARnum1 = PARnum1 * SARnum1
  var DARden1 = PARden1 * SARden1
  profile.setSampleAspect(PARnum1,  PARden1)
  profile.setDisplayAspect(DARnum1, DARden1 * 2)  
  echo $profile
  # Create the tractor
  var tr = newTractor()

  tr.connect( v1, 0 )      # We use the playlist as track0
  tr.connect( v2, 1 ) 
  var aff0 = newFactoryFilter(profile, "affine")  
  aff0["transition.valign"] = "top"
  tr.plant(aff0, 0)
  var aff1 = newFactoryFilter(profile, "affine")  
  aff1["transition.valign"] = "bottom"
  tr.plant(aff1, 1)

  var compose = profile.newFactoryTransition("frei0r.addition")    
  tr.plant(compose, 0, 1)

  for i in v1.items:
    echo i
  echo "TRACTOR"
  result = tr 
  for i in result.items:
    echo i
  
  result["width"] = width1
  result["height"] = height1 + height2
  result.set("aspect_ratio", v1.sampleAspectAsFloat)
  result.set("meta.media.sample_aspect_num", PARnum1) # Pixel Aspect Ratio
  result.set("meta.media.sample_aspect_den", PARden1)
  echo "  width: ", result.width
  echo "  height: ", result.height
  echo PARnum1, " ", PARden1
