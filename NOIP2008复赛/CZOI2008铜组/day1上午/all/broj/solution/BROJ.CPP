
#include <iostream>

using namespace std;

int main( void ) {
  int d, n, z=0, rez=0;

  cin >> n;

  for( d = 1; n / d; d *= 10 )
    rez += d*9*++z;

  rez -= (d-n-1)*z;

  cout << rez << endl;

  return 0;
}
