# https://github.com/mltframework/mlt/blob/master/src/mlt%2B%2B/MltProperties.cpp
##[
Properties is a combination list/dictionary of name/mlt_property pairs. It is also a base class for many of the other MLT classes.
]##
import ../wrapper/mlt
import typs, os, std/strformat


proc close*(self:Properties) =
  mlt_properties_close(self.data)

# setters
proc set*(self:Properties; name:string; value:SomeFloat) =
  let res = mlt_properties_set_double(self.data, name.cstring, value.cdouble)
  if res > 0:
    quit(&"""unable to set property "{name}" """)

proc set*(self:Properties; name, value:string) =
  let res = mlt_properties_set_string(self.data, name.cstring, value.cstring)
  if res > 0:
    quit(&"""unable to set property "{name}" """)


proc set*(self:Properties; name:string; value:int) =
  let res = mlt_properties_set_int(self.data, name.cstring, value.cint)
  if res > 0:
    quit("""unable to set property "{name}" """)

proc set*(self:Properties; name:string; value:int64) =
  let res = mlt_properties_set_int64(self.data, name.cstring, value.cint)
  if res > 0:
    quit("""unable to set property "{name}" """)



proc set*(self:Properties; name:string; values:seq[SomeNumber]) =
  var tmp = ""
  for i in 0 ..< (values.len - 2):
    tmp &= $values[i]
    tmp &= ", "
  tmp &= $values[values.len - 1]
  let res = mlt_properties_pass_list(self.data, name.cstring, tmp.cstring)
  if res > 0:
    quit("""unable to set property "{name}" """)



# set_position
proc setPosition*[T:SomeInteger](self:Properties; name:string; value:T) =
  let res = mlt_properties_set_position(self.data, name.cstring, value.int32)
  if res > 0:
    quit("""unable to set position "{name}" """)  

proc `[]=`*[T:string|SomeNumber](self:Properties; name:string; value:T) =
  set(self, name, value)


proc toYaml*(self:Properties):string =
  $mlt_properties_serialise_yaml(self.data)



# Getters
proc getKey*(self:Properties; n:int):string =
  $mlt_properties_get_name(self.data, n.cint)

proc getValue*(self:Properties; n:int):string =
  $mlt_properties_get_value(self.data, n.cint)

proc exists*(self:Properties; key:string):bool =
  let tmp = mlt_properties_exists(self.data, key.cstring).int
  if tmp > 0:
    return true
  return false


proc get*(self:Properties; key:string):string =
  $mlt_properties_get(self.data, key.cstring)

proc getInt*(self:Properties; key:string):int =
  mlt_properties_get_int(self.data, key.cstring)

proc getInt64*(self:Properties; key:string):int64 =
  mlt_properties_get_int64(self.data, key.cstring)

proc getFloat*(self:Properties; key:string):float =
  mlt_properties_get_double(self.data, key.cstring)

proc getProperties*(self:Properties; key:string):Properties =
  result.data = mlt_properties_get_properties(self.data, key.cstring )

# Sugar
proc `len`*(self:Properties):int =
  mlt_properties_count(self.data)

proc `in`*(key:string; self:Properties):bool =
  exists(self, key)

iterator keys*(self:Properties):string =
  for i in 0 ..< self.len:
    yield getKey(self,i)

iterator values*(self:Properties):string =
  for i in 0 ..< self.len:
    yield getValue(self,i)

iterator items*(self:Properties):tuple[key,value:string] =
  for i in 0 ..< self.len:
    yield (getKey(self,i), getValue(self,i))

# NOT WORKING PROPERLY
proc length*(self:Properties):int = 
  if "length" in self:
    return self.getInt("length")
  else:
    return -1
  

proc getData*(self: Properties; name: string):Properties =
  result.data = cast[ptr mlt_properties_s](mlt_properties_get_data( self.data, name.cstring, cast[ptr cint](nil) ))




proc refCount*(self:Properties):int =
  mlt_properties_ref_count(self.data).int


proc setProperties*(self:Properties; name:string; val:Properties) =
  var res = mlt_properties_set_properties(self.data, name.cstring,   val.data).int

#proc *(self: mlt_properties; name: cstring;
#                              length: ptr cint): pointer

#[
proc mlt_properties_init*(a1: mlt_properties; child: pointer): cint
proc mlt_properties_new*(): mlt_properties

proc mlt_properties_set_lcnumeric*(a1: mlt_properties; locale: cstring): cint
proc mlt_properties_get_lcnumeric*(self: mlt_properties): cstring

proc mlt_properties_load*(file: cstring): mlt_properties
proc mlt_properties_preset*(self: mlt_properties; name: cstring): cint

proc mlt_properties_inc_ref*(self: mlt_properties): cint
proc mlt_properties_dec_ref*(self: mlt_properties): cint

proc mlt_properties_ref_count*(self: mlt_properties): cint
proc mlt_properties_mirror*(self: mlt_properties; that: mlt_properties)
proc mlt_properties_inherit*(self: mlt_properties; that: mlt_properties): cint

proc mlt_properties_pass*(self: mlt_properties; that: mlt_properties;
                          prefix: cstring): cint
proc mlt_properties_pass_property*(self: mlt_properties; that: mlt_properties;
                                   name: cstring)


proc mlt_properties_set*(self: mlt_properties; name: cstring; value: cstring): cint

proc mlt_properties_set_or_default*(self: mlt_properties; name: cstring;
                                    value: cstring; def: cstring): cint

proc mlt_properties_parse*(self: mlt_properties; namevalue: cstring): cint


proc mlt_properties_get_value_tf*(self: mlt_properties; index: cint;
                                  a3: mlt_time_format): cstring

proc mlt_properties_get_data_at*(self: mlt_properties; index: cint;
                                 size: ptr cint): pointer




proc mlt_properties_get_position*(self: mlt_properties; name: cstring): mlt_position

proc mlt_properties_set_data*(self: mlt_properties; name: cstring;
                              value: pointer; length: cint; a5: mlt_destructor;
                              a6: mlt_serialiser): cint


proc mlt_properties_rename*(self: mlt_properties; source: cstring; dest: cstring): cint

proc mlt_properties_dump*(self: mlt_properties; output: File)
proc mlt_properties_debug*(self: mlt_properties; title: cstring; output: File)
proc mlt_properties_save*(a1: mlt_properties; a2: cstring): cint
proc mlt_properties_dir_list*(a1: mlt_properties; a2: cstring; a3: cstring;
                              a4: cint): cint

proc mlt_properties_is_sequence*(self: mlt_properties): cint
proc mlt_properties_parse_yaml*(file: cstring): mlt_properties





proc mlt_properties_lock*(self: mlt_properties)
proc mlt_properties_unlock*(self: mlt_properties)

proc mlt_properties_clear*(self: mlt_properties; name: cstring)


proc mlt_properties_get_time*(a1: mlt_properties; name: cstring;
                              a3: mlt_time_format): cstring
proc mlt_properties_frames_to_time*(a1: mlt_properties; a2: mlt_position;
                                    a3: mlt_time_format): cstring
proc mlt_properties_time_to_frames*(a1: mlt_properties; time: cstring): mlt_position

proc mlt_properties_get_color*(a1: mlt_properties; name: cstring): mlt_color
proc mlt_properties_set_color*(a1: mlt_properties; name: cstring;
                               value: mlt_color): cint


]#
#--------------------------------
#[

proc mlt_properties_anim_get*(self: mlt_properties; name: cstring;
                              position: cint; length: cint): cstring
proc mlt_properties_anim_set*(self: mlt_properties; name: cstring;
                              value: cstring; position: cint; length: cint): cint
proc mlt_properties_anim_get_int*(self: mlt_properties; name: cstring;
                                  position: cint; length: cint): cint
proc mlt_properties_anim_set_int*(self: mlt_properties; name: cstring;
                                  value: cint; position: cint; length: cint;
                                  keyframe_type: mlt_keyframe_type): cint
proc mlt_properties_anim_get_double*(self: mlt_properties; name: cstring;
                                     position: cint; length: cint): cdouble
proc mlt_properties_anim_set_double*(self: mlt_properties; name: cstring;
                                     value: cdouble; position: cint;
                                     length: cint;
                                     keyframe_type: mlt_keyframe_type): cint


proc mlt_properties_get_animation*(self: mlt_properties; name: cstring): mlt_animation


proc mlt_properties_set_rect*(self: mlt_properties; name: cstring;
                              value: mlt_rect): cint
proc mlt_properties_get_rect*(self: mlt_properties; name: cstring): mlt_rect
proc mlt_properties_anim_set_rect*(self: mlt_properties; name: cstring;
                                   value: mlt_rect; position: cint;
                                   length: cint;
                                   keyframe_type: mlt_keyframe_type): cint
proc mlt_properties_anim_get_rect*(self: mlt_properties; name: cstring;
                                   position: cint; length: cint): mlt_rect

proc mlt_properties_from_utf8*(properties: mlt_properties; name_from: cstring;
                               name_to: cstring): cint
proc mlt_properties_to_utf8*(properties: mlt_properties; name_from: cstring;
                             name_to: cstring): cint




proc mlt_properties_get_properties_at*(self: mlt_properties; index: cint): mlt_properties

]#


#[
Properties::Properties( ) :
	instance( NULL )
{
	instance = mlt_properties_new( );
}

Properties::Properties( bool /*dummy*/ ) :
	instance( NULL )
{
}

Properties::Properties( Properties &properties ) :
	instance( properties.get_properties( ) )
{
	inc_ref( );
}

Properties::Properties( const Properties &properties )
	: Properties(const_cast<Properties&>(properties))
{
}

Properties::Properties( mlt_properties properties ) :
	instance( properties )
{
	inc_ref( );
}

Properties::Properties( void *properties ) :
	instance( mlt_properties( properties ) )
{
	inc_ref( );
}

Properties::Properties( const char *file ) :
	instance( NULL )
{
	instance = mlt_properties_load( file );
}

Properties::~Properties( )
{
	mlt_properties_close( instance );
}

Properties &Properties::operator=(const Properties &properties)
{
	if (this != &properties)
	{
		mlt_properties_close( instance );
		instance = properties.instance;
		inc_ref( );
	}
	return *this;
}

mlt_properties Properties::get_properties( )
{
	return instance;
}

int Properties::inc_ref( )
{
	return mlt_properties_inc_ref( get_properties( ) );
}

int Properties::dec_ref( )
{
	return mlt_properties_dec_ref( get_properties( ) );
}

int Properties::ref_count( )
{
	return mlt_properties_ref_count( get_properties( ) );
}

void Properties::lock( )
{
	mlt_properties_lock( get_properties( ) );
}

void Properties::unlock( )
{
	mlt_properties_unlock( get_properties( ) );
}

void Properties::block( void *object )
{
	mlt_events_block( get_properties( ), object != NULL ? object : get_properties( ) );
}

void Properties::unblock( void *object )
{
	mlt_events_unblock( get_properties( ), object != NULL ? object : get_properties( ) );
}

int Properties::fire_event( const char *event )
{
	return mlt_events_fire( get_properties( ), event, mlt_event_data_none() );
}

bool Properties::is_valid( )
{
	return get_properties( ) != NULL;
}

int Properties::count( )
{
	return mlt_properties_count( get_properties( ) );
}

char *Properties::get( const char *name )
{
	return mlt_properties_get( get_properties( ), name );
}

int Properties::get_int( const char *name )
{
	return mlt_properties_get_int( get_properties( ), name );
}

int64_t Properties::get_int64( const char *name )
{
	return mlt_properties_get_int64( get_properties( ), name );
}

double Properties::get_double( const char *name )
{
	return mlt_properties_get_double( get_properties( ), name );
}

void *Properties::get_data( const char *name, int &size )
{
	return mlt_properties_get_data( get_properties( ), name, &size );
}

void *Properties::get_data( const char *name )
{
	return mlt_properties_get_data( get_properties( ), name, NULL );
}

int Properties::set( const char *name, const char *value )
{
	return mlt_properties_set( get_properties( ), name, value );
}

int Properties::set_string(const char *name, const char *value)
{
	return mlt_properties_set_string( get_properties( ), name, value );
}

int Properties::set( const char *name, int value )
{
	return mlt_properties_set_int( get_properties( ), name, value );
}

int Properties::set( const char *name, int64_t value )
{
	return mlt_properties_set_int64( get_properties( ), name, value );
}

int Properties::set( const char *name, double value )
{
	return mlt_properties_set_double( get_properties( ), name, value );
}

int Properties::set( const char *name, void *value, int size, mlt_destructor destructor, mlt_serialiser serialiser )
{
	return mlt_properties_set_data( get_properties( ), name, value, size, destructor, serialiser );
}

void Properties::pass_property( Properties &that, const char *name )
{
	return mlt_properties_pass_property( get_properties( ), that.get_properties( ), name );
}

int Properties::pass_values( Properties &that, const char *prefix )
{
	return mlt_properties_pass( get_properties( ), that.get_properties( ), prefix );
}

int Properties::pass_list( Properties &that, const char *list )
{
	return mlt_properties_pass_list( get_properties( ), that.get_properties( ), list );
}

int Properties::parse( const char *namevalue )
{
	return mlt_properties_parse( get_properties( ), namevalue );
}

char *Properties::get_name( int index )
{
	return mlt_properties_get_name( get_properties( ), index );
}

char *Properties::get( int index )
{
	return mlt_properties_get_value( get_properties( ), index );
}

char *Properties::get( int index , mlt_time_format format )
{
	return mlt_properties_get_value_tf( get_properties( ), index, format );
}

void *Properties::get_data( int index, int &size )
{
	return mlt_properties_get_data_at( get_properties( ), index, &size );
}

void Properties::mirror( Properties &that )
{
	mlt_properties_mirror( get_properties( ), that.get_properties( ) );
}

int Properties::inherit( Properties &that )
{
	return mlt_properties_inherit( get_properties( ), that.get_properties( ) );
}

int Properties::rename( const char *source, const char *dest )
{
	return mlt_properties_rename( get_properties( ), source, dest );
}

void Properties::dump( FILE *output )
{
	mlt_properties_dump( get_properties( ), output );
}

void Properties::debug( const char *title, FILE *output )
{
	mlt_properties_debug( get_properties( ), title, output );
}

void Properties::load( const char *file )
{
	mlt_properties properties = mlt_properties_load( file );
	if ( properties != NULL )
		mlt_properties_pass( get_properties( ), properties, "" );
	mlt_properties_close( properties );
}

int Properties::save( const char *file )
{
	return mlt_properties_save( get_properties( ), file );
}

Event *Properties::listen( const char *id, void *object, mlt_listener listener )
{
	mlt_event event = mlt_events_listen( get_properties( ), object, id, listener );
	return new Event( event );
}



bool Properties::is_sequence( )
{
	return mlt_properties_is_sequence( get_properties( ) );
}

Properties *Properties::parse_yaml( const char *file )
{
	return new Properties( mlt_properties_parse_yaml( file ) );
}

char *Properties::serialise_yaml( )
{
	return mlt_properties_serialise_yaml( get_properties( ) );
}

int Properties::preset( const char *name )
{
	return mlt_properties_preset( get_properties(), name );
}

int Properties::set_lcnumeric( const char *locale )
{
	return mlt_properties_set_lcnumeric( get_properties(), locale );
}

const char *Properties::get_lcnumeric( )
{
	return mlt_properties_get_lcnumeric( get_properties() );
}

void Properties::clear( const char *name )
{
	return mlt_properties_clear( get_properties(), name );
}

bool Properties::property_exists( const char *name )
{
	return mlt_properties_exists( get_properties(), name );
}

char *Properties::get_time( const char *name, mlt_time_format format )
{
	return mlt_properties_get_time( get_properties(), name, format );
}

char *Properties::frames_to_time( int frames, mlt_time_format format )
{
	return mlt_properties_frames_to_time( get_properties(), frames, format );
}

int Properties::time_to_frames( const char *time )
{
	return mlt_properties_time_to_frames( get_properties(), time );
}

mlt_color Properties::get_color( const char *name )
{
	return mlt_properties_get_color( get_properties(), name );
}

int Properties::set( const char *name, mlt_color value )
{
	return mlt_properties_set_color( get_properties(), name, value );
}

char *Properties::anim_get( const char *name, int position, int length )
{
	return mlt_properties_anim_get( get_properties(), name, position, length );
}

int Properties::anim_set( const char *name, const char *value, int position, int length )
{
	return mlt_properties_anim_set( get_properties(), name, value, position, length );
}

int Properties::anim_get_int( const char *name, int position, int length )
{
	return mlt_properties_anim_get_int( get_properties(), name, position, length );
}

int Properties::anim_set( const char *name, int value, int position, int length, mlt_keyframe_type keyframe_type )
{
	return mlt_properties_anim_set_int( get_properties(), name, value, position, length, keyframe_type );
}

double Properties::anim_get_double(const char *name, int position, int length)
{
	return mlt_properties_anim_get_double( get_properties(), name, position, length );
}

int Properties::anim_set( const char *name, double value, int position, int length, mlt_keyframe_type keyframe_type )
{
	return mlt_properties_anim_set_double( get_properties(), name, value, position, length, keyframe_type );
}

int Properties::set( const char *name, mlt_rect value )
{
	return mlt_properties_set_rect( get_properties(), name, value );
}

int Properties::set( const char *name, double x, double y, double w, double h, double opacity )
{
	mlt_rect value = { x, y, w, h, opacity };
	return mlt_properties_set_rect( get_properties(), name, value );
}

mlt_rect Properties::get_rect( const char *name )
{
	return mlt_properties_get_rect( get_properties(), name );
}

int Properties::anim_set( const char *name, mlt_rect value, int position, int length, mlt_keyframe_type keyframe_type )
{
	return mlt_properties_anim_set_rect( get_properties(), name, value, position, length, keyframe_type );
}

mlt_rect Properties::anim_get_rect(const char *name, int position, int length)
{
	return mlt_properties_anim_get_rect( get_properties(), name, position, length );
}

mlt_animation Properties::get_animation( const char *name )
{
	return mlt_properties_get_animation( get_properties(), name );
}

Animation *Properties::get_anim(const char *name)
{
	return new Animation( mlt_properties_get_animation( get_properties(), name ) );
}

bool Properties::is_anim(const char *name)
{
	return mlt_properties_is_anim(get_properties(), name);
}

int Properties::set( const char *name, Properties& properties )
{
	return mlt_properties_set_properties( get_properties(), name, properties.get_properties() );
}

Properties* Properties::get_props( const char *name )
{
	return new Properties( mlt_properties_get_properties( get_properties(), name ) );
}

Properties* Properties::get_props_at( int index )
{
	return new Properties( mlt_properties_get_properties_at( get_properties(), index ) );
}  
]#


#[
Event *Properties::setup_wait_for( const char *id )
{
	return new Event( mlt_events_setup_wait_for( get_properties( ), id ) );
}

void Properties::delete_event( Event *event )
{
	delete event;
}

void Properties::wait_for( Event *event, bool destroy )
{
	mlt_events_wait_for( get_properties( ), event->get_event( ) );
	if ( destroy )
		mlt_events_close_wait_for( get_properties( ), event->get_event( ) );
}

void Properties::wait_for( const char *id )
{
	Event *event = setup_wait_for( id );
	wait_for( event );
	delete event;
}  
]#