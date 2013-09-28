class Point
{
  float x, y;
  Point()
  {
    x = y = 0;
  }
  
  Point( float x, float y )
  {
    this.x = x;
    this.y = y;
  }
  
  Point add( Point p )
  {
    return new Point( x + p.x, y + p.y );
  }
  
  void render( PApplet context, int strokeColor)
  {
    context.noFill();
    context.stroke( strokeColor );
    context.ellipse( x, y, 10, 10 );
  }
  
  void render( PApplet context, int strokeColor, int fillColor )
  {
    context.fill(fillColor);
    context.stroke( strokeColor );
    context.ellipse( x, y, 10, 10 );
  }
}
