##[
Factories create service objects.

The framework itself provides no services - they are provided in the form of
a plugin structure. A plugin is organised in the form of a ‘module’ and a module
can provide many services of different types.

Once the factory is initialised, all the configured services are available for use.

mlt_factory_prefix() returns the path to the location of the installed modules directory. This can be specified in the mlt_factory_init call itself, or it can be specified via the MLT_REPOSITORY environment variable, or in the absence of either of those, it will default to the install prefix/shared/mlt/modules.

mlt_environment() provides read only access to a collection of name=value pairs as shown in the following table:

Name	Description	Values
MLT_NORMALISATION	The normalisation of the system	PAL or NTSC
MLT_PRODUCER	The default producer	“loader” or other
MLT_CONSUMER	The default consumer	“sdl” or other
MLT_TEST_CARD	The default test card producer	any producer
These values are initialised from the environment variables of the same name.

As shown above, a producer can be created using the ‘default normalising’ producer, and they can also be requested by name. Filters and transitions are always requested by name - there is no concept of a ‘default’ for these.
]##
#{.passL:"-pthread".}
import ../wrapper/mlt
import typs, repository

proc initFactory*(directory:string =   ""):Repository = 
  if directory == "":
    result.data = mlt_factory_init(nil)
  else:  
    result.data = mlt_factory_init(directory.cstring)

  if result.data == nil:
    quit("mlt_factory_init returned \"nil\"")


proc newFactoryProducer*(profile: Profile; service: string = "loader";
                           resource: string = ""): Producer =
  ##[
  Fetch a producer from the repository.

  If you give NULL to service, then it will use core module's special "loader"producer to load resource. One can override this default producer by setting the environment variable MLT_PRODUCER.

  Parameters
  - profile:	the mlt_profile to use
  - service:	the name of the producer (optional, defaults to MLT_PRODUCER = "loader" by default)
  - resource:	an optional argument to the producer constructor, typically a string
  
  ]##
  result.data = mlt_factory_producer(profile.data, service.cstring, resource.cstring)
  if result.data == nil:
    quit("mlt_factory_producer returned \"nil\"")




proc newFactoryConsumer*(profile: Profile; service: string = "sdl2";
                           input: string = ""): Consumer =
  ##[
  Fetch a consumer from the repository.

  Parameters
  - profile	the mlt_profile to use
  - service	the name of the consumer (optional, defaults to MLT_CONSUMER)
  - input	an optional argument to the consumer constructor, typically a string
  Returns
  - a new consumer
  ]##
  if input == "":
    result.data = mlt_factory_consumer(profile.data, service.cstring, nil)
  else:  
    result.data = mlt_factory_consumer(profile.data, service.cstring, input.cstring)
  echo repr result.data
  if result.data == nil:
    quit("mlt_factory_consumer returned \"nil\"")

proc newFactoryFilter*(profile:Profile; name: string; input:string = "" ):Filter =
  ## Fetch a filter from the repository.
  result.data = mlt_factory_filter(profile.data, name.cstring, input.cstring) 


proc newFactoryTransition*(profile:Profile; name: string; input:string = "" ):Transition =
  result.data = mlt_factory_transition(profile.data, name.cstring, input.cstring)

proc closeFactory*() =
  ##[
  Close the factory.

  Cleanup all resources for the session.
  ]##
  mlt_factory_close()

#mlt_factory_init*(directory: cstring): mlt_repository

# Not used
proc getDirectory*():string =
  $mlt_factory_directory()


proc getRepository*():Repository = 
  result.data = mlt_factory_repository()





#[
proc mlt_environment*(name: cstring): cstring 
proc mlt_environment_set*(name: cstring; value: cstring): cint 

proc mlt_factory_event_object*(): mlt_properties 



proc mlt_factory_link*(name: cstring; input: pointer): mlt_link 



proc mlt_factory_register_for_clean_up*(`ptr`: pointer;
                                        destructor: mlt_destructor) 
]#


# More sugar

template nle*(directory:string; body:untyped):untyped = 
  var repo:Repository
  if directory == "":
    repo = initFactory()
  else:
    repo = initFactory(directory)

  if repo.data == nil:
      quit("mlt_factory_init returned \"nil\"")
  
  body

  #closeFactory()