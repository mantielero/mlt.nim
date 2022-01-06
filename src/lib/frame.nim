import ../wrapper/mlt
import typs, os

proc getImage*(frame:Frame):tuple[width,height:int] =
  var imagePtrPtr:ptr ptr uint8
  var formatPtr:ptr mlt_image_format
  var widthPtr:ptr cint
  var heightPtr:ptr cint
  let writable:int = 0
  var ret = mlt_frame_get_image(frame.data,
                    imagePtrPtr, formatPtr, widthPtr, heightPtr,
                    writable.cint)
  if ret > 0:
    quit("something failed while getting the image from a frame")
  var width  = cast[cint](widthPtr).int
  var height = cast[cint](heightPtr).int  
  return (width, height)

proc width*(frame:Frame):int =
  var (width, _) = getImage(frame)
  return width

proc height*(frame:Frame):int =
  var (_, height) = getImage(frame)
  return height

#[

  echo "Width: ", cast[cint](widthPtr).int
]#