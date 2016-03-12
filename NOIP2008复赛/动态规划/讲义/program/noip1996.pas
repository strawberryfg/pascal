program NOIP1996;
const maxn=200;
var a:array[1..maxn,1..maxn] of byte;
    w:array[1..maxn] of integer;
    f:array[1..maxn] of record
                          sum:longint;
                          next:byte;
                        end;
    i,j,n,k,max:longint;
begin
  write('input n:');
  readln(n);
  write('input w[i]:');
  for i:=1 to n do read(w[i]);
  readln;
  fillchar(a,sizeof(a),0);
  fillchar(f,sizeof(f),0);
  writeln('input x->y(0 0 is over!):');
  repeat
    readln(i,j);
    if (i<>0) and (j<>0) then a[i,j]:=1;
  until (i=0) and (j=0);
  f[n].sum:=w[n];
  for i:=n-1 downto 1 do
    begin
      max:=0;
      k:=0;
      for j:=i+1 to n do
        if (a[i,j]=1) and (max<f[j].sum) then begin
                                                max:=f[j].sum;
                                                k:=j;
                                              end;
      f[i].sum:=w[i]+max;
      f[i].next:=k
    end;
  k:=1;
  for i:=2 to n do
    if f[i].sum>f[k].sum then k:=i;
  max:=f[k].sum;
  write('path:',k);k:=f[k].next;
  while k<>0 do
    begin
      write('--',k);
      k:=f[k].next
    end;
  writeln;
  writeln('max=',max);
  readln;
end.