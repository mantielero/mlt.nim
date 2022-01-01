# nim c -r ex16_query_profiles
import mlt

proc main =
  var f:Repository = initFactory("/usr/lib/mlt-7")
  var consumer:Consumer 
  consumer.data = mlt_factory_consumer( nil, "avformat", nil )
  consumer["acodec"] = "list"
  consumer.start
  consumer.stop

main()


#[
static void query_acodecs( )
{
	mlt_consumer consumer = mlt_factory_consumer( NULL, "avformat", NULL );
	if ( consumer )
	{
		mlt_properties_set( MLT_CONSUMER_PROPERTIES(consumer), "acodec", "list" );
		mlt_consumer_start( consumer );
		mlt_consumer_close( consumer );
	}
	else
	{
		fprintf( stdout, "# No audio codecs - failed to load avformat consumer\n" );
	}
}

]#
