var n,sum,tot,t,i:longint;
    ten:array[0..10]of longint;
    pd:boolean;
function check(x:longint):boolean;
var i:longint;
    ts:string;
begin
str(x,ts);
for i:=1 to length(ts) div 2 do
    begin
    if ts[i]<>ts[length(ts)+1-i] then exit(false);
    end;
exit(true);
end;
procedure dfs(dep,max,now:longint);
var down,i,tt:longint;
begin
if dep>(max+1)div 2 then
   begin
   if (n-now>=now) then
      begin
      pd:=check(n-now);
      if pd then
         if n-now=now then inc(sum,1)
            else inc(sum,2);
      end;
   exit;
   end;
down:=0; if dep=1 then inc(down);
for i:=down to 9 do
    begin
    tt:=now+ten[dep-1]*i;
    if max-dep<>dep-1 then tt:=tt+ten[max-dep]*i;
    dfs(dep+1,max,tt);
    end;
end;
begin
assign(input,'psum.in');
reset(input);
assign(output,'psum.out');
rewrite(output);
readln(n);
sum:=0;
tot:=0;
t:=n;
while  t<>0 do
 begin
 inc(tot);
 t:=t div 10;
 end;
ten[0]:=1; for i:=1 to 9 do ten[i]:=ten[i-1]*10;
for i:=1 to 9 do
    if check(i)and(check(n-i)) then inc(sum,2);
for i:=2 to (tot) do
    begin
    dfs(1,i,0);
    end;
writeln(sum);
close(input);
close(output);
end.
