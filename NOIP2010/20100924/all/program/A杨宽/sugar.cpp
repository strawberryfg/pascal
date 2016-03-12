




/*
  Program   :   Sugar
  Author    :   yk
  Date      :   24-09-10
  Algorithm :   Ä¸º¯Êý
*/

#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <iterator>
using namespace std;

long long n;

int main () {
    freopen ("sugar.in" , "r", stdin );
    freopen ("sugar.out", "w", stdout);
    
    cin >> n;
    n = (n + 2) * (n + 1) / 2;
    cout << n << endl;
    
    return 0;
}
