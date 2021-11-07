#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <framework/mlt.h>

#include "io.h"

mlt_producer create_producer( char *file )
{
	mlt_producer result = NULL;

	// 1st Line preferences
	if ( strstr( file, ".melt" ) )
	{
		char *args[ 2 ] = { file, NULL };
		result = mlt_factory_producer( "melt", args );
	}
	else if ( strstr( file, ".mpg" ) )
		result = mlt_factory_producer( "mcmpeg", file );
	else if ( strstr( file, ".mpeg" ) )
		result = mlt_factory_producer( "mcmpeg", file );
	else if ( strstr( file, ".dat" ) )
		result = mlt_factory_producer( "mcmpeg", file );
	else if ( strstr( file, ".dv" ) )
		result = mlt_factory_producer( "mcdv", file );
	else if ( strstr( file, ".dif" ) )
		result = mlt_factory_producer( "mcdv", file );
	else if ( strstr( file, ".jpg" ) )
		result = mlt_factory_producer( "pixbuf", file );
	else if ( strstr( file, ".JPG" ) )
		result = mlt_factory_producer( "pixbuf", file );
	else if ( strstr( file, ".jpeg" ) )
		result = mlt_factory_producer( "pixbuf", file );
	else if ( strstr( file, ".png" ) )
		result = mlt_factory_producer( "pixbuf", file );

	// 2nd Line fallbacks
	if ( result == NULL && strstr( file, ".dv" ) )
		result = mlt_factory_producer( "libdv", file );
	else if ( result == NULL && strstr( file, ".dif" ) )
		result = mlt_factory_producer( "libdv", file );

	return result;
}

void transport_action( mlt_producer producer, char *value )
{
	mlt_properties properties = mlt_producer_properties( producer );

	switch( value[ 0 ] )
	{
		case 'q':
			mlt_properties_set_int( properties, "done", 1 );
			break;
		case '0':
			mlt_producer_set_speed( producer, 1 );
			mlt_producer_seek( producer, 0 );
			break;
		case '1':
			mlt_producer_set_speed( producer, -5 );
			break;
		case '2':
			mlt_producer_set_speed( producer, -2.5 );
			break;
		case '3':
			mlt_producer_set_speed( producer, -1 );
			break;
		case '4':
			mlt_producer_set_speed( producer, -0.5 );
			break;
		case '5':
			mlt_producer_set_speed( producer, 0 );
			break;
		case '6':
			mlt_producer_set_speed( producer, 0.5 );
			break;
		case '7':
			mlt_producer_set_speed( producer, 1 );
			break;
		case '8':
			mlt_producer_set_speed( producer, 2.5 );
			break;
		case '9':
			mlt_producer_set_speed( producer, 5 );
			break;
	}
}

mlt_consumer create_consumer( char *id, mlt_producer producer )
{
	char *arg = strchr( id, ':' );
	if ( arg != NULL )
		*arg ++ = '\0';
	mlt_consumer consumer = mlt_factory_consumer( id, arg );
	if ( consumer != NULL )
	{
		mlt_properties properties = mlt_consumer_properties( consumer );
		mlt_properties_set_data( properties, "transport_callback", transport_action, 0, NULL, NULL );
		mlt_properties_set_data( properties, "transport_producer", producer, 0, NULL, NULL );
	}
	return consumer;
}

void track_service( mlt_field field, void *service, mlt_destructor destructor )
{
	mlt_properties properties = mlt_field_properties( field );
	int registered = mlt_properties_get_int( properties, "registered" );
	char *key = mlt_properties_get( properties, "registered" );
	mlt_properties_set_data( properties, key, service, 0, destructor, NULL );
	mlt_properties_set_int( properties, "registered", ++ registered );
}

void set_properties( mlt_service service, char *namevalue )
{
	mlt_properties properties = mlt_service_properties( service );
	mlt_properties_parse( properties, namevalue );
}

void transport( mlt_producer producer )
{
	mlt_properties properties = mlt_producer_properties( producer );

	term_init( );
	fprintf( stderr, "Press 'q' to continue\n" );
	while( mlt_properties_get_int( properties, "done" ) == 0 )
	{
		int value = term_read( );
		if ( value != -1 )
			transport_action( producer, ( char * )&value );
	}
}

int main( int argc, char **argv )
{
	int i;
	mlt_service  service = NULL;
	mlt_consumer consumer = NULL;
	mlt_producer producer = NULL;
	mlt_playlist playlist = NULL;

	// Construct the factory
	mlt_factory_init( getenv( "MLT_REPOSITORY" ) );

	// Set up containers
	playlist = mlt_playlist_init( );

	// Parse the arguments
	for ( i = 1; i < argc; i ++ )
	{
		if ( !strcmp( argv[ i ], "-consumer" ) )
		{
			consumer = create_consumer( argv[ ++ i ], mlt_playlist_producer( playlist ) );
			if ( consumer != NULL )
				service = mlt_consumer_service( consumer );
		}
		else if ( !strstr( argv[ i ], "=" ) )
		{
			if ( producer != NULL )
				mlt_playlist_append( playlist, producer );
			producer = create_producer( argv[ i ] );
			if ( producer != NULL )
				service = mlt_producer_service( producer );
		}
		else
		{
			set_properties( service, argv[ i ] );
		}
	}

	// If we have no consumer, default to sdl
	if ( consumer == NULL )
		consumer = create_consumer( "sdl", mlt_playlist_producer( playlist ) );

	// Connect producer to playlist
	if ( producer != NULL )
		mlt_playlist_append( playlist, producer );

	// Connect consumer to playlist
	mlt_consumer_connect( consumer, mlt_playlist_service( playlist ) );

	// Transport functionality
	transport( mlt_playlist_producer( playlist ) );

	// Close the services
	mlt_consumer_close( consumer );
	mlt_playlist_close( playlist );

	// Close the factory
	mlt_factory_close( );

	return 0;
}