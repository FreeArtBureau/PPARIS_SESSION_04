
int K;
ArrayList<Point> trail;
ArrayList<Point> points;
ArrayList<Float> angles;
ArrayList<Float> speeds;
float radius;
Point center;
void setup()
{
  int w = 800;
  int h = 600;
  
  size( w, h );
  center = new Point( w/2,h/2 );
  radius = h / 2 - 20;
  K = 1;
  reset( K );
    
}

void mousePressed()
{
    K++;
    K %= 6;
    if( K == 0 ) K = 1;
    reset( K );
    
}
void reset( int count ) 
{
  
  angles = new ArrayList();
  speeds = new ArrayList();
  points = new ArrayList(); 
  trail = new ArrayList(); 
  
  int i = 0;
  while( i < count )
  {
    float angle = random( PI * 2 );
    angles.add( angle );
    
    Float v = random(-PI / 30, PI / 30 );
    while( v == 0 ) v = random(-PI / 30, PI / 30 );
    if ( v < 0 ) v = max( -PI / 90, v );
    if ( v > 0 ) v = max( PI / 90, v );
      
    speeds.add( v );
    points.add( setPointAtAngle( angle, radius, new Point() ) );
    i++;
  }
  Point centroid = centroid( points ).add( center );
  centroid.render( this, 0xFFCC00 );
 
}

void draw()
{
  
  background(20);
  
  noFill();
    stroke( 0xFFDDDDDD );
    
    ellipse( center.x, center.y, radius * 2, radius * 2 );
    
    int i = 0;
    while( i < points.size() )
    {
      
      float angle = angles.get( i );
      float speed = speeds.get( i );
      
      angles.set( i, angle + speed );
      
      points.set( i, setPointAtAngle( angle, radius, points.get( i ) ).add( center ) );
      
      Point p = points.get( i );
      Point n = points.get( ( i + 1 ) % points.size() );
      
      stroke( 0xFF808080 );
      line( p.x, p.y, n.x, n.y );
      p.render( this, 0xFF808080, 0xFF808080 );
      i++;
    }
    
    Point centroid = centroid( points );
    
    noFill();
    stroke( 0xFFFF0000 );
    ellipse( centroid.x, centroid.y, 10,10 );
    
    trail.add( centroid );
    if( trail.size() > 200 )trail.remove( 0 );
    
    i = 0;
    while( i < trail.size() - 1 )
    {
      Point p = trail.get( i );
      Point n = trail.get( ( i + 1 ) );
      
      stroke( 0xFFFF0000 );
      line( p.x, p.y, n.x, n.y );
      i++;
    }
    
    stroke( 0xFFFFCC00 );
    i = 0;
    while( i < points.size() )
    {
      Point p = points.get( i );
      Point n = points.get( ( i + 1 ) % points.size() );
      Point m = midpoint( p, n );
      line( m.x, m.y, centroid.x, centroid.y );
      i++;
    }
    
    
}

  
  Point setPointAtAngle( float angle, float radius, Point p )
  {
    p.x = cos( angle ) * radius;
    p.y = sin( angle ) * radius;
    return p;
  }
  
  Point midpoint( Point p0, Point p1 )
  {
    return new Point( p0.x + ( p1.x - p0.x ) / 2, p0.y + ( p1.y - p0.y ) / 2 );
  }
  
  Point centroid( ArrayList<Point> points )
  {
    Point p = new Point();
    for ( Point o : points )
    {
      p.x += o.x;
      p.y += o.y;
    }
    p.x /= points.size(); 
    p.y /= points.size(); 
    return p;
  }
  
