class Mesh
{
  public int[] indices;
  public float[] vertices;
  
  Mesh( String url )
  {
    
    String[] data = loadStrings( url );
    
    vertices = float( data[0].split( "," ) );
    indices = int( data[2].split( "," ) ); 
    
  }
  
  void render( PApplet c  )
  {
    c.translate(c.width/2, c.height/2, 0);
    c.scale(3);
    c.rotateY( ( ( c.width * .5 - c.mouseX ) / c.width ) * 5 ); 
    c.noStroke();
    c.lights();
    
    int i0, i1, i2;
    for( int i = 0; i < indices.length; i+= 3 )
    {
      
      i0 = indices[ i ] * 3;
      i1 = indices[ i + 1 ] * 3;
      i2 = indices[ i + 2 ] * 3;
      
      c.beginShape();
      c.vertex( vertices[ i0 ], -vertices[ i0 + 1 ], -vertices[ i0 + 2 ] );
      c.vertex( vertices[ i1 ], -vertices[ i1 + 1 ], -vertices[ i1 + 2 ] );
      c.vertex( vertices[ i2 ], -vertices[ i2 + 1 ], -vertices[ i2 + 2 ] );
      c.endShape();
      
    }
    
    

  }
}

