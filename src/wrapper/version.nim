# Generated @ 2021-11-06T22:54:01+01:00
# Command line:
#   /home/jose/.nimble/pkgs/nimterop-0.6.13/nimterop/toast --preprocess -m:c --prefix=mlt_ --includeDirs+=/usr/include/mlt-7/framework --pnim --dynlib=mlt --nim:/home/jose/.choosenim/toolchains/nim-1.4.8/bin/nim /usr/include/mlt-7/framework/mlt_version.h /usr/include/mlt-7/framework/mlt_property.h -o /home/jose/src/nimlang/mlt/src/wrapper2/version.nim

# const 'LIBMLT_VERSION' has unsupported value 'MLT_STRINGIZE(LIBMLT_VERSION_MAJOR.LIBMLT_VERSION_MINOR.LIBMLT_VERSION_REVISION)'
{.push hint[ConvFromXtoItselfNotNeeded]: off.}


{.pragma: impmlt_versionHdr,
  header: "/usr/include/mlt-7/framework/mlt_version.h".}
{.pragma: impmlt_versionDyn, dynlib: mlt.}
{.experimental: "codeReordering".}
{.passC: "-I/usr/include/mlt-7/framework".}
{.pragma: impmlt_propertyHdr,
  header: "/usr/include/mlt-7/framework/mlt_property.h".}
{.pragma: impmlt_propertyDyn, dynlib: mlt.}
const
  LIBMLT_VERSION_MAJOR* = 7
  LIBMLT_VERSION_MINOR* = 0
  LIBMLT_VERSION_REVISION* = 0
  LIBMLT_VERSION_INT* = ((LIBMLT_VERSION_MAJOR shl
      typeof(LIBMLT_VERSION_MAJOR)(16)) +
      typeof(LIBMLT_VERSION_MAJOR)((LIBMLT_VERSION_MINOR shl
      typeof(LIBMLT_VERSION_MAJOR)(8))) +
      typeof(LIBMLT_VERSION_MAJOR)(LIBMLT_VERSION_REVISION))
proc version_get_int*(): cint {.importc: "mlt_version_get_int", cdecl,
                                impmlt_versionDyn.}
proc version_get_major*(): cint {.importc: "mlt_version_get_major", cdecl,
                                  impmlt_versionDyn.}
proc version_get_minor*(): cint {.importc: "mlt_version_get_minor", cdecl,
                                  impmlt_versionDyn.}
proc version_get_revision*(): cint {.importc: "mlt_version_get_revision", cdecl,
                                     impmlt_versionDyn.}
proc version_get_string*(): cstring {.importc: "mlt_version_get_string", cdecl,
                                      impmlt_versionDyn.}
proc property_init*(): property {.importc: "mlt_property_init", cdecl,
                                  impmlt_propertyDyn.}
proc property_clear*(self: property) {.importc: "mlt_property_clear", cdecl,
                                       impmlt_propertyDyn.}
proc property_is_clear*(self: property): cint {.
    importc: "mlt_property_is_clear", cdecl, impmlt_propertyDyn.}
proc property_set_int*(self: property; value: cint): cint {.
    importc: "mlt_property_set_int", cdecl, impmlt_propertyDyn.}
proc property_set_double*(self: property; value: cdouble): cint {.
    importc: "mlt_property_set_double", cdecl, impmlt_propertyDyn.}
proc property_set_position*(self: property; value: position): cint {.
    importc: "mlt_property_set_position", cdecl, impmlt_propertyDyn.}
proc property_set_int64*(self: property; value: int64): cint {.
    importc: "mlt_property_set_int64", cdecl, impmlt_propertyDyn.}
proc property_set_string*(self: property; value: cstring): cint {.
    importc: "mlt_property_set_string", cdecl, impmlt_propertyDyn.}
proc property_set_data*(self: property; value: pointer; length: cint;
                        destructor: destructor; serialiser: serialiser): cint {.
    importc: "mlt_property_set_data", cdecl, impmlt_propertyDyn.}
proc property_get_int*(self: property; fps: cdouble; a3: locale_t): cint {.
    importc: "mlt_property_get_int", cdecl, impmlt_propertyDyn.}
proc property_get_double*(self: property; fps: cdouble; a3: locale_t): cdouble {.
    importc: "mlt_property_get_double", cdecl, impmlt_propertyDyn.}
proc property_get_position*(self: property; fps: cdouble; a3: locale_t): position {.
    importc: "mlt_property_get_position", cdecl, impmlt_propertyDyn.}
proc property_get_int64*(self: property): int64 {.
    importc: "mlt_property_get_int64", cdecl, impmlt_propertyDyn.}
proc property_get_string_tf*(self: property; a2: time_format): cstring {.
    importc: "mlt_property_get_string_tf", cdecl, impmlt_propertyDyn.}
proc property_get_string*(self: property): cstring {.
    importc: "mlt_property_get_string", cdecl, impmlt_propertyDyn.}
proc property_get_string_l_tf*(self: property; a2: locale_t; a3: time_format): cstring {.
    importc: "mlt_property_get_string_l_tf", cdecl, impmlt_propertyDyn.}
proc property_get_string_l*(self: property; a2: locale_t): cstring {.
    importc: "mlt_property_get_string_l", cdecl, impmlt_propertyDyn.}
proc property_get_data*(self: property; length: ptr cint): pointer {.
    importc: "mlt_property_get_data", cdecl, impmlt_propertyDyn.}
proc property_close*(self: property) {.importc: "mlt_property_close", cdecl,
                                       impmlt_propertyDyn.}
proc property_pass*(self: property; that: property) {.
    importc: "mlt_property_pass", cdecl, impmlt_propertyDyn.}
proc property_get_time*(self: property; a2: time_format; fps: cdouble;
                        a4: locale_t): cstring {.
    importc: "mlt_property_get_time", cdecl, impmlt_propertyDyn.}
proc property_interpolate*(self: property; points: UncheckedArray[property];
                           progress: cdouble; fps: cdouble; locale: locale_t;
                           interp: keyframe_type): cint {.
    importc: "mlt_property_interpolate", cdecl, impmlt_propertyDyn.}
proc property_anim_get_double*(self: property; fps: cdouble; locale: locale_t;
                               position: cint; length: cint): cdouble {.
    importc: "mlt_property_anim_get_double", cdecl, impmlt_propertyDyn.}
proc property_anim_get_int*(self: property; fps: cdouble; locale: locale_t;
                            position: cint; length: cint): cint {.
    importc: "mlt_property_anim_get_int", cdecl, impmlt_propertyDyn.}
proc property_anim_get_string*(self: property; fps: cdouble; locale: locale_t;
                               position: cint; length: cint): cstring {.
    importc: "mlt_property_anim_get_string", cdecl, impmlt_propertyDyn.}
proc property_anim_set_double*(self: property; value: cdouble; fps: cdouble;
                               locale: locale_t; position: cint; length: cint;
                               keyframe_type: keyframe_type): cint {.
    importc: "mlt_property_anim_set_double", cdecl, impmlt_propertyDyn.}
proc property_anim_set_int*(self: property; value: cint; fps: cdouble;
                            locale: locale_t; position: cint; length: cint;
                            keyframe_type: keyframe_type): cint {.
    importc: "mlt_property_anim_set_int", cdecl, impmlt_propertyDyn.}
proc property_anim_set_string*(self: property; value: cstring; fps: cdouble;
                               locale: locale_t; position: cint; length: cint): cint {.
    importc: "mlt_property_anim_set_string", cdecl, impmlt_propertyDyn.}
proc property_get_animation*(self: property): animation {.
    importc: "mlt_property_get_animation", cdecl, impmlt_propertyDyn.}
proc property_set_rect*(self: property; value: rect): cint {.
    importc: "mlt_property_set_rect", cdecl, impmlt_propertyDyn.}
proc property_get_rect*(self: property; locale: locale_t): rect {.
    importc: "mlt_property_get_rect", cdecl, impmlt_propertyDyn.}
proc property_anim_set_rect*(self: property; value: rect; fps: cdouble;
                             locale: locale_t; position: cint; length: cint;
                             keyframe_type: keyframe_type): cint {.
    importc: "mlt_property_anim_set_rect", cdecl, impmlt_propertyDyn.}
proc property_anim_get_rect*(self: property; fps: cdouble; locale: locale_t;
                             position: cint; length: cint): rect {.
    importc: "mlt_property_anim_get_rect", cdecl, impmlt_propertyDyn.}
{.pop.}
