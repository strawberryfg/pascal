program panda;
var n:integer;
    k:longint;
    a,zz:array[0..120] of longint;
    f:array[1..100000] of longint;

procedure init;
var i,j,temp:integer;
begin
readln(n,k);
for i:=1 to n do read(a[i]);
end;

procedure sift(l,n:integer);
var i,j:integer;
    x,xx:longint;
begin
 i:=l;j:=2*i;x:=a[i]*f[zz[i]];xx:=zz[i];
 while j<=n do
  begin
   if (j<n)and(a[j]*f[zz[j]]>a[j+1]*f[zz[j+1]]) then inc(j);
   if x>a[j]*f[zz[j]] then
    begin
     a[i]:=a[j];
     zz[i]:=zz[j];
     i:=j;
     j:=2*i;
    end
   else j:=n+1;
  end;
 zz[i]:=xx;
 a[i]:=x div f[zz[i]];
end;

procedure heapsort(n:integer);
var i:integer;
begin
 for i:=(n div 2) downto 1 do sift(i,n);
end;

procedure main;
var i,j:longint;
begin
fillchar(zz,sizeof(zz),0);
for i:=1 to n do zz[i]:=1;
for i:=1 to n do f[i]:=a[i];
heapsort(n);
j:=n;
while j<k do
 begin
  if a[1]*f[zz[1]]=f[j] then inc(zz[1])
  else begin
    inc(j);
    f[j]:=a[1]*f[zz[1]];
    inc(zz[1]);
   end;
  sift(1,n);
 end;
writeln(f[k]);
end;

begin
assign(input,'panda.in');assign(output,'panda.out');
reset(input);rewrite(output);
init;
main;
close(input);close(output);
end.