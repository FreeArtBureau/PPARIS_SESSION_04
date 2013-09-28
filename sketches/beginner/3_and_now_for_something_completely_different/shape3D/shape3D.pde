
Vector3D r3d;

ArrayList<Vector3D> vs;
ArrayList<PVector> lines;
ArrayList<Vector3D> clines;

int time;
float scale = 100;
void setup()
{
  
  vs = new ArrayList<Vector3D>();
  //cube
  vs.add(   new Vector3D(-1, -1, 1) );
  vs.add(   new Vector3D(1, -1, 1) );
  vs.add(   new Vector3D(-1, 1, 1) );
  vs.add(   new Vector3D(1, 1, 1) );
  vs.add(   new Vector3D(-1, -1, -1) );
  vs.add(   new Vector3D(1, -1, -1) );
  vs.add(   new Vector3D(-1, 1, -1) );
  vs.add(   new Vector3D(1, 1, -1) );
  //anchors
  vs.add(   new Vector3D(0, 0, 1.5) );
  vs.add(   new Vector3D(0, 0, -1.5) );
  vs.add(   new Vector3D(1.5, 0, 0) );
  vs.add(   new Vector3D(-1.5, 0, 0) );
  vs.add(   new Vector3D(0, 1.5, 0) );
  vs.add(   new Vector3D(0, -1.5, 0) );

  for( Vector3D v : vs ) v.scaleBy( scale );
  
  lines = new ArrayList<PVector>();
  lines.add(    new PVector(0,1) );
  lines.add(    new PVector(0,2) );
  lines.add(    new PVector(1,3) );
  lines.add(    new PVector(2,3) );
  lines.add(    new PVector(4,5) );
  lines.add(    new PVector(4,6) );
  lines.add(    new PVector(5,7) );
  lines.add(    new PVector(6,7) );
  lines.add(    new PVector(0,4) );
  lines.add(    new PVector(1,5) );
  lines.add(    new PVector(2,6) );
  lines.add(    new PVector(3,7) );

  clines = new ArrayList<Vector3D>();
  clines.add(    new Vector3D(0,3,8) );
  clines.add(    new Vector3D(1, 2, 8) );
  clines.add(    new Vector3D(4,7,9) );
  clines.add(    new Vector3D(5, 6, 9) );
  clines.add(    new Vector3D(0,6,11) );
  clines.add(    new Vector3D(2,4,11) );
  clines.add(    new Vector3D(1,7,10) );
  clines.add(    new Vector3D(3,5,10) );
  clines.add(    new Vector3D(0,5,13) );
  clines.add(    new Vector3D(1,4,13) );
  clines.add(    new Vector3D(2,7,12) );
  clines.add(    new Vector3D(3, 6, 12) );
  
  r3d = new Vector3D( 0, 0, 0 );
  size( 600,600 );
  time = 0;
  
}
void draw()
{
  fill( 0x04000000 );
  rect( 0,0,600,600 );
            
            translate( 300,300 );
            
            float ry = map( mouseX, 0, 600, 0, PI / 180 );
            float rxz = map( mouseY, 0, 600, 0, PI / 180 );
            
            r3d.x += rxz;
            r3d.y += ry;
            r3d.z += rxz;
            
            noFill();
            stroke( 255 );
            
            time += 5;
            
            float t = .5 + sin( time * PI / 180 ) * .5;
            
            vs.get( 8 ).z = 
            vs.get( 10 ).x = 
            vs.get( 12 ).y = sin( t ) * scale * 2;
            
            vs.get( 9 ).z = 
            vs.get( 11 ).x = 
            vs.get( 13 ).y = sin( t ) * -scale * 2;
            
            ArrayList<Vector3D> vs2 = new ArrayList<Vector3D>();
            
            for( Vector3D v : vs ) 
            {
                float y = v.y * cos(r3d.x) - v.z * sin(r3d.x);
                float z = v.z * cos(r3d.x) + v.y * sin(r3d.x);
                float x = v.x * cos(r3d.y) - z * sin(r3d.y);
                
                z = z * cos( r3d.y ) + v.x * sin( r3d.y );
                
                float x_ = x * cos(r3d.z) - y * sin(r3d.z);  
                
                y = y * cos(r3d.z) + x * sin(r3d.z);
                
                //distance objet-camera
                z += 200;
                
                //projection
                float fz = 100 / z;
                float sx = x_ * fz;
                float sy = y * fz;
                
                ellipse( sx, sy, 10 * fz, 10 * fz);
                
                vs2.add( new Vector3D(sx, sy, z) );
                
            }
            
            for( PVector line : lines )
            {
                line( vs2.get( int( line.x ) ).x, 
                      vs2.get( int( line.x ) ).y, 
                      vs2.get( int( line.y ) ).x, 
                      vs2.get( int( line.y ) ).y );
            }
            for( Vector3D cline : clines )
            {
                
                bezier( vs2.get( int( cline.x ) ).x,
                        vs2.get( int( cline.x ) ).y,
                        
                        vs2.get( int( cline.z ) ).x,
                        vs2.get( int( cline.z ) ).y,
                        
                        vs2.get( int( cline.y ) ).x,
                        vs2.get( int( cline.y ) ).y,
                        
                        vs2.get( int( cline.y ) ).x,
                        vs2.get( int( cline.y ) ).y );
               
            }
            
}
        
