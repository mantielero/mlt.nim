# nim c -r ex02
#{.passL: "-pthread".}
import mlt
import os

nle "/usr/lib/mlt-7":
  var dvProfile:Profile = newProfile()
  # Create the default consumer
  var c:Consumer = newConsumer(dvProfile, "sdl2")

  # Create via the default producer
  var p:Producer = newFactoryProducer(dvProfile, resource = "color:red")

  p > c 

  # Start the consumer
  start(c)

  while isStopped(c):
    sleep(1)

  # Close the consumer
  c.close

  # Close the producer
  p.close
 
