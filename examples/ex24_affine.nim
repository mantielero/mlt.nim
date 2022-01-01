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

  #aff["transition.ox"] = 340
  aff["transition.fix_rotate_x"] = 340

  clip1.attach(aff)

  clip1 > sdl

  sdl.start # Start the consumer

  while not sdl.stopped:
    sleep(1)

main()


  #echo "transition" in aff
  # mlt_filter es un puntero a mlt_filter_s (que es un objeto)
  # Filter es un objeto que contiene data (un mlt_filter)
  #var transition = newFactoryTransition(p, "affine")
  #transition["rect"] = "25%/0%:100%x100%:75%"
  #transition["fix_rotate_x"] = 100.0
  #transition["ox"] = 200
  #transition["oy"] = 200
  #var s = aff.data[].parent
  #var prop = mlt_service_properties(s.addr)
  #var tmp = mlt_properties_set_int( prop, "transition.fix_rotate_x".cstring, 340.cint)
  #var tmp = mlt_properties_set_int( mlt_filter_properties(aff.data), "transition.fix_rotate_x".cstring, 340.cint)
  #echo tmp
  #aff.setProperties("transition", transition)
  #[ 
  var aff = newFactoryFilter(p, "affine")
  var ap:Properties
  ap.data = mlt_properties_new()
  ap.set("fix_rotate_x",  100.0)
  #
  #transition["fix_rotate_x"] = 100.0
  #aff["transition.fix_rotate_x"] = 100.0
  aff.setProperties("transition", ap)
  ]#
  #[ var aff = newFactoryFilter(p, "affine")
  aff["transition.fix_rotate_x"] = 100.0 ]#

  #aff.set("transition.ox", 100)
  #[ echo "transition" in aff
  echo "background" in aff
  echo "in: ", aff.get("in")
  echo "out: ", aff.get("out")
  echo "mlt_type: ", aff.get("mlt_type")
  echo "mlt_service: ", aff.get("mlt_service") ]#
  #var tmp = mlt_properties_get_properties(mlt_filter_properties(aff.data), "transition".cstring )
  #echo $mlt_properties_serialise_yaml(tmp)
  #var affService = aff.toService

  #for i in transition.items:
  #  echo i

  #echo aff.toYaml
  #var a = mlt_factory_filter(p.data, "affine".cstring, cast[cstring](nil))
  #var props = mlt_filter_properties(a)

  #var metadata = mlt_repository_metadata(f, type, service_name);
  #echo mlt_properties_exists(props, "transition".cstring).int
  #echo $mlt_properties_serialise_yaml(props)
  #var fp:Properties = filter.toProperties(aff)
  #var tmp = filter.getProperties("out")

  #filter.
  #var filterProp:Properties = filter

  #echo "-------"
  #for i in aff.keys:
  #  echo i
  #echo "-------"
  #echo filterProp.toYAML
  #var tmp = filter.getProperties("transition")
  #for i in tmp.keys():
  #  echo i
  #tmp["fix_rotate_x"] = 200.0
  #echo "AAAA"
  #echo filter.toYaml
  #

  #[
  _events
  mlt_type
  in
  out
  background
  _unique_id
  mlt_service
  _profile

  ]#
  #[ filter["transition.fill"]    = 0
  filter["transition.distort"] = 0 ]#

  #var tmp = filter.toProperties
  #mlt_properties_pass_list(tmp.data,  that: mlt_properties;
  #                               list: cstring): cint
  #filter["transition.rect"] = "339.703, 126.468, 1430.3, 953.532, 1"
  #filter["transition.rect"]   = "0/0:1280x605"
  #[ filter["transition.valign"] = "middle"
  filter["transition.halign"] = "center"
  filter["transition.threads"] = 0
  filter["transition.fix_rotate_x"] = 340.0 ]#

  #transition.rect=0~=0/0:100%x100%;100~=45%/45%:100%x100%;120~=50%/50%:100%x100%
  #[
        <property name="background">color:#00000000</property>
        <property name="mlt_service">affine</property>
        <property name="shotcut:filter">affineSizePosition</property>
        <property name="transition.fill">1</property>
        <property name="transition.distort">0</property>
        <property name="transition.rect">339.703 126.468 1430.3 953.532 1</property>
        <property name="transition.valign">middle</property>
        <property name="transition.halign">center</property>
        <property name="shotcut:animIn">00:00:00.000</property>
        <property name="shotcut:animOut">00:00:00.000</property>
        <property name="transition.threads">0</property>
        <property name="transition.fix_rotate_x">340.304</property>

  ]#