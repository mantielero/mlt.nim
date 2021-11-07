import mlt
# https://github.com/mltframework/mlt/blob/master/src/swig/python/play.py
# https://github.com/harryhaaren/mltutorial/blob/master/play.cpp

# Start the mlt system
mlt.Factory().init()

# Establish a profile
profile = mlt.Profile()


# Create the producer
p = mlt.Producer( profile, "~/Descargas/sygic.mp4" )

echo repr p