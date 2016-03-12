
// Izborne pripreme 2001 - Drugi izborni ispit
// Zadatak FATBOY
// Autor rjesenja Matija Kazalicki
// Nesluzbeno rjesenje

#include <stdio.h>
#define MAX 100
#define INFILE "FATBOY.in"
#define OUTFILE "FATBOY.out"
struct tip
{
        int x, y, z;
        char c;
        int vri;
};

struct tip a[MAX+2][MAX+2][MAX+2];
char s1[MAX+2], s2[MAX+2], s3[MAX+2];
char s[MAX+2];

void unos( void )
{

 FILE *f;
 f = fopen( INFILE, "rt" );
 fscanf( f, "%s", s1 );
 fscanf( f, "%s", s2 );
 fscanf( f, "%s", s3 );

 fclose(f);
}

void gen_a ( void )
{
  int i, j;
  for( i = 0; i < MAX + 1; i++ )
      for( j = 0; j < MAX + 1; j++)
      {
        a[0][i][j].vri = -1;
        a[i][0][j].vri = -1;
        a[i][j][0].vri = -1;
      }
      a[0][0][0].vri = 0;
}

void rijesi( int i, int j, int k)
{
 int i1, j1, k1, b;
 char presjek[5][5];
 char temp;
 a[i][j][k].vri = 0;

   for( i1 = 0; i1 < 5; i1++ )
     for( j1 = 0; j1 < 5; j1++ )
     {
        presjek[i1][j1] = '1';
     }


 for( i1 = 1; ( i1 < 5 ) && ( i - i1 >= 0 ); i1++ )
 {
      for( j1 = 1; ( j1 < 5 ) && ( j - j1 >= 0 ); j1++ )
      {
                temp = '1';

                for( k1 = 1; ( k1 < 5 ) && ( k - k1 >=0 ); k1++ )
                {
                        if(( s1[i - i1] == s2[j - j1] ) && ( s3[k - k1] == s2[j - j1] ) && (temp = '1' ))
                        {

                                for ( b = 0; j1 + b <= 4; b++)
                                  presjek[j1 + b][k1] = s1[i - i1];

                        }

                        if( presjek[j1][k1] !='1' )
                        {
                                temp = presjek[j1][k1];
                        }

                                if( ( a[i - i1][j - j1][k - k1].vri + 1 > a[i][j][k].vri ) && ( temp != '1' ) )
                                {
                                   a[i][j][k].vri = a[i - i1][j - j1][k - k1].vri + 1;
                                   a[i][j][k].x = i - i1;
                                   a[i][j][k].y = j - j1;
                                   a[i][j][k].z = k - k1;
                                   a[i][j][k].c = temp;
                                }


                }
      }
 }

 if( a[i][j][k].vri == 0 ) a[i][j][k].vri = -1;
}

void ispis( void )
{
 int rje, i, j, k, x, y, z, koji;
 FILE *f;
 f = fopen( OUTFILE, "wt" );


 i = strlen( s1 );
 j = strlen( s2 );
 k = strlen( s3 );
 rje = a[i][j][k].vri;
 koji = 0;

 while (( i != 0 ) || ( j != 0 ) || ( k != 0 ))
 {
        koji++;
        s[rje - koji] = a[i][j][k].c;
        x = a[i][j][k].x;
        y = a[i][j][k].y;
        z = a[i][j][k].z;
        i = x; j = y; k = z;


 }
 fprintf( f, "%s\n", s );

 fclose( f );
}


int main( void )
{
 int i, j, k;
 unos();
 gen_a();
 for( i = 1; i <= strlen( s1 ); i++ )
      for( j = 1; j <= strlen( s2 ); j++)
          for( k = 1; k <= strlen( s3 ); k++)
            rijesi( i, j, k );

 ispis();
 return 0 ;
}
