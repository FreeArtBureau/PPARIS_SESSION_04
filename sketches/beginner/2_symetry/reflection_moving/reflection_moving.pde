Utils utils;
import java.awt.event.*;
ArrayList<ArrayList<PVector>> shapes;
ArrayList<PVector> points; 
ArrayList<PVector> mirrored; 

Boolean isDown = false;
float angle = 0;
void setup()
{
 
    size( 600,600 );
    background( 0 );
    utils = new Utils();
    
    reset();
    addMouseWheelListener(
    new MouseWheelListener() 
    { 
      public void mouseWheelMoved( MouseWheelEvent mwe )
      { 
        mouseWheel(mwe.getWheelRotation());
      }
    }); 
}
 
void mouseWheel(int delta)
{
  //println("mouse has moved by " + delta + " units."); 
  angle += delta * PI / 180;
}

void draw()
{
  
  fill( 0,50 );
  rect( 0,0, width, height );
  
  noFill();
  
    PVector p0 = new PVector( 300 + cos( angle * PI ) * 1000, 
                              300 + sin( angle * PI ) * 1000 );
    
    PVector p1 = new PVector( 300 + cos( angle * PI + PI ) * 1000, 
                              300 + sin( angle * PI + PI ) * 1000 );
  
  stroke( 0xFF );
  line( p0.x, p0.y, p1.x, p1.y );
  ellipse( 300, 300, 10,10 );
  
  if( isDown )
  {
    PVector p = new PVector( mouseX, mouseY ); 
    points.add( p );
  }
  
  
  for( ArrayList<PVector> list : shapes )
  {
    stroke( 0xFF,0,0 );
    drawCurve( list );
    
    
    mirrored = new ArrayList<PVector>();
    for( PVector p : list )
    {
      mirrored.add( utils.reflect( p, p0, p1 ) );
    } 
    
    stroke( 0,0xFF,0 );
    drawCurve( mirrored );
  }
  
  
}

void mousePressed()
{
  isDown = true;
  points = new ArrayList<PVector>();
  shapes.add( points );
}
void mouseReleased()
{
  isDown = false;
}
void keyPressed()
{
    reset();
}

void reset()
{
    shapes = new ArrayList<ArrayList<PVector>>();
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

