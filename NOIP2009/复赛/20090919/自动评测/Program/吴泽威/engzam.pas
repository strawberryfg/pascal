var m,n,i,j,t,k,l,r,mid,ans:longint;
    s:array [1..100000] of string[10];
    a:array [1..100000] of longint;
    ss:string;

procedure sort(l,r:longint);
var i,j,t:longint;
    x,y:string[10];
begin
i:=l; j:=r;
x:=s[random(r-l+1)+l];
repeat while s[i]<x do inc(i);
       while s[j]>x do dec(j);
       if i<=j then begin
		    y:=s[i]; s[i]:=s[j]; s[j]:=y;
		    t:=a[i]; a[i]:=a[j]; a[j]:=t;
                    inc(i); dec(j);
		    end;
until i>j;
if j>l then sort(l,j);
if i<r then sort(i,r);
end;

begin
assign(input,'engzam.in');
assign(output,'engzam.out');
reset(input);
rewrite(output);
readln(n,m);
for i:=1 to n do
  begin
  readln(ss);
  t:=pos(' ',ss);
  s[i]:=copy(ss,1,t-1);
  val(copy(ss,t+1,255),k);
  a[i]:=k;
  end;
sort(1,n);
for j:=1 to m do
  begin
  readln(ss);
  t:=pos(' ',ss);
  val(copy(ss,t+1,255),k);
  ss:=copy(ss,1,t-1);
  l:=0;
  r:=n+1;
  while r-l>1 do
    begin
    mid:=(l+r) shr 1;
    if s[mid]<ss then l:=mid;
    if s[mid]>=ss then r:=mid;
    end;
  ans:=0;
  l:=length(ss);
  for i:=r to n do
    begin
    if copy(s[i],1,l)<>ss then break;
    if a[i]>=k then inc(ans);
    end;
  writeln(ans);
  end;
close(input);
close(output);
end.
