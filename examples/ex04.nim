import mlt, os
#https://www.mltframework.org/docs/framework/

# Factory initialisation
# this ensures that the environment is configured and MLT can function. 
let tmp = mlt_factory_init(nil)#"/usr/lib/mlt")
let profile =  mlt_profile_init(nil) #"pal")



#[
All services are instantiated via the factories, as shown by the mlt_factory_consumer and mlt_factory_producer calls above.

There are similar factories for filters and transitions. There are details on all the standard services in services.txt.

The defaults requested here are a special case - the NULL usage requests that we use the default producers and consumers.

The default producer is “loader”. This producer matches file names to locate a service to use and attaches ‘normalising filters’ (such as scalers, deinterlacers, resamplers and field normalisers) to the loaded content - these filters ensure that the consumer gets what it asks for.

The default consumer is “sdl”. The combination of loader and sdl will provide a media player.    
]#
let producer = mlt_factory_producer( profile, nil, "/home/jose/media/teresa.vob".cstring )

let consumer = mlt_factory_consumer( profile, nil, "sdl".cstring )


#[
In this example, we connect the producer and then start the consumer. We then wait until the consumer is stopped (in this case, by the action of the user closing the SDL window) and finally close the consumer, producer and factory before exiting the application.    
]#
# Connect consumer to producer
let tmp2 = mlt_consumer_connect( consumer, mlt_producer_service( producer ) )


let event = consumer.mlt_consumer_properties.mlt_events_setup_wait_for("consumer-stopped")

#[
Note that the consumer is threaded - waiting for an event of some sort is always required after starting and before stopping or closing the consumer.
]#
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