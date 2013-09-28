class Vector3D 
{
  
  float x, y, z;
  Vector3D ( float x, float y, float z )
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void scaleBy( float v )
  {
    x *= v;
    y *= v;
    z *= v;
  }
  
  float distance( Vector3D v )
  {
    float dx = x - v.x;
    float dy = y - v.y;
    float dz = z - v.z;
    return sqrt( dx*dx + dy*dy + dz*dz );
  }
  
}
