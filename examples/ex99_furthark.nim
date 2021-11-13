import futhark

{.passC: "-I/usr/include/mlt/framework".}
{.passL: "-lmlt".}

type Playlist = pointer

proc mltfactoryclose*(): void {.cdecl, importc: "mlt_factory_close".}
proc mltplaylistinit*(): Playlist {.cdecl, importc: "mlt_playlist_init".}

importc:
  path "/usr/lib/gcc/x86_64-pc-linux-gnu/11.1.0/include"
  path "/usr/lib/gcc/x86_64-pc-linux-gnu/11.1.0/include-fixed"
  path "/usr/include"
  "mlt/framework/mlt.h"
  "mlt/framework/mlt_consumer.h"
  "mlt/framework/mlt_profile.h"
  "mlt/framework/mlt_playlist.h"
  "mlt/framework/mlt_producer.h"
  "mlt/framework/mlt_properties.h"
  "mlt/framework/mlt_factory.h"
  "mlt/framework/mlt_repository.h"
  "mlt/framework/mlt_service.h"
  "mlt/framework/mlt_filter.h"
  rename mlt_profile, Profile
  rename mlt_playlist, Playlist
  rename mlt_producer, Producer
  rename mlt_repository, Repository
  rename mlt_consumer, Consumer
  rename mlt_service, Service
  rename mlt_filter, Filter
  rename mlt_properties, Properties
  #rename mlt_factory_close, closeFactory

import os

proc newProfile(): Profile = mlt_profile_init(nil)
proc newPlaylist(): Playlist = mlt_playlist_init()
proc initFactory*(): Repository =
  mlt_factory_init(nil)
proc initFactory*(directory: string): Repository =
  mlt_factory_init(directory.cstring)
proc newFactoryProducer(profile: Profile; service: string = "loader";
                           resource: string = ""): Producer =
  mlt_factory_producer(profile, service.cstring, resource.cstring)
proc append*(self: Playlist; producer: Producer) =
  let res = mlt_playlist_append(self, producer)
  if res > 0:
    quit("Unable to append producer to the playlist")
proc close*(self: Playlist) =
  mlt_playlist_close(self)
proc close*(self: Producer) =
  mlt_producer_close(self)
proc newFactoryConsumer*(profile: Profile; service: string = "sdl2";
                           input: string = ""): Consumer =
  if input == "":
    mlt_factory_consumer(profile, service.cstring, nil)
  else:
    mlt_factory_consumer(profile, service.cstring, input.cstring)
proc connect*(self: Consumer, producer: Service) =
  let res = mlt_consumer_connect(self, producer).int
  if res > 0:
    quit("mlt_consumer_connect returned >0")
proc connect*(self:Filter; producer: Service; index:int = 0) =
  let res = mlt_filter_connect(self, producer, index.cint)
  if res > 0:
    quit("""mlt_consumer_connect returned >0""")
proc newFactoryFilter*(profile: Profile; name: string; input: string = "" ): Filter =
  mlt_factory_filter(profile, name.cstring, input.cstring)

proc set*(self: Properties; name: string; value: float) =
  let res = mlt_properties_set_double(self, name.cstring, value.cdouble)
  if res > 0:
    quit("""unable to set property "{name}" """)
proc set*(self: Properties; name, value: string) =
  let res = mlt_properties_set_string(self, name.cstring, value.cstring)
  if res > 0:
    quit("""unable to set property "{name}" """)
converter toService*(self: Filter): Service =
  mlt_filter_service(self)
converter toProperties*(self: Service): Properties =
  mlt_service_properties(self)
converter toProperties*(self: Filter): Properties =
  self.toService.toProperties
converter toService*(self:Producer):Service =
  ## Get the parent service object.
  mlt_producer_service(self)
proc `[]=`*[T: float or string](self: Properties; name: string; value: T) =
  set(self, name, value)
proc `>`*(self: Consumer, producer: Service) =
  connect(self, producer)
proc start*(self: Consumer) =
  let res = mlt_consumer_start(self).int
  if res > 0:
    quit("""failed to start the consumer""")
proc isStopped*(self: Consumer): bool =
  let res = mlt_consumer_is_stopped (self)
  if res == 0:
    return true
  return false
proc close*(a: Consumer) =
  mlt_consumer_close(a)
proc close*(a: Filter) =
  mlt_filter_close(a)
proc closeFactory*() =
  mlt_factory_close()

# Create a playlist
var p:Profile = newProfile()

var pl = newPlaylist()
var clip1 = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")
pl.append(clip1)
close(clip1)
var clip2 = newFactoryProducer(p, resource = "color:red")
pl.append(clip2)
close(clip2)


var f:Repository = initFactory("/usr/lib/mlt-7")
if f == nil:
    quit("""mlt_factory_init returned "nil"""")


# Create the default consumer

var hello:Consumer = newFactoryConsumer(p, "sdl2")
if hello == nil:
    quit("""mlt_factory_consumer returned "nil"""")

# Create via the default producer
var world:Producer = newFactoryProducer(p, resource = "avformat:/home/jose/Descargas/sygic.mp4")

# Connect the producer to the consumer
if world == nil:
    quit("""mlt_factory_producer returned "nil"""")

connect( hello, mlt_producer_service( world ) )

var filter = newFactoryFilter(p, "frei0r.pixeliz0r")

set(filter, "BlockSizeX", 0.1 )
set(filter, "BlockSizeY", 0.1 )
filter["BlockSizeY"] = 0.2

hello > filter  #connect( hello, filter)
connect( filter, world )

# Start the consumer
start(hello)

while isStopped(hello):
    sleep(1)

# Closing everything
close( hello )
close( filter )
close( world )
closeFactory()


connect( hello, filter )
connect( filter, world )


# Start the consumer
start(hello)

while isStopped(hello):
    sleep(1)

# Closing everything
close( hello )
close( filter )
close( world )
closeFactory()