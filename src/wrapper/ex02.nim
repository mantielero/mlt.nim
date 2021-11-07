# nim c -r ex02
# https://www.mltframework.org/docs/framework/
# https://cpp.hotexamples.com/es/examples/-/-/MLT_CONSUMER_PROPERTIES/cpp-mlt_consumer_properties-function-examples.html
# MLT_CONSUMER=xml ./ex02
import mlt
import os

var f:mlt_repository = mlt_factory_init(nil)
if f == nil:
    quit("""mlt_factory_init returned "nil"""")


# Create the default consumer
var p:mlt_profile
var hello:mlt_consumer = mlt_factory_consumer(nil, "sdl2", nil) #mlt_profile_init(""), # "sdl2"
if hello == nil:
    quit("""mlt_factory_consumer returned "nil"""")

# Create via the default producer
#video4linux2:/dev/video1?width=320&height=240
#""
#var world:mlt_producer = mlt_factory_producer(mlt_profile_init("avformat"), "avformat:/home/jose/Descargas/sygic.mp4", nil )
#var world:mlt_producer = mlt_factory_producer(mlt_profile_init("avformat"), "video4linux2:/dev/video1?width=320&height=240", nil ) #mlt_profile_init(""),
var world:mlt_producer = mlt_factory_producer(p, "color", "red".cstring )
# Connect the producer to the consumer
if world == nil:
    quit("""mlt_factory_producer returned "nil"""")

var res = mlt_consumer_connect( hello, mlt_producer_service( world ) )
echo "mlt_consumer_Connect: " & $res
#if res == 0:
#    quit("""mlt_consumer_connect returned "nil"""")


# Start the consumer
res = mlt_consumer_start( hello )
echo "mlt_consumer_start:" & $res
echo "mlt_consumer_is_stopped(hello):" & $mlt_consumer_is_stopped(hello)

while mlt_consumer_is_stopped(hello) > 0:
    sleep(1)

# Close the consumer
mlt_consumer_close( hello )

# Close the producer
mlt_producer_close( world )


# Close the factory
mlt_factory_close( )    

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