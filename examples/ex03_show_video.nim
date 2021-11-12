# nim c -r ex02
# https://www.mltframework.org/docs/framework/
# https://cpp.hotexamples.com/es/examples/-/-/MLT_CONSUMER_PROPERTIES/cpp-mlt_consumer_properties-function-examples.html
{.passL: "-pthread".}
import mlt
import os



# Create via the default producer
#var clip = "avformat:/home/jose/Descargas/sygic.mp4".cstring
#var world:mlt_producer = mlt_factory_producer(p, nil, clip )

var f:Repository = initFactory("/usr/lib/mlt-7")
if f == nil:
    quit("""mlt_factory_init returned "nil"""")


# Create the default consumer
var p:Profile = newProfile() #mlt_profile_init(nil)
var hello:Consumer = newFactoryConsumer(p, "sdl2")
if hello == nil:
    quit("""mlt_factory_consumer returned "nil"""")

# Create via the default producer
var world:Producer = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")

# Connect the producer to the consumer
if world == nil:
    quit("""mlt_factory_producer returned "nil"""")

connect( hello, getService( world ) )


# Start the consumer
start(hello)

while isStopped(hello):
    sleep(1)

# Close the consumer
close( hello )

# Close the producer
close( world )


# Close the factory
closeFactory()    