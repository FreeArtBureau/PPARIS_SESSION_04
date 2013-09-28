class Ball extends PVector
{
  PVector acc;
  PVector vel;
 
  Ball( float x, float y ) 
  {
    
    super( x, y );
    acc = new PVector();
    vel = new PVector();
    
  }
  
  void update()
  {
    
    acc.mult( .9 );
    vel.add( acc );
    super.add( vel );
    
  }
  
  void checkBounds( PApplet context )
  {
    if( x < 0 || x > context.width )
    {
     vel.x *= -1;
     acc.x *= -.9;
    }
    if( y < 0 || y > context.height ) 
    {
      vel.y *= -1;
      acc.y *= -.9;
    }
  }
  
  void render( PApplet context )
  {
    context.stroke( 0 );
    context.fill(0);
    context.ellipse( x, y, 10,10 );
  }
}
