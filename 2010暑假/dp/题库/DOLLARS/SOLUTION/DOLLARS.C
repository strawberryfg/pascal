
// Rjesenje napisali Kresimir Malnar, Ante Djerek i Bojan Antolovic

/*

Problem rijesavam tako da za svaka dva uzastopna dana razmisljam na
sljedeci nacin:

1. Ako je sutra tecaj dolara veci nego danas, cuvam dolare jer mi se
to isplati.

2. Ako je sutra tecaj dolara manji nego danas, danas prodam sve dolare
koje imam, preko noci cuvam kune, a sutra kupim dolare po tecaju koji
je povoljniji od danasnjeg. Kolicina dolara se poveca i sutra imam:

dolara = dolara * danasnji_tecaj / sutrasnji_tecaj

*/

#include <stdio.h>

//

#define MAX_DANA 100

//

int main(void)
{
  int i;
  int broj_dana;
  int tecaj[MAX_DANA];

  double dolara;

  FILE *file;

  //

  file = fopen("DOLLARS.IN","rt");

  fscanf(file,"%d",&broj_dana);

  for (i = 0;i < broj_dana;++i)
    fscanf(file,"%d",tecaj + i);

  fclose(file);

  //

  dolara = 100;

  for (i = 0;i < broj_dana - 1;++i)
    if (tecaj[i] > tecaj[i + 1])
      dolara *= (double) tecaj[i] / tecaj[i + 1];

  //

  file = fopen("DOLLARS.OUT","wt");

  fprintf(file,"%.2lf\n",dolara);

  fclose(file);

  //

  return 0;
}
