var n,t,i,j,k,j1,k1:longint;
    c:boolean;
    a:array[0..25,0..25]of longint;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(n);
a[1,n+1]:=1;
a[n+1,n]:=1;
a[n,0]:=1;
t:=1;
j:=1;
k:=1;
c:=false;
while i<n*n do
      begin
      k1:=k;
      j1:=j;
      inc(i);
      if t=1 then begin a[j,k]:=i;inc(k1);end;
      if t=2 then begin a[j,k]:=i;inc(j1);end;
      if t=3 then begin a[j,k]:=i;dec(k1);end;
      if t=4 then begin a[j,k]:=i;dec(j1);end;
      if a[j1,k1]<>0 then begin
                          inc(t);
                          if t>4 then t:=t mod 4;
                          c:=true;
                          end;
      if c=false then begin k:=k1;j:=j1;end
                 else if k<>k1 then if t=2 then inc(j)
                                           else dec(j)
                               else if t=1 then inc(k)
                                           else dec(k);
      c:=false;
      end;
for i:=1 to n do
    begin
    for j:=1 to n do
        write(a[i,j]:4);
    writeln;
    end;
close(input);
close(output);
end.
