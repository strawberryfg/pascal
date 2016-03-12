var m,n,i,t,len:longint;
    a,b,s,f:string;
procedure image;
var i:longint;
    t:string;
begin
for i:=1 to length(a) do
    t:=a[i]+t;
a:=t;
end;
procedure del;
var i:longint;
begin
for i:=ord(f[0]) downto 1 do
    if f[i]=' ' then delete(f,i,1);
end;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(m,n);
readln(a);
readln(b);
readln(t);
if m<n
  then
  begin
    for i:=1 to n do
        f:=f+b[i]+' ';
    for i:=1 to t do
        f[(t-i+1)*2]:=a[i];
    delete(a,1,t);
    image;
    f:=copy(a,t+1,length(a)-t)+f;
    del;
  end
  else
  begin
    for i:=n downto 1 do
        f:=f+a[i]+' ';
    for i:=1 to t do
        f[(t-i+1)*2]:=b[i];
    f:=f+copy(b,t+1,length(b)-t);
    del;
  end;
for i:=1 to ord(f[0]) do
    write(f[i]);
writeln;
close(input);
close(output);
end.
