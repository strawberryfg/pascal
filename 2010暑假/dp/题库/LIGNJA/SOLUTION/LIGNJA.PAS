
{ DMIH 2002 - Drugi dan natjecanja       }
{ Srednjoskolska skupina - I. podskupina }
{ Zadatak LIGNJA                         }
{ Autor rjesenja Ivan Sikiric            }

program lignja;
const maxn = 10000;
      maxk = 10000;
var minute : array[1..maxn+1] of integer;
    poslovi : array[0..maxk] of record pocetak, trajanje : integer; end;
    n, k, i, j : integer;
    f : text;
begin
     assign(f, 'lignja.in');
     reset(f);
     readln(f, n, k);
     for i:=1 to k do readln(f, poslovi[i].pocetak, poslovi[i].trajanje);
     close(f);
     j:=k;
     minute[n+1]:=0;
     poslovi[0].pocetak:=0;
     for i:=n downto 1 do
     begin
         minute[i]:=0;
         if poslovi[j].pocetak<>i then minute[i]:=1+minute[i+1] else
         while poslovi[j].pocetak=i do
         begin
              if minute[i+poslovi[j].trajanje]>minute[i] then
                 minute[i]:=minute[i+poslovi[j].trajanje];
              j:=j-1;
         end;
     end;
     assign(f, 'lignja.out');
     rewrite(f);
     writeln(f, minute[1]);
     close(f);
end.
