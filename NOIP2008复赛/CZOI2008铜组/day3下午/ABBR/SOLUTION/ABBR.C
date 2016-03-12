
/*
  Croatia 2005 / Regional Competition / Juniors
  Problem KRATICA

  Opis algoritma:
  Za svaku rijec provjeravamo da li se nalazi u zadanom skupu veznika.
  Ako se nalazi, tada tu rijec preskacemo.
  Ako se ne nalazi u tom skupu, ili ako je to prva rijec u recenici,
  ispisujemo njeno prvo slovo (velikim slovom).
*/

#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX_ZNAKOVA 100

char veznici[10][5] = { "i","pa","te","ni","niti","a","ali","nego","no","ili"};

int veznik(char *rijec)
{
  int i;

  for (i = 0;i < 10;++i)
    if (!strcmp(rijec,veznici[i]))
      return 1;

  return 0;
}

int main(void)
{
  int prva_rijec;
  char rijec[MAX_ZNAKOVA + 1];

  prva_rijec = 1;
  while (1)
  {
    if (scanf("%s",rijec) != 1)
      break;

    if (prva_rijec)
    {
      printf("%c",toupper(rijec[0]));
      prva_rijec = 0;
    }
    else if (!veznik(rijec))
      printf("%c",toupper(rijec[0]));
  }
  printf("\n");

  return 0;
}
