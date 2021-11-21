import ../wrapper/mlt, properties
import typs, os, std/strformat


proc listConsumers*(repo:Repository):seq[string] =
  var props:Properties
  props.data = mlt_repository_consumers( repo.data )
  result = @[]
  for i in props.keys:
    result &= i

proc listProducers*(repo:Repository):seq[string] =
  var props:Properties
  props.data = mlt_repository_producers( repo.data )
  result = @[]
  for i in props.keys:
    result &= i

proc listFilters*(repo:Repository):seq[string] =
  var props:Properties
  props.data = mlt_repository_filters( repo.data )
  result = @[]
  for i in props.keys:
    result &= i


proc listTransitions*(repo:Repository):seq[string] =
  var props:Properties
  props.data = mlt_repository_transitions( repo.data )
  result = @[]
  for i in props.keys:
    result &= i

#[
proc mlt_repository_init*(directory: cstring): mlt_repository
proc mlt_repository_register*(self: mlt_repository;
                              service_type: mlt_service_type; service: cstring;
                              a4: mlt_register_callback)
proc mlt_repository_create*(self: mlt_repository; profile: mlt_profile;
                            `type`: mlt_service_type; service: cstring;
                            arg: pointer): pointer
proc mlt_repository_close*(self: mlt_repository)



proc mlt_repository_links*(self: mlt_repository): mlt_properties

proc mlt_repository_transitions*(self: mlt_repository): mlt_properties
proc mlt_repository_register_metadata*(self: mlt_repository;
                                       `type`: mlt_service_type;
                                       service: cstring;
                                       a4: mlt_metadata_callback;
                                       callback_data: pointer)
proc mlt_repository_metadata*(self: mlt_repository; `type`: mlt_service_type;
                              service: cstring): mlt_properties
proc mlt_repository_languages*(self: mlt_repository): mlt_properties
proc mlt_repository_presets*(): mlt_properties
]#