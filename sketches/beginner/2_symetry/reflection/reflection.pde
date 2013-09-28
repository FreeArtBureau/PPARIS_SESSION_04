Utils utils;

ArrayList<PVector> points; 
ArrayList<PVector> mirrored; 

void setup()
{
 
    size( 600,600 );
    utils = new Utils();
    points = new ArrayList<PVector>();
    mirrored = new ArrayList<PVector>();
    
}

void draw()
{
  
  background( 0 );
  
    PVector p0 = new PVector( 200, 150 );
    PVector p1 = new PVector( 400, 450 );
  
  stroke( 0xFF );
  line( p0.x, p0.y, p1.x, p1.y );
  
  if( mousePressed )
  {
    PVector p = new PVector( mouseX, mouseY ); 
    points.add( p );
    
    mirrored.add( utils.reflect( p, p0, p1 ) );
    
    
    
  }
      
  stroke( 0xFF,0,0 );
  drawCurve( points );
      
  stroke( 0,0xFF,0 );
  drawCurve( mirrored );
  
  
  
}

void keyPressed()
{
    points = new ArrayList<PVector>();
    mirrored = new ArrayList<PVector>();
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

