# nim c -r ex16_query_profiles
import mlt

proc main =
  var f:Repository = initFactory("/usr/lib/mlt-7")
  var presets = mlt_repository_presets()

  # Export as yaml
  echo $presets.mlt_properties_serialise_yaml

#[   # Profiles names
  for profile_name in profiles.keys:
    echo profile_name

  # Get the data from a particular key
  var profile = profiles.getData("hdv_720_25p")
  echo profile.toYaml
 ]#
main()


# TODO: there is a memory problem (double free)