type arrayt=array[0..750]of longint;
var f,chuan:array[0..10000]of arrayt;
    d,e,s:arrayt;
    i,n,ti:longint;
procedure gjd(a,b,c:arrayt);
var i:longint;
begin
fillchar(d,sizeof(d),0);
fillchar(e,sizeof(e),0);
  if  b[0]>c[0]
    then d[0]:=b[0]
    else d[0]:=c[0];
  for i:=1 to d[0] do
    begin
      d[i]:=d[i]+b[i]+c[i];
      d[i+1]:=d[i+1]+d[i] div 10000;
      d[i]:=d[i] mod 10000;
    end;
  if d[d[0]+1]>0 then inc(d[0]);
if a[0]>d[0] then e[0]:=a[0] else e[0]:=d[0];
  for i:=1 to e[0] do
    begin
      e[i]:=e[i]+a[i]+d[i];
      e[i+1]:=e[i+1]+e[i] div 10000;
      e[i]:=e[i] mod 10000;
    end;
  if e[e[0]+1]>0 then inc(e[0]);
f[ti]:=e;
end;
begin
assign(input,'spread.in');
reset(input);
assign(output,'spread.out');
rewrite(output);
readln(n);
f[0,0]:=1;
f[0,1]:=1;
f[1,0]:=1;
f[1,1]:=1;
chuan[2,0]:=1;
chuan[2,1]:=1;
f[2,0]:=1;
f[2,1]:=3;
if n<=1 then begin writeln(1);close(input);close(output);halt; end;
if n=2 then begin writeln(3);close(input);close(output);halt; end;
chuan[4,0]:=1;
chuan[4,1]:=2;
for i:=3 to n do
    begin
    ti:=i;
    gjd(f[i],chuan[i-1],chuan[i-1]);
    gjd(f[i],chuan[i-2],chuan[i-2]);
    if i>3 then gjd(f[i],chuan[i-3],chuan[i-3]);
    if i>4 then gjd(f[i],chuan[i-4],chuan[i-4]);
    gjd(f[i],chuan[i],chuan[i]);
    chuan[i+2]:=f[i];
    s[0]:=1; s[1]:=0;
    gjd(f[i],f[i-1],s);
    end;
write(f[n,f[n,0]]);
for i:=f[n,0]-1 downto 1 do
    begin
      if f[n,i]>999
        then
          begin
            write(f[n,i]);continue;
          end;
      if f[n,i]>99
        then
          begin
            write('0',f[n,i]);continue;
          end;
      if f[n,i]>9
        then
          begin
            write('00',f[n,i]);continue;
          end;
      write('000');write(f[n,i]);
    end;
writeln;
close(input);
close(output);
end.
