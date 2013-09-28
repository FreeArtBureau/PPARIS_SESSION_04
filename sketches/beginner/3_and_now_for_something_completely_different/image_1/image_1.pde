PImage insect;

void setup() {
   
  insect = loadImage("hercule.jpg");
  
  size( insect.width, insect.height ) ;
  
   image( insect, 0,0 );
 frameRate = 2;
 //= 
}
void draw()
{
  background(0xff);
  noStroke();
  int scale = 8;
  
  float radius = max( insect.width, insect.height );
  
  for (int x = 0 ; x < insect.width ; x+= scale )
  {
    for (int y = 0 ; y < insect.height ; y+= scale )
    {
       fill( insect.get( x,y ) );
       
       float  d = dist( x, y, mouseX, mouseY );
       
         
       if( d < radius )
       {
         float a = atan2( y - mouseY, x - mouseX );
         
         //*
         rect( mouseX + cos( a ) * d, 
               mouseY + sin( a ) * d, scale, scale );
         //*/
         
         /*
         rect( x + cos( a ) * d  * sin( a ), 
               y + sin( a ) * d  * cos( a ), scale, scale );
         //*/
         
         //variante
         /*
         rect( mouseX + cos( a ) * ( radius - d ), 
               mouseY + sin( a ) * ( radius - d ), scale, scale );
               //*/
         
         //variante
         /*
         rect( mouseX + cos( a ) * ( radius / d ) * 25, 
               mouseY + sin( a ) * ( radius / d ) * 25, scale, scale );
               //*/
       }
       else
       {
      // rect( x, y, scale, scale );
       }
    }
  }
}

