# Introduction
This library wraps the [MLT Multimedia Framework](https://www.mltframework.org/) in the [Nim programming language](https://nim-lang.org/).

So far a number of examples are working: ex01 .. ex08.

They are compiled and run by means of something like:
```bash
$ nim c -r --threads:on ex01_show_version
```

# Development
## Wrapping
The library is wrapped using [nimterop](https://github.com/nimterop/nimterop). The bindings are stored under `src/wrapper`. From those bindings, a more user friendly interface is provided by means of `src/lib`.

This enables the user doing things like this:
```nim
filter["BlockSizeY"] = 0.2
```
instead of:
```nim
mlt_properties_set_double(filter, "BlockSizeY".cstring, 0.2.cdouble)
```

## Memory Management
So far only `=destroy` is implemented, so items are "closed" when they get out of scope.

To be done: [Nim destructors and move semantic](https://nim-lang.org/docs/destructors.html) in the file [src/lib/typs.nim](https://github.com/mantielero/mlt.nim/blob/master/src/lib/typs.nim).

# Events

# Profiles
They are stored here: `/usr/local/share/mlt-7/profiles/`.

We can inspect the content of those documents by means of:
```bash
$ cat /usr/local/share/mlt-7/profiles/hdv_1080_30p 
description=HDV 1440x1080p 29.97 fps
frame_rate_num=30000
frame_rate_den=1001
width=1440
height=1080
progressive=1
sample_aspect_num=4
sample_aspect_den=3
display_aspect_num=16
display_aspect_den=9
colorspace=709
```

With the profile, it will be specified how the output format. 

The default format is DV and it is created by means of:
```nim
var p = newProfile()
```
In order to load a profile from a file:
```nim
var p = loadProfile("/usr/local/share/mlt-7/profiles/hdv_720_50p")
```
This is equivalent to:
```nim
var p = newProfile("hdv_720_50p") 
```


# Getting some inspiration
## C language examples
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/dan.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/dissolve.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/hello.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/pixbuf.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/pango.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/luma.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/io.c
https://github.com/mltframework/melted/blob/65b2f6e65aa49d84541558958d7c6c8ff23a5763/src/melted/melted.c

[https://github.com/mltframework/mlt/blob/master/src/melt/melt.c](melt.c)

## Other
https://github.com/mltframework/mlt/tree/master/demo
