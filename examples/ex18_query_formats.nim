# nim c -r ex16_query_profiles
import mlt

proc main =
  var f:Repository = initFactory("/usr/lib/mlt-7")
  var consumer:Consumer 
  consumer.data = mlt_factory_consumer( nil, "avformat", nil )
  consumer["f"] = "list"
  consumer.start
  consumer.stop

main()

