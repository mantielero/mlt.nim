# nim c -r ex02
# https://www.mltframework.org/docs/framework/
# https://cpp.hotexamples.com/es/examples/-/-/MLT_CONSUMER_PROPERTIES/cpp-mlt_consumer_properties-function-examples.html
# MLT_CONSUMER=xml ./ex02
{.passL: "-pthread".}# -pthread".}
#{.passL:"-L /usr/lib/mlt-7 -lmltcore".}
import mlt
import os

var f:mlt_repository = mlt_factory_init("/usr/lib/mlt-7")
if f == nil:
    quit("""mlt_factory_init returned "nil"""")


# Create the default consumer
var p:mlt_profile = mlt_profile_init(nil)
var hello:mlt_consumer = mlt_factory_consumer(p, "sdl2", nil) #mlt_profile_init(""), # "sdl2"
if hello == nil:
    quit("""mlt_factory_consumer returned "nil"""")

# Create via the default producer
var world:mlt_producer = mlt_factory_producer(mlt_profile_init("avformat"), nil,
                            "video4linux2:/dev/video1?width=320&height=240".cstring )

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

while mlt_consumer_is_stopped(hello) == 0:
    sleep(1)

# Close the consumer
mlt_consumer_close( hello )

# Close the producer
mlt_producer_close( world )


# Close the factory
mlt_factory_close( )    
