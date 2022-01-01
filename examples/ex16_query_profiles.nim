# nim c -r ex16_query_profiles
import mlt

proc main =
  var f:Repository = initFactory("/usr/lib/mlt-7")
  var profiles = profileList()

  # Export as yaml
  echo profiles.toYaml

  # Profiles names
  for profile_name in profiles.keys:
    echo profile_name

  # Get the data from a particular key
  var profile = profiles.getData("hdv_720_25p")
  echo profile.toYaml

main()


# TODO: there is a memory problem (double free)