class Utils
{
 
  float interpolate( float t, float a, float b )  
  {
   return a + ( b - a ) * t; 
  }
  
  
  float normalization( float t, float a, float b )  
  {
   return ( t - a ) / ( b - a ); 
  }
  
  float remap( float t, float a0, float b0, float a1, float b1 )  
  {
   return interpolate( normalization( t, a0, b0 ), a1, b1 ); 
  }
}

