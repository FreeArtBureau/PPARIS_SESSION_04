void setup()
{
  size( 600,600 );
}

void draw()
{
  
  background( 0xFF );
  noFill();
  
  
  translate( 300,300 );
  
  float t = .5 + sin( millis() * 0.001 ) * .5;
  
  
  stroke( 0 );
  float radius = interpolate( t, 150, 250 );
  ellipse( 0,0, radius, radius );
  
  float angle;
  PVector p;
  
  radius = 150;
  
  //fail
  angle = lerp( t, 0, PI * 2 );
  p = new PVector(  cos( angle ) * radius * .5,
                    sin( angle ) * radius * .5 );
  stroke( 0xFF, 0, 0 );
  ellipse( p.x, p.y, 10, 10 );
  
  //yeah!
  angle = interpolate( t, 0, PI * 2 );
  p = new PVector(  cos( angle ) * radius * .5,
                    sin( angle ) * radius * .5 );
  
  stroke( 0,0xFF,0 );
  ellipse( p.x, p.y, 10, 10 );
  
  
  stroke( 0 );
  ellipse( 0, 0, radius,radius );
  line( -200, -200, interpolate( t, -200, 200), -200 );
  
  
  
}

float interpolate( float t, float a, float b )
{
  return a + ( b - a ) * t;
}


float myNorm( float value, float a, float b )
{
  return ( value - a ) / ( b - a );
}

