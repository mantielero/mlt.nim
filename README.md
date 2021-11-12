# Introduction
This library wraps the [MLT Multimedia Framework](https://www.mltframework.org/) in the [Nim programming language](https://nim-lang.org/).



# Development
The library is wrapped using [nimterop](https://github.com/nimterop/nimterop). The bindings are stored under `src/wrapper`. From those bindings, a more user friendly interface is provided by means of `src/lib`.

This enables the user doing things like this:
```nim
filter["BlockSizeY"] = 0.2
```
instead of:
```nim
mlt_properties_set_double(filter, "BlockSizeY".cstring, 0.2.cdouble)
```

# C language examples
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/dan.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/dissolve.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/hello.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/pixbuf.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/pango.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/luma.c
https://github.com/ttill/MLT/blob/4a85b95330b0b6f7b232eda719c63a66696bf0f1/src/tests/io.c
