import mlt, os

let tmp = mlt_factory_init(nil)#"/usr/lib/mlt")
let profile =  mlt_profile_init(nil) #"pal")
#echo repr profile
let producer = mlt_factory_producer( profile, nil, "/home/jose/media/teresa.vob".cstring )#mlt_producer( profile, "/home/jose/media/teresa.vob" )
#echo "PRODUCER:"
#echo repr producer
#echo producer.is_valid()
let consumer = mlt_factory_consumer( profile, nil, "sdl".cstring )
#consumer.connect(producer)
# Connect consumer to melt
let tmp2 = mlt_consumer_connect( consumer, mlt_producer_service( producer ) )


let event = consumer.mlt_consumer_properties.mlt_events_setup_wait_for("consumer-stopped" )
let tmp3 = mlt_consumer_start(consumer)

while mlt_consumer_is_stopped( consumer ) == 0:
    sleep(1000)


# Close the consumer
mlt_consumer_close( consumer )

# Close the producer
mlt_producer_close( producer )

# Close the factory
mlt_factory_close()
#mlt_producer_properties


#[
#include <stdio.h>
#include <unistd.h>
#include <framework/mlt.h>

int main( int argc, char *argv[] )
{
    // Initialise the factory
    if ( mlt_factory_init( NULL ) == 0 )
    {
        // Create the default consumer
        mlt_consumer hello = mlt_factory_consumer( NULL, NULL );

        // Create via the default producer
        mlt_producer world = mlt_factory_producer( NULL, argv[ 1 ] );

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
]#