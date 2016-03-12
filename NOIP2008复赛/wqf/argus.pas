const maxn=3000;
var i,k,normal,max:longint;
    s:string;
    x:array[1..maxn]of integer;
    y:array[1..maxn]of integer;
    t:array[1..maxn,1..2] of integer;
procedure cut(t:string;n:longint);
var i,a,b:longint;
    tmp:string;
    code:integer;
begin
i:=10;
while t[i]<>' ' do inc(i);
tmp:=copy(t,10,i-10);
val(tmp,a,code);
tmp:=copy(t,i+1,length(t)-i);
val(tmp,b,code);
x[n]:=a;
y[n]:=b;
if b>max then begin max:=b;normal:=n; end;
end;
begin
{assign(input,'argus.in');
reset(input);
assign(output,'argus.out');
rewrite(output);}
i:=1;
readln(s);
while not (s='#') do
      begin
      cut(s,i);
      readln(s);
      inc(i);
      end;
readln(k);
while tot<k do
      begin
      for j:=1 to i-1 do
          if k mod y[j]=0 then begin inc(sum);t[sum,1]:=j;t[sum,2]:=x[j]; end;
      end;
close(input);
close(output);
end.
