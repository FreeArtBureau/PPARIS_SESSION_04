Ball ball;
Rectangle rect;

void setup()
{
  size( 600,600 );
  ball = new Ball( 300, 300 );
  rect = new Rectangle( 250,250,100,100 );
}

void draw()
{
  
  background( 0xFF );
  
  //mise a jour balle
  
  ball.acc.x += random( -.1, .1 );
  ball.acc.y += random( -.1, .1 );
  
  ball.vel.x = clamp( ball.vel.x, -5, 5 );
  ball.vel.y = clamp( ball.vel.y, -5, 5 );
  
  ball.update();
  ball.checkBounds( this );
  ball.render( this );
 

  //position normalisee
  PVector ballNormal = new PVector(   myNorm( ball.x, 0, width ),
                                        myNorm( ball.y, 0, height )  );
  
  //position remappée sur un petit carré
  
  PVector rempap = new PVector( interpolate( ballNormal.x, rect.x, rect.x + rect.width ), 
                                interpolate( ballNormal.y, rect.y, rect.y + rect.height )  );
  
  //rend la balle à sa position remappée
  fill( 0xFF, 0, 0 );
  noStroke();
  ellipse( rempap.x, rempap.y, 8,8 );
  
  //anime la taille du rectangle
  /*
  float t = .5 + sin( millis() * 0.001 ) * .5;
  rect.width = 50 + t * 200;
  rect.height = 50 + ( 1 - t ) * 200;
  rect.x = width * .5 - rect.width * .5;
  rect.y = height * .5 - rect.height * .5;
  //*/
  
  //anime la position du rectangle
  /*
  rect.x += ( ( ball.x - rect.width * .5 ) - rect.x ) *.1;
  rect.y += ( ( ball.y - rect.height * .5 ) - rect.y ) *.1;
  //*/
  
  //rendle rectangle destination
  rect.render( this );
  
}

float interpolate( float t, float a, float b )
{
  return a + ( b - a ) * t;
}

float myNorm( float value, float a, float b )
{
  return ( value - a ) / ( b - a );
}

float clamp( float value, float a, float b )
{
  return ( value < a ) ? a : ( value > b ) ? b : value;
}

