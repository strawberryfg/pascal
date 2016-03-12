var n,total,i,j,m,p,q,k:longint;
   a,b:array[1..255] of longint;
procedure suan(k:longint);
          var i,z,w,t,y:longint;
              c:array[1..100] of longint;
begin
for i:= 1 to m do
    begin
    fillchar(c,sizeof(c),0);
    t:=a[i];
    y:=0;
    while t<>0 do
          begin
          y:=y+1;
          c[y]:= t mod 10;
          t:=t div 10;
          end;
    for z:= 1 to y do
        for w:= 1 to k do
            b[i]:=b[i]+c[z]*c[z];
    end;
end;
begin
assign(input,'ghillie.in');
assign(output,'ghillie.out');
reset(input);
rewrite(output);
readln(n);
i:=0;
while not eoln do
      begin
      i:=i+1;
      read(a[i]);
      end;
m:=i;
for i:= 1 to n do
    begin
    fillchar(b,sizeof(b),0);
    suan(i);
    for p:= 1 to m-1 do
        for q:=1 to m do
        if (a[p]=b[q]) and (p<>q) then a[p]:=0;
    end;
for i:= 1 to m-1 do
    for j:= i+1 to m do
        if a[i]>a[j] then begin total:=a[i];a[i]:=a[j];a[j]:=total;end;
for i:= 1 to m do
    begin
    if a[i]<>0 then write(a[i]);
    if (i<>m) and (a[i]<>0) then write(' ');
    if i=m then writeln;
    end;
close(input);
close(output);
end.
