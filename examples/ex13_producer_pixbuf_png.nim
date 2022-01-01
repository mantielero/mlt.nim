# nim c -r --threads:on ex02_show_red_window
import mlt
import os

var f:Repository = initFactory("/usr/lib/mlt-7")

# Create the default consumer
var p:Profile = newProfile("square_pal_wide") #mlt_profile_init(nil)
var sdl:Consumer = newFactoryConsumer(p, "sdl2")

sdl["terminate_on_pause"] = 1 # Stop the consumer when finished

# Create via the default producer
var pro:Producer = newFactoryProducer(p, "loader", "./resources/Cc-by-nc_euro_icon.svg.png") 

connect( sdl, pro )

# Start the consumer
sdl.start

while not stopped( sdl ):
  sleep(1)
