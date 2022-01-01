# nim c -r --threads:on ex02_show_red_window
import mlt
import os

var f:Repository = initFactory("/usr/lib/mlt-7")

# Create the default consumer
var p:Profile = newProfile() #mlt_profile_init(nil)
var sdl:Consumer = newFactoryConsumer(p, "sdl2", "PAL")

sdl["terminate_on_pause"] = 1 # Stop the consumer when finished

# Create via the default producer
#var fp = open("./resources/Star_life_cycles_red_dwarf_en.svg")
#echo type(fp)
#var pro:Producer = newFactoryProducer(p, "pixbuf", "./resources/Cc-by-nc_euro_icon.svg.png") 
var pro:Producer = newFactoryProducer(p, "loader", "./resources/demo.svg") 
#var pro:Producer
#pro.data = mlt_factory_producer(p.data, cast[cstring](nil), cast[pointer]("./resources/demo.svg".cstring))

#var pro:Producer = newFactoryProducer(p, "pixbuf", "./resources/Star_life_cycles_red_dwarf_en.svg") 
#var pro:Producer = newFactoryProducer(p, "pixbuf", fp) #") #:resource:")
#echo "ok"
#pro["resource"] = "./resources/Cc-by-nc_euro_icon.svg.png" #cast[pointer](fp)
#pro["resource"] = cast[pointer](fp)#"./resources/Star_life_cycles_red_dwarf_en.svg"
# Connect the producer to the consumer
connect( sdl, pro )

# Start the consumer
sdl.start

while not stopped( sdl ):
  sleep(1)
