# nim c -r --threads:on ex02_show_red_window
import mlt
import os

var f:Repository = initFactory("/usr/lib/mlt-7")

# Create the default consumer
var p:Profile = newProfile() #mlt_profile_init(nil)
var con:Consumer = newFactoryConsumer(p, "sdl2")

# Create via the default producer
var pro:Producer = newFactoryProducer(p, resource = "color:red")

# Connect the producer to the consumer
connect( con, pro )

# Start the consumer
start(con)

while not stopped(con):
  sleep(1)
