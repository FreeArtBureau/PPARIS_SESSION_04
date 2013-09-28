Utils utils;

ArrayList<PVector> points; 
ArrayList<PVector> rotations; 
ArrayList<PVector> rotations1; 

void setup()
{
 
    size( 600,600 );
    utils = new Utils();
    points = new ArrayList<PVector>();
    rotations = new ArrayList<PVector>();
    rotations1 = new ArrayList<PVector>();
    
}

void draw()
{
  
  background( 0 );
  
    PVector center = new PVector( 300, 300 );
  
  stroke( 0xFF );
  ellipse( center.x, center.y, 10,10 );
  ellipse( center.x, center.y, 2,2 );
  
  if( mousePressed )
  {
    
    PVector p = new PVector( mouseX, mouseY ); 
    points.add( p );
    
    rotations.add( utils.rotate( p, center, PI ) );
    
    /*
    rotations.add( utils.rotate( p, center, ( PI / 3 ) * 2 ) );
    rotations1.add( utils.rotate( p, center, -( PI / 3 ) * 2 ) );
    //*/
  }
      
  stroke( 0xFF,0,0 );
  drawCurve( points );
      
  stroke( 0xFF,0xFF,0 );
  drawCurve( rotations );
  
  stroke( 0,0,0xFF );
  drawCurve( rotations1 );
  
}

void keyPressed()
{
    points = new ArrayList<PVector>();
    rotations = new ArrayList<PVector>();
    rotations1 = new ArrayList<PVector>();
}

void drawCurve( ArrayList<PVector> points )
{
  
   PVector p, n;
   for( int i = 0; i < points.size() - 1; i++ )
   {
     
      p = points.get( i );
      n = points.get( ( i + 1 ) % points.size() );
      line( p.x, p.y, n.x, n.y );
      
   }
   
}

