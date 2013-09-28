Utils utils;

ArrayList<PVector> points; 
ArrayList<PVector> glide; 

ArrayList<PVector> points2; 
ArrayList<PVector> glide2; 

void setup()
{
 
    size( 600,600 );
    utils = new Utils();
    reset();
    
}

void draw()
{
  
  if( mousePressed )
  {
    
    background( 0 );
  
    PVector p0 = new PVector( 200, 150 );
    PVector p1 = new PVector( 400, 450 );
  
    stroke( 0xFF );
    line( p0.x, p0.y, p1.x, p1.y );
  
    addGlide( p0, p1 );
    
  }
  
}

void addGlide( PVector p0, PVector p1 )
{
    PVector p = new PVector( mouseX, mouseY ); 
    points.add( p );
    
    p = utils.glide( p, p0, p1, 100 );
    glide.add( p );
    
    p = utils.glide( p, p0, p1, 100 );
    points2.add( p );
    
    p = utils.glide( p, p0, p1, 100 );
    glide2.add( p );
    
    stroke( 0xFF,0,0 );
    drawCurve( points );
        
    stroke( 0,0xFF,0 );
    drawCurve( glide );
    
    stroke( 0,0,0xFF );
    drawCurve( points2 );
    
    stroke( 0xFF,0xFF,0 );
    drawCurve( glide2 );
   
}

void keyPressed()
{
  reset();
  
}

void reset()
{
    points = new ArrayList<PVector>();
    glide = new ArrayList<PVector>();
    points2 = new ArrayList<PVector>();
    glide2 = new ArrayList<PVector>();
    
    background( 0 );
  
    PVector p0 = new PVector( 200, 150 );
    PVector p1 = new PVector( 400, 450 );
  
    stroke( 0xFF );
    line( p0.x, p0.y, p1.x, p1.y );
  
    
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

