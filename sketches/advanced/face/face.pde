PVector tr;
PVector n;
PVector l_en;
PVector l_ps;
PVector l_ex;
PVector l_pi;
PVector l_zy;
PVector l_al;
PVector an;
PVector ls;
PVector sto;
PVector li;
PVector l_ch;
PVector l_go;
PVector sl;
PVector gn;

float foreheadDelta;
ArrayList<Float> coords;
PVector[] points;

void setup()
{
  
  // il y a une lib de triangulation dans /res :)
  
  size( 600,600 );
  background( 0xFF );
  
  //choppe le XML
  XML xml = loadXML("lib.xml");
  
  //récupère la viande
  String data = xml.getChildren("Group")[ 0 ].getChildren( "Path" )[ 0 ].getString("data");
  
  //dégage le début 
  data = data.substring( 2, data.length() ); 
  
  //splitte les paires de coordonnées
  String[] values = data.split( " L " ); 
  
  
    tr = new PVector();
    n = new PVector();
      
      //symetrical
      l_en = new PVector();
      l_ps = new PVector();
      l_ex = new PVector();
      l_pi = new PVector();
      l_zy = new PVector();
      l_al = new PVector();
      
    an = new PVector();
    ls = new PVector();
    sto = new PVector();
    li = new PVector();
      
      //symetrical
      l_ch = new PVector();
      l_go = new PVector();
      
    sl = new PVector();
    gn = new PVector();
    
    PVector[] points = {  tr, n, l_en, l_ps, l_ex, l_pi, l_zy, l_al, an, ls, sto, li, l_ch, l_go, sl, gn };
    
    coords = new ArrayList<Float>();
    for ( int i = 0; i < values.length; i++ )
    {
      
      //recupère les couples de coordonnées
      String[] coordsTxt = values[ i ].split( " " );
      float x = parseFloat( coordsTxt[ 0 ] );
      float y = parseFloat( coordsTxt[ 1 ] );
      
      //normalisation ... pouviez pas le savoir.
      coords.add( x / 30 - .5 );
      coords.add( y / 30 - .5 );
      
    }
    
    //retire un offset pour le sommet du crane sinon, ça rend que le visage, pas la tête.
    foreheadDelta = ( coords.get( 3 ) - coords.get( 1 ) );
    coords.set( 1, coords.get( 1 ) - foreheadDelta );
    
    int i = 0;
    while ( i < coords.size() )
    {
      points[ int( i * .5 ) ].x = coords.get( i );
      points[ int( i * .5 ) ].y = coords.get( i + 1 );
      i += 2;
    }
    
    //rendu
    drawCurve( points, 300   );
  
  
}

void drawCurve( PVector[] points, float scale )
{
    translate( width * .5, height * .5 );
   PVector p, n;
   for( int i = 0; i < points.length - 1; i++ )
   {
      p = points[ i ];
      n = points[ ( i + 1 ) ];
      line( p.x * scale, 
            p.y * scale, 
            n.x * scale, 
            n.y * scale ); 
      
      ellipse( n.x * scale, n.y * scale, 10,10 ); 
      
   }
   
}

