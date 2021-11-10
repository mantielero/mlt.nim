// gcc ex.c -o ex -lX11 -lmlt-7 
#include <stdio.h>
#include <unistd.h>
#include <mlt-7/framework/mlt.h>

int main( int argc, char *argv[] )
{
    // Initialise the factory
    if ( mlt_factory_init( NULL ) != 0 )
    {
        mlt_profile p = mlt_profile_init(NULL);

        // Create the default consumer
        mlt_consumer hello = mlt_factory_consumer( p, "sdl2", NULL );

        // Create via the default producer
        char* col = "color:red";
        mlt_producer world = mlt_factory_producer( p, NULL, "color:red" );

        // Connect the producer to the consumer
        mlt_consumer_connect( hello, mlt_producer_service( world ) );

        // Start the consumer
        mlt_consumer_start( hello );

        // Wait for the consumer to terminate
        while( !mlt_consumer_is_stopped( hello ) )
            sleep( 1 );

        // Close the consumer
        mlt_consumer_close( hello );

        // Close the producer
        mlt_producer_close( world );

        // Close the factory
        mlt_factory_close( );
    }
    else
    {
        // Report an error during initialisation
        fprintf( stderr, "Unable to locate factory modules\n" );
    }

    // End of program
    return 0;
}