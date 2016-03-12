
/*
  Croatia 2005 / Regional Competition / Juniors
  Problem KRATICA

  Opis algoritma:
  Za svaku rijec provjeravamo da li se nalazi u zadanom skupu veznika.
  Ako se nalazi, tada tu rijec preskacemo.
  Ako se ne nalazi u tom skupu, ili ako je to prva rijec u recenici,
  ispisujemo njeno prvo slovo (velikim slovom).
*/

#include <cstdio>
#include <cctype>
#include <set>
#include <string>

using namespace std;

int main()
{
   static const char *__rijeci[] = { "i", "pa", "te", "ni", "niti", "a", "ali", "nego", "no", "ili" };
   set<string> rijeci( __rijeci, __rijeci+10 );

   static char s[101];
   for ( int i=0; scanf( "%s", s ) == 1; ++i ) {
      if ( i == 0 || rijeci.find( string( s ) ) == rijeci.end() )
         printf( "%c", toupper( s[0] ) );
   }
   printf( "\n" );

   return 0;
}
