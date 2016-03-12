var  a,b:array [1..100000] of longint;
     c:array[0..9] of longint;
      n,m,k,i,j,o:longint;
begin
     assign(input,'count.in');
     reset(input);
     assign(output,'count.out');
     rewrite(output);
     readln(n);
     o:=1;
     for k:=1 to n do
     begin
     m:=k;
     while m<>0 do
     begin
     b[o]:=m mod 10;
     m:=m div 10;
     inc(o);
     end;
     end;
     for k:=1 to  o-1 do
     begin
     if b[k]=1 then inc(c[1]);
     if b[k]=2 then inc(c[2]);
     if b[k]=3 then inc(c[3]);
     if b[k]=4 then inc(c[4]);
     if b[k]=5 then inc(c[5]);
     if b[k]=6 then inc(c[6]);
     if b[k]=7 then inc(c[7]);
     if b[k]=8 then inc(c[8]);
     if b[k]=9 then inc(c[9]);
     if b[k]=0 then inc(c[0]);
     end;
     for k:=0 to 9 do
     writeln(c[k]);
     close(input);
     close(output);

end.
