class PRNG
{
  int  a = 8403;            /* multiplier */
  int  m = 0x7FFFFFF;        /* 2**31 - 1 */
  int  q = int( m / a );    /* m div a */
  int  r = int( m % a );    /* m mod a */
  int  _seed = 1;
  int  randomnum = 1;
  float  div = ( 1.0 / m );
  
  PRNG()
  {
    seed( millis() );
  }
  PRNG( int seed )
  {
    seed( seed );
  }
  
  int nextlongrand( int seed )
  {
    int lo, hi;
    
    lo = a * (seed & 0xFFF );
    hi = a * (seed >> 16);
    lo += (hi & 0x7FF ) << 16;
    if (lo > m)
    {
      lo &= m;
      ++lo;
    }
    lo += hi >> 15;
    if (lo > m)
    {
      lo &= m;
      ++lo;
    }
    return lo;
    
  }
  
  float random()
  {
    
    randomnum = nextlongrand(randomnum);
    return abs( randomnum * div );
    
  }
  
  void seed( int value ) 
  {
    _seed = ( value <= 0 ) ? 1 : value;
    randomnum = _seed;
    random();
  }
  
}
