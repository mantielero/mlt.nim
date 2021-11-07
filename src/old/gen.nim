import os, strutils

import nimterop/[cimport, build, paths]

const
  baseDir = currentSourcePath.parentDir()/"build"

  srcDir = baseDir/"project"


static:
  cDebug()
  cDisableCaching()
  
  gitPull("https://github.com/mltframework/mlt", outdir = srcDir, plist = """
src/framework/*.h
""", checkout = "v6.20.0")

  #downloadUrl("https://hostname.com/file.h", outdir = srcDir)

cIncludeDir(srcDir/"src/framework")

#cDefine("SYMBOL", "value")

#{.passC: "flags".}
#{.passL: "flags".}

#cCompile(srcDir/"file.c")

cPlugin:
  import strutils

  proc onSymbol*(sym: var Symbol) {.exportc, dynlib.} =
    sym.name = sym.name.strip(chars = {'_'})

cImport(srcDir/"src/framework/mlt.h", recurse = true, dynlib="libmlt.so")