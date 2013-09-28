class Circle extends PVector
{
  public float radius;
  
  Circle( float x, float y, float radius )
  {
    super( x, y );
    this.radius = radius;
  }
  
  void draw( PApplet context )
  {
    context.ellipse( x, y, radius * 2, radius * 2 );
  }
}
