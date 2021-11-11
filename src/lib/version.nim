import ../wrapper/mlt

proc getVersionAsInt*():int = mlt_version_get_int()

proc getVersionAsTuple*():tuple[major,minor,revision:int] =
  (major:mlt_version_get_major().int,
   minor:mlt_version_get_minor().int, 
   revision:mlt_version_get_revision().int)

proc getVersionAsString*():string =
  $mlt_version_get_string()