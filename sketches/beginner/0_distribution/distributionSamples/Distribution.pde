class Distribution
{
  PRNG prng;
  Distribution()
  {
    prng = new PRNG();
  }
  
  Distribution( PRNG prng )
  {
    this.prng = prng;
  }
  
  /***************************************/
  
  // adds random offsets to points 
  
  void jitterPoints( ArrayList<PVector>points, float radius )
  {
    
    float rad;
    float angle;
    for( PVector p : points )
    {
      rad = prng.random() * radius;
      angle = prng.random() * ( 2 * PI );
      p.x += rad * cos(angle);
      p.y += rad * sin(angle);
    }
  }
  
  /**************************/
  
  //   random distribution
  
  /**************************/
  
  ArrayList<PVector> randomDistribution( Rectangle rect, int count ) 
  { 
    
    int i = count;
    ArrayList<PVector> points = new ArrayList<PVector>();
    
    while( i > 0 )
    {
      PVector p = new PVector(  rect.x + random( rect.width ), 
                                rect.y + random( rect.height ) );
      points.add( p );
      i--;
      
    }
    return points;
    
  }
  
  
  /**************************/
  
  //   PSEUDO RANDOM distribution
  
  /**************************/
  
  ArrayList<PVector> PRNGDistribution( Rectangle rect, int count ) 
  { 
    
    int i = count;
    ArrayList<PVector> points = new ArrayList<PVector>();
    
    while( i > 0 )
    {
      PVector p = new PVector(  rect.x + prng.random() * rect.width, 
                                rect.y + prng.random() * rect.height );
      points.add( p );
      i--;
      
    }
    return points;
    
  }
  
  
  /**************************/
  
  //   circular distribution
  
  /**************************/
  
  ArrayList<PVector> circular( Circle circle, int count ) 
  { 
    
    int i = count;
    float angleStep = ( PI * 2 ) / i;
  
    ArrayList<PVector> points = new ArrayList<PVector>();
    
    while( i > 0 )
    {
      PVector p = new PVector(  circle.x +  cos( i * angleStep ) * circle.radius, 
                                circle.y +  sin( i * angleStep ) * circle.radius );
      points.add( p );
      i--;
      
    }
    return points;
    
  }
  
  /**************************/
  
  //   grid distribution
  
  /**************************/
  
  ArrayList<PVector> star( Circle circle, float radius2, int branchCount )
  {
  
    ArrayList<PVector> points = new ArrayList<PVector>();
    branchCount = int( max( 3, branchCount ) );
    float delta = ( PI * 2 ) / ( branchCount * 2 );
    int i = 0;
    while( i < branchCount * 2 )
    {
      
      float a0 = i * delta - PI * .5;
      points.add( new PVector(  circle.x + cos( a0 ) * circle.radius,
                                circle.y + sin( a0 ) * circle.radius ) );
      
      float a1 = ( i+1 ) * delta - PI * .5;
      points.add( new PVector(   circle.x + cos( a1 ) * radius2, 
                                 circle.y + sin( a1 ) * radius2 ) );
      i += 2;
      
    }
    return points;
    
  }  
  
  
  
  /**************************/
  
  //   grid distribution
  
  /**************************/
  
  ArrayList<PVector> grid( Rectangle rect, int columns, int rows, Boolean asFrame ) 
  { 
    
    PVector p;
    ArrayList<PVector> points = new ArrayList<PVector>();
    
    columns = max( 2, columns );
    rows = max( 2, rows );
    
    for ( int i = 0; i < columns; i++ )
    {
      for ( int j = 0; j < rows; j++ )
      {
        p = new PVector(   rect.x + i * rect.width / ( columns - 1 ),
                           rect.y + j * rect.height / ( rows - 1 ) );
        if ( asFrame )
        {
          if( i == 0 || i == columns - 1 || j == 0 || j == rows - 1 )  points.add( p );
        }
        else 
        {
          points.add( p );
        }
      }
    }
    return points;
  }
  
  ArrayList<PVector> grid( Rectangle rect, int columns, int rows )
  {
    return grid( rect, columns, rows, false );
  } 
  
  
}
