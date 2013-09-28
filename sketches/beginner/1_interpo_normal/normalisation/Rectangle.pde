class Rectangle extends PVector
{
  float width;
  float height;
  Rectangle( float x, float y, float width, float height )
  {
    
    super( x, y );
    this.width = width;
    this.height = height;
    
  }
  
  
  void render( PApplet context )
  {
    context.stroke( 0xFF, 0, 0 );
    context.strokeWeight( 2 );
    context.noFill();
    context.rect( x, y, width, height );
  }
  
}
