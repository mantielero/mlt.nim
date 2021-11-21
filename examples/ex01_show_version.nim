# nim c -r ex01
import mlt

echo "Version:"
echo "int: ", getVersionAsInt()
echo "tuple: ", getVersionAsTuple()
echo "string: ", getVersionAsString()

var f = initFactory()



#var filters = listFilters(f)
#echo "Filters: ", filters

#var consumers = listConsumers(f)
#echo "Consumers: ", consumers

var producers = listProducers(f)
echo "Producers: ", producers