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


# Tutorial
## Introduction
Better read about the [MLT framework](https://www.mltframework.org/docs/framework/).
## Basic example
Taking a look at example #02:
1. Create repository (with `initFactory`)
2. Create new profile (states the kind of media -resolution, frame rate, ...-)
3. Create a consumer (ex. SDL2)
4. Create the producer (ex. color red, a video, ...)
5. Connect the producer with the consumer
6. Start the consumer
7. Wait for the stop event

## Filters
They can be added between the consumer and the producer (see example #4). An example with *frei0r* filters is shown in (example #5).

Filters can also be attached as per (example #5: `ex05_filter_frei0r_attach.nim`).

## Playlists
A playlist instance is created and clips (producers) are added to it. See example #6.

- [ ] To understand better how does the timing work.

### Transitions
When there are two clips (one after the other), transtions handles the way in which the transition takes place. See example #7.

## Multitrack
This is more the heavyweight NLE functionality. 

See example #8:
- Two tracks are created: one contains a playlist and the other contains some text.
- Besides a `composite` transtion is used in order to overlay the text over the playlist. 

- [ ] To better understand the relationship between Tractor and Multitrack. A multitrack is not a producer, so it is pulled by a tractor.


## Events
TODO: I don't really understand how can I handle this.


# TODO
## WiP
- `examples/ex31_vertical_stacking2.nim` and `src/contrib/stacking.nim`: the idea is the the proc behaves as a filter or as a producer. Waiting for support [here](https://sourceforge.net/p/mlt/mailman/mlt-devel/?viewmonth=202201&viewday=6)
## Filter
One option would be to create [transitions](https://www.mltframework.org/plugins/PluginsTransitions/) (or filters) from nim.
## Audio example
```bash
melt avformat:a.mp3 out=400 -move in=0 out=400 -track avformat:b.mp3 out=400 -transition mix in=0 out=400 a_track=0 b_track=1

melt 1.mp4 -attach volume level=20db -track bensound-buddy.mp3 -attach volume level=-10db

melt original.mp4 in = clipin out=clipout -track preview.mp3 in=clipin out=clipout
```

## Pictures example

Images:
```
melt \
photos/.all.jpg ttl=75 \
-filter luma:luma1.pgm luma.softness=0.1 luma.invert=0 \
$*

melt \
photos/.all.jpg ttl=75 \
-attach crop center=1 \
-attach affine transition.cycle=225 transition.geometry="0=0/0:100%x100%;74=-100/-100:120%x120%;75=-60/-60:110%x110%;149=0/0:110%x110%;150=0/-60:110%x110%;224=-60/0:110%x110%" \
-filter luma cycle=75 duration=25 \
-track music1.ogg \
-transition mix \
$*

melt photos/.all.jpg ttl=100 \
-filter watermark:colour:black reverse=1 composite.geometry="0=15%/15%:10%/10%; 0.1625=0/0:100%x100%; -.1625=; -1=70%/70%:10%x10%" composite.mirror_off=1 composite.cycle=100 composite.fill=1 composite.valign=c composite.halign=c \
$*
```

https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/pixbuf.c

# Examples
## Python
https://github.com/mltframework/mlt/tree/master/src/swig/python


# Notes
To modify
- from:
```
proc mlt_service_get_frame*(self: mlt_service; frame: mlt_frame_ptr; index: cint): cint {.
    importc, cdecl, impmltDyn.}
```
- to:
```
proc mlt_service_get_frame*(self: mlt_service; frame: var mlt_frame_ptr; index: cint): cint {.
    importc, cdecl, impmltDyn.}
```

and:
- from:
```
proc mlt_frame_get_image*(self: mlt_frame; buffer: ptr ptr uint8;
                          format: ptr mlt_image_format; width: ptr cint;
                          height: ptr cint; writable: cint): cint {.importc,
    cdecl, impmltDyn.}
```
- to:
```
proc mlt_frame_get_image*(self: mlt_frame; buffer: var ptr ptr uint8;
                          format: var ptr mlt_image_format; width: var ptr cint;
                          height: var ptr cint; writable: cint): cint {.importc,
    cdecl, impmltDyn.}
```