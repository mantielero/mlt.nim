# nim c -r ex16_query_profiles
import mlt, os

proc main =
  var f:Repository = initFactory("/usr/lib/mlt-7")

  # Create profile if not set explicitly
  let envProfile = getEnv("MLT_PROFILE")
  var profile:Profile
  if envProfile == "":
    profile.data = mlt_profile_init( nil )
  else:
    profile.data.is_explicit = 1.cint  # Defined in the environment

  echo envProfile

  # NEXT: to udnerstand better Nim's memory management and how copy works (this could be applicable)
  #backup_profile = mlt_profile_clone( profile )

  #[
   	// Look for the consumer option to load profile settings from consumer properties
	backup_profile = mlt_profile_clone( profile );
	if ( load_consumer( &consumer, profile, argc, argv ) != EXIT_SUCCESS )
		goto exit_factory; 
  ]#


main()


#[

	// If the consumer changed the profile, then it is explicit.
	if ( backup_profile && !profile->is_explicit && (
	     profile->width != backup_profile->width ||
	     profile->height != backup_profile->height ||
	     profile->sample_aspect_num != backup_profile->sample_aspect_num ||
	     profile->sample_aspect_den != backup_profile->sample_aspect_den ||
	     profile->frame_rate_den != backup_profile->frame_rate_den ||
	     profile->frame_rate_num != backup_profile->frame_rate_num ||
	     profile->colorspace != backup_profile->colorspace ) )
		profile->is_explicit = 1;
	mlt_profile_close( backup_profile );
	backup_profile = NULL;
]#
