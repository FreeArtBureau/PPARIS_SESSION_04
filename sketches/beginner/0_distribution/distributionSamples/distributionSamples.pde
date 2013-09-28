ArrayList<PVector> start;
ArrayList<PVector> inter;
ArrayList<PVector> end;

int type = 5;
int count = 20;
float time = 0;
Boolean jitter = false;

PRNG prng;
Distribution distribution;
Circle c;
Rectangle rect;
void setup()
{
 
  size( 600,600 );
  background( 0 );
  
  rect = new Rectangle( 100, 100, 400, 400 );
  
  prng = new PRNG( 0 );
  distribution  = new Distribution( prng );
  
  c = new Circle( 300,300, 0 );
  start = new Distribution().circular( c, count );
  
  c = new Circle( 300,300, 250 );
  end = new Distribution().circular( c, count );
  
  inter = new ArrayList<PVector>();
  
  time = 1;
  
}

void draw( )
{
  if( type != 5 )
  {
    background( 0 );
    noFill();
    stroke( 0xFF );
  }
  
  switch( type )
  { 
    //PRNG VS RANDOM
    case 0 : 
      stroke( 0x66 );
      rect( 100, 100,400,150 );
      rect( 100, 350,400,150 );
      
      stroke( 0xFF );
      for( int i = 0; i< 800; i++ )
      {
        point( 100 + i % 400, 100 + prng.random() * 150 ); 
        point( 100 + i % 400, 350 + random(1) * 150 ); 
      }
      
      inter = new ArrayList<PVector>();
      break;
    
    //CIRCULAR
    case 1 : 
    
      inter = distribution.circular( c, 50 );
      
      if( jitter ) distribution.jitterPoints( inter, 25 );
      
      for( PVector p : inter ) ellipse( p.x, p.y, 4,4 ); 
      drawCurve( inter );
  
      break;
      
    //STAR
    case 2 : 
    
      inter = distribution.star( c, c.radius *.5, 5 );
      
      if( jitter ) distribution.jitterPoints( inter, 30 );
     
      for( PVector p : inter ) ellipse( p.x, p.y, 4,4 ); 
      drawCurve( inter );
  
      break;
      
    //GRID
    case 3 : 
    
      inter = distribution.grid( rect, 10, 10 );
      
      if( jitter ) distribution.jitterPoints( inter, 25 );
      
      for( PVector p : inter ) ellipse( p.x, p.y, 4,4 ); 
      
      break;
      
    //FRAME
    case 4 : 
    
      inter = distribution.grid( rect, 10, 10, true );
      
      if( jitter ) distribution.jitterPoints( inter, 25 );
      
      for( PVector p : inter ) ellipse( p.x, p.y, 4,4 ); 
      
      break;
      
    case 5:
    
     if( time <= 0 )return;
     time -=.005;
     
     blendMode( ADD );
     colorMode( HSB, 360, 100, 100);
     stroke( color( 360 * time, 50, 40 ), .1 );
     strokeWeight( 1 );
     
     distribution.jitterPoints( end, ( 1 - time ) * 15 );
     inter = new ArrayList<PVector>();
     for( int i = 0; i < start.size(); i++ )
     {
       inter.add( getPointAt( time, start.get( i ), end.get( i ) ) );
     }
     drawCurve( inter );
     
     break;
      
  }
  
  
  
}

void keyPressed()
{
  jitter = !jitter ? true : false;
}


void mousePressed()
{
  
  time = 1;
  background( 0 );  
  prng.seed( millis() );
  
  c = new Circle( 300,300, 250 );
  end = new Distribution().circular( c, count );
  
  type++;
  type %= 6;
  
}



PVector getPointAt( float t, PVector a, PVector b )
{
  return new PVector( interpolate( t, a.x, b.x ),
                      interpolate( t, a.y, b.y )  );
}

float interpolate( float t, float a, float b )
{
  return a + ( b - a ) * t;
}

void drawCurve( ArrayList<PVector> points )
{
  
   PVector p, n;
   for( int i = 0; i < points.size(); i++ )
   {
     
      p = points.get( i );
      n = points.get( ( i + 1 ) % points.size() );
      line( p.x, p.y, n.x, n.y );
      
   }
   
}
