
Mesh m;

void setup()
{
  
  size( 600,400, P3D );
  m = new Mesh( "head.txt" ); 
  perspective( 60 * PI / 180, 1.5, 1, 10000 );
  
}

void draw()
{
  
  background( 0xFF );
  m.render( this );
  
}

