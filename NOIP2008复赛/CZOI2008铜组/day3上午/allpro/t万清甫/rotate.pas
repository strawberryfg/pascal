const maxn=21;
var i,j,k,l,tot,n,ti,tj:longint;
    a:array[1..maxn,0..maxn,1..2]of integer;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(n);
a[1,0,1]:=1; a[1,n+1,1]:=1;
a[n,0,1]:=1; a[n+1,n,1]:=1;
tot:=0;
i:=1;j:=0;k:=0; l:=1;
while tot<n*n do
      begin
      ti:=i+k;
      tj:=j+l;
      if a[ti,tj,1]=1 then
         begin
         if k=1 then begin l:=-1;k:=0; end else
         if l=1 then begin k:=1;l:=0; end else
         if k=-1 then begin l:=1;k:=0; end else
         if l=-1 then begin k:=-1;l:=0; end;
         end;
      i:=i+k; j:=j+l;
      a[i,j,1]:=1;
      inc(tot);
      a[i,j,2]:=tot;
      end;
for i:=1 to n do
    begin
    for j:=1 to n do
        write(a[i,j,2]:4);
    writeln;
    end;
close(input);
close(output);
end.
