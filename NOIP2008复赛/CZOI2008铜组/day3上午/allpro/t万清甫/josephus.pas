const maxn=28;
var a:array[1..maxn]of longint;
    k:longint;
procedure start;
var i:longint;
begin
for i:=1 to 2*k do a[i]:=i;
end;
procedure try;
var pd:boolean;
    loc,m,i,j,p,t,tot:longint;
begin
m:=k+1;
loc:=1;
tot:=2*k;
pd:=false;
while pd=false do
      begin
      loc:=(loc+m-1)mod tot;
      if loc=0 then loc:=tot;
      if a[loc]<=k then begin start;inc(m);loc:=1;tot:=2*k; end
         else begin
              dec(tot);
              for i:=loc to tot do a[i]:=a[i+1];
              end;
      if tot=k then begin pd:=true;writeln(m); end;
      end;
end;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
readln(k);
start;
try;
close(input);
close(output);
end.