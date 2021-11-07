## *
##  \file mlt.h
##  \brief header file for lazy client and implementation code :-)
##
##  Copyright (C) 2003-2017 Meltytech, LLC
##
##  This library is free software; you can redistribute it and/or
##  modify it under the terms of the GNU Lesser General Public
##  License as published by the Free Software Foundation; either
##  version 2.1 of the License, or (at your option) any later version.
##
##  This library is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
##  Lesser General Public License for more details.
##
##  You should have received a copy of the GNU Lesser General Public
##  License along with this library; if not, write to the Free Software
##  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
##

{.deadCodeElim: on.}
when defined(windows):
  const
    libName* = "mlt.dll"
elif defined(macosx):
  const
    libName* = "libmlt.dylib"
else:
  const
    libName* = "libmlt.so"
## * \mainpage MLT API Reference Documentation
##  \par
##  We recommend that you look in <a href="annotated.html"><b>Data Structures</b></a>
##  or <a href="files.html"><b>Files</b></a>.
##  \par
##  Additional documentation about MLT, in general, can be found on the
##  <a href="https://www.mltframework.org/docs/">MLT website</a>.
##

import
  mlt_animation, mlt_factory, mlt_frame, mlt_deque, mlt_multitrack, mlt_producer,
  mlt_transition, mlt_consumer, mlt_filter, mlt_playlist, mlt_properties, mlt_field,
  mlt_tractor, mlt_tokeniser, mlt_parser, mlt_geometry, mlt_profile, mlt_repository,
  mlt_log, mlt_cache, mlt_version, mlt_slices
