const maxn=100;
type arr=array[1..maxn]of longint;
var total,sum,n,k,i:longint;
    a,s:arr;
function prime(n:longint):boolean;
var i:longint;
  begin
  if n=1 then begin prime:=false;exit end;
  prime:=true;
  for i:=2 to trunc(sqrt(n)) do
      if n mod i=0 then begin prime:=false;exit;end;
  end;
procedure search;
var i:longint;
  begin
  for i:=1 to k do
      total:=total+s[a[i]];
  if prime(total) then inc(sum);
  end;
procedure try(dep,b,e:longint);
var i:longint;
 begin
 if dep>k then begin search;total:=0; end
          else for i:=b to e do
                   begin
                   a[dep]:=i;
                   try(dep+1,i+1,e+1);
                   end;
 end;
begin
read(n,k);
for i:=1 to n do
    read(s[i]);
for i:=1 to k do
    a[i]:=i;
try(1,1,n-k+1);
writeln(sum);
end.