PImage insect;

void setup() {
   
  insect = loadImage("hercule.jpg");
  
  size( insect.width, insect.height ) ;
 
  noStroke();
  
  int resolution = 1;
  
  for (int x = 0 ; x < insect.width ; x += resolution )
  {
    for (int y = 0 ; y < insect.height ; y += resolution )
    {
      
       // récupérer les valeurs de couleur sur tous les pixels
       color couleur = insect.get( x,y );
       
       // dessine un rect de 1 pixel par 1 pixel 
       fill( couleur );
       rect( x, y, resolution, resolution );
       
    }
  }
  
 //= 
 //image( insect, 0,0 );
 
}

