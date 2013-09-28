class Utils
{
  Utils()
  {
  }
  
  float angle( PVector p0, PVector p1 )
  {
    return atan2( p1.y - p0.y, p1.x - p0.x );
  }
  
  float distance( PVector p0, PVector p1 )
  {
    return sqrt( ( p0.x - p1.x ) * ( p0.x - p1.x ) + ( p0.y - p1.y ) * ( p0.y - p1.y ) );
  }
  
  PVector translate( PVector p, float x, float y )
  {
    p.x += x;
    p.y += y;
    return p;
  }
  
  PVector rotate( PVector p, PVector lattice, float angle )
  {
      
      float a = angle( lattice, p ) + angle;
      float d = distance( lattice, p );
      PVector pp = new PVector();
      pp.x = lattice.x + cos( a ) * d;
      pp.y = lattice.y + sin( a ) * d;
      return pp;
      
  }
  
  PVector reflect( PVector p, PVector a, PVector b )
  {
    
    PVector pp = project( p, a, b, true );
    
    return new PVector( p.x + ( pp.x - p.x ) * 2,
                        p.y + ( pp.y - p.y ) * 2  );
    
  }
  
  PVector glide( PVector p, PVector a, PVector b, float distance )
  {
       
      PVector t = reflect( p, a, b );
       
      float angle = angle( a, b );
       
      return translate( t, cos( angle ) * distance, sin( angle ) * distance );
       
  }
  
  
  PVector project( PVector p, PVector a, PVector b, Boolean asSegment )
  {
    
    float dx = b.x - a.x;
    float dy = b.y - a.y;
    
    if ( asSegment && dx == 0 && dy == 0 )
    {
      return a;
    }
    
    float t = ( ( p.x - a.x ) * dx + ( p.y - a.y ) * dy) / ( dx * dx + dy * dy );
    
    if ( asSegment && t < 0) 
    {
      return a;
    } 
    else if ( asSegment && t > 1) 
    {
      return b;
    }
    else 
    {
      return new PVector( a.x + t * dx, a.y + t * dy );
    }
    
  }
  
  
}
