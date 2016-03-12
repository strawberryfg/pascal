var a:array[1..8]of longint;
    b:array[1..8]of longint;
    step1:array[1..10000]of longint;
    step2:array[1..10000]of longint;
    n,m,i,x,y,s,t:longint;
function pd(a,b:longint):boolean;
var i:longint;
begin
pd:=true;
for i:=1 to t do
    if (step1[i]=a)and(step2[i]=b) then begin pd:=false;exit;end;
end;
procedure try(x,y:longint);
var i:longint;
begin
inc(s);
inc(t);
step1[t]:=x;
step2[t]:=y;
if s=n*m then begin
              for i:=1 to t-1 do
                  write('(',step1[i],',',step2[i],')','->');
              writeln('(',step1[t],',',step2[t],')');
              close(input);
              close(output);
              halt;
              end
         else for i:=1 to 8 do
                  if (x+a[i]>0)and(x+a[i]<=n)and(y+b[i]>0)and(y+b[i]<=m) then
                     if pd(x+a[i],y+b[i]) then begin
                                               try(x+a[i],y+b[i]);
                                               dec(s);
                                               step1[t]:=0;step2[t]:=0;
                                               dec(t);
                                               end;
end;
begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output);
a[1]:=1;
a[2]:=2;
a[3]:=2;
a[4]:=1;
a[5]:=-1;
a[6]:=-2;
a[7]:=-2;
a[8]:=-1;
b[1]:=-2;
b[2]:=-1;
b[3]:=1;
b[4]:=2;
b[5]:=2;
b[6]:=1;
b[7]:=-1;
b[8]:=-2;
s:=0;t:=0;
readln(n,m,x,y);
try(x,y);
writeln('No Answer!');
close(input);
close(output);
end.