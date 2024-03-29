import ../wrapper/mlt
import typs, os, factory, properties
import std/strutils


proc close*(self:Producer) =
  mlt_producer_close(self.data)

converter toService*(self:Producer):Service =
  ## Get the parent service object.
  result.data = mlt_producer_service(self.data)


proc getPlaytime*(self:Producer):int =
  mlt_producer_get_playtime(self.data)


converter toProperties*(self:Producer):Properties =
  ## Get the parent service object.
  result.data = mlt_producer_properties(self.data)


proc width*(self:Producer):int =
  self.getInt("width").int #.parseInt

proc height*(self:Producer):int =
  self.getInt("height").int #.parseInt

proc sampleAspect*(self:Producer):tuple[num,den:int] =
  (self.getInt("meta.media.sample_aspect_num"), self.getInt("meta.media.sample_aspect_den"))

proc sampleAspectAsFloat*(self:Producer):float =
  self.getFloat("aspect_ratio")

#[
(key: "meta.media.sample_aspect_num", value: "8")
(key: "meta.media.sample_aspect_den", value: "9")
(key: "aspect_ratio", value: "0,888889")

]#
#[
proc mlt_producer_init*(self: mlt_producer; child: pointer): cint

proc mlt_producer_new*(a1: mlt_profile): mlt_producer





proc mlt_producer_seek*(self: mlt_producer; position: mlt_position): cint

proc mlt_producer_seek_time*(self: mlt_producer; time: cstring): cint

proc mlt_producer_position*(self: mlt_producer): mlt_position

proc mlt_producer_frame*(self: mlt_producer): mlt_position

proc mlt_producer_frame_time*(self: mlt_producer; a2: mlt_time_format): cstring

proc mlt_producer_set_speed*(self: mlt_producer; speed: cdouble): cint

proc mlt_producer_get_speed*(self: mlt_producer): cdouble

proc mlt_producer_get_fps*(self: mlt_producer): cdouble

proc mlt_producer_set_in_and_out*(self: mlt_producer; `in`: mlt_position;
                                  `out`: mlt_position): cint

proc mlt_producer_clear*(self: mlt_producer): cint
proc mlt_producer_get_in*(self: mlt_producer): mlt_position

proc mlt_producer_get_out*(self: mlt_producer): mlt_position



proc mlt_producer_get_length*(self: mlt_producer): mlt_position

proc mlt_producer_get_length_time*(self: mlt_producer; a2: mlt_time_format): cstring

proc mlt_producer_prepare_next*(self: mlt_producer)
proc mlt_producer_attach*(self: mlt_producer; filter: mlt_filter): cint

proc mlt_producer_detach*(self: mlt_producer; filter: mlt_filter): cint

proc mlt_producer_filter*(self: mlt_producer; index: cint): mlt_filter

proc mlt_producer_cut*(self: mlt_producer; `in`: cint; `out`: cint): mlt_producer

proc mlt_producer_is_cut*(self: mlt_producer): cint
proc mlt_producer_is_mix*(self: mlt_producer): cint
proc mlt_producer_is_blank*(self: mlt_producer): cint

proc mlt_producer_cut_parent*(self: mlt_producer): mlt_producer

proc mlt_producer_optimise*(self: mlt_producer): cint


proc mlt_producer_get_creation_time*(self: mlt_producer): int64

proc mlt_producer_set_creation_time*(self: mlt_producer; creation_time: int64)
    
]#