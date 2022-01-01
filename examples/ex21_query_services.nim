# nim c -r ex16_query_profiles
import mlt

proc main =
  var f:Repository = initFactory("/usr/lib/mlt-7")



  echo "CONSUMERS-----------"
  var consumers:Properties
  consumers.data  = mlt_repository_consumers( f.data)
  for key in consumers.keys:
    echo key

  echo "FILTERS-----------"
  var filters:Properties
  filters.data  = mlt_repository_filters( f.data)
  for key in filters.keys:
    echo key

  echo "PRODUCERS-----------"
  var producers:Properties
  producers.data  = mlt_repository_producers( f.data)
  for key in producers.keys:
    echo key

  echo "TRANSITIONS-----------"
  var transitions:Properties
  transitions.data  = mlt_repository_transitions( f.data)
  for key in transitions.keys:
    echo key

main()


#[
static void query_services( mlt_repository repo, mlt_service_type type )
{
	mlt_properties services = NULL;
	const char *typestr = NULL;
	switch ( type )
	{
		case mlt_service_consumer_type:
			services = mlt_repository_consumers( repo );
			typestr = "consumers";
			break;
		case mlt_service_filter_type:
			services = mlt_repository_filters( repo );
			typestr = "filters";
			break;
		case mlt_service_producer_type:
			services = mlt_repository_producers( repo );
			typestr = "producers";
			break;
		case mlt_service_transition_type:
			services = mlt_repository_transitions( repo );
			typestr = "transitions";
			break;
		default:
			return;
	}
	fprintf( stdout, "---\n%s:\n", typestr );
	if ( services )
	{
		int j;
		for ( j = 0; j < mlt_properties_count( services ); j++ )
		{
			const char* service_name = mlt_properties_get_name( services, j );
			if( !is_service_hidden(repo, type, service_name ) )
				fprintf( stdout, "  - %s\n", service_name );
		}
	}
	fprintf( stdout, "...\n" );
}
]#
