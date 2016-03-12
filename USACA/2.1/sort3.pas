{
ID: xiaweiy1
PROG: sort3
LANG: PASCAL
}
var i,j,n,total,p1,p2:longint;
    g:array[1..3]of longint;
    a,v:array[1..1000]of integer;
begin
assign(input,'sort3.in');
reset(input);
assign(output,'sort3.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(a[i]); inc(g[a[i]]);
    end;
for i:=1 to g[1] do v[i]:=1;
for i:=g[1]+1 to g[2]+g[1] do v[i]:=2;
for i:=g[2]+g[1]+1 to g[3]+g[2]+g[1] do v[i]:=3;
for i:=1 to n do
    begin
    if a[i]<>v[i] then
       begin
       p1:=0; p2:=0;
       for j:=i+1 to n do
           begin
           if (a[i]=v[j])and(v[i]=a[j])and(p1=0) then p1:=j
              else if (v[i]=a[j])and(a[j]<>v[j])and(p2=0) then
                      p2:=j;
           if p1<>0 then break;
           end;
       if p1<>0 then begin a[i]:=v[i];a[p1]:=v[p1]; end
          else if p2<>0 then begin a[p2]:=a[i];a[i]:=v[i]; end;
       if (p1=0)and(p2=0) then writeln('critical');
       inc(total);
       end;
    end;
writeln(total);
close(input);
close(output);
end.
