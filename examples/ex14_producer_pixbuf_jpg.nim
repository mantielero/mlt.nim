# nim c -r --threads:on ex02_show_red_window
import mlt
import os

var f:Repository = initFactory("/usr/lib/mlt-7")

# Create the default consumer
var p:Profile = newProfile() #mlt_profile_init(nil)
#echo "Profile colorspace: ", p.data.colorspace
var sdl:Consumer = newFactoryConsumer(p, "sdl2")
#echo sdl.data.colorspace
#echo "Profile colorspace: ", p.data.colorspace
#p.data.colorspace = 709
sdl["terminate_on_pause"] = 1 # Stop the consumer when finished

var pro:Producer = newFactoryProducer(p, "loader", "./resources/pexels-pixabay-97082.jpg")
#echo "Profile colorspace: ", p.data.colorspace
#echo pro.data.width, "x", pro.data.height
#echo pro
#pro["ttl"] = 2
#echo pro["width"]#, "x", pro["height"]
connect( sdl, pro )

# Start the consumer
sdl.start

while not stopped( sdl ):
  sleep(1)


#[
	// Get melt producer
	if ( argc > 1 )
		melt = mlt_factory_producer( profile, "melt", &argv[ 1 ] );

	if ( melt )
	{
		// Generate an automatic profile if needed.
		if ( ! profile->is_explicit )
		{
			mlt_profile_from_producer( profile, melt );
			mlt_producer_close( melt );
			melt = mlt_factory_producer( profile, "melt", &argv[ 1 ] );
		}

		double scale = mlt_properties_get_double(MLT_CONSUMER_PROPERTIES(consumer), "scale");
		if (scale > 0.0) {
			set_preview_scale(&profile, &backup_profile, scale);
		}
		
		// Reload the consumer with the fully qualified profile.
		// The producer or auto-profile could have changed the profile.
		load_consumer( &consumer, profile, argc, argv );

		// See if producer has consumer already attached
		if ( !store && !consumer )
		{
			consumer = MLT_CONSUMER( mlt_service_consumer( MLT_PRODUCER_SERVICE( melt ) ) );
			if ( consumer )
			{
				mlt_properties_inc_ref( MLT_CONSUMER_PROPERTIES(consumer) ); // because we explicitly close it
				mlt_properties_set_data( MLT_CONSUMER_PROPERTIES(consumer),
					"transport_callback", transport_action, 0, NULL, NULL );
			}
		}

		// If we have no consumer, default to sdl
		if ( store == NULL && consumer == NULL )
			consumer = create_consumer( profile, NULL );
	}
]#