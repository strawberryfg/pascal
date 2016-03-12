var total,i,j,n:longint;a:array[1..20]of string;
function pd(q:char;w,e:longint):boolean;
var z,x,da,xiao:longint;u:boolean;
begin
pd:=true;u:=false;
if q='X' then begin pd:=false;exit;end;
for z:=1 to n do
   if a[w][z]='N' then
      begin
      if z>e then begin da:=z;xiao:=e;end else begin da:=e;xiao:=z;end;
      for x:=xiao to da+1 do
          begin
          if a[w][x]='X' then begin u:=true;break;end;
          end;
      if u then exit else begin pd:=false;exit;end;
      end;
for z:=1 to n do
   if a[z][e]='N' then
      begin
      if z>e then begin da:=z;xiao:=e;end else begin da:=e;xiao:=z;end;
      for x:=xiao to da+1 do
          begin
          if a[x][e]='X' then begin u:=true;break;end;
          end;
      if u then exit else begin pd:=false;exit;end;
      end;
end;
begin
assign(input,'fire.in');
assign(output,'fire.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
    readln(a[i]);
for i:=1 to n do
    for j:=1 to n do
        if pd(a[i][j],i,j) then a[i][j]:='N';
for i:=1 to n do
    for j:=1 to n do
        if (a[i][j]='N') then inc(total);
writeln(total);
close(input);close(output);
end.
