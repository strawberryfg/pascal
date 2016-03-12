var i,n,k,low,high,mid:longint;
    hash,num,f:array[0..10000,0..10000]of longint;
    pos,a:array[1..10000]of longint;
function ok(len:longint):boolean;
var now,t,sum,start,i:longint;
    pd,mark:boolean;
begin
now:=1;
while (now+len-1<=n) do
  begin
  pd:=true;
  t:=hash[a[now],pos[now]+1];
  if t=0 then pd:=false;
  sum:=1;
  while pd do
    begin
    if t+len-1>n then begin pd:=false;break; end;
    {if num[n,a[now]]-num[t-1,a[now]]+sum<k then
       begin if pos[t]+1>hash[a[now,0]] then
                begin pd:=false;break; end;
             t:=hash[a[now],pos[t]+1]; continue;
       end; }
    start:=t;
    if (f[now,t]<>0) then
       begin
       if f[now,t]>=len then
          begin
          inc(sum);
          if pos[t]+1>hash[a[now],0] then begin pd:=false; break; end;
          t:=hash[a[now],pos[t]+1]; continue; end;
       start:=t+f[now,t]+1-1;
       end;
    mark:=true;
    for i:=start to t+len-1 do
        begin
        if a[i]<>a[now+i-t] then
           begin
           f[now,t]:=(i-1-t+1);
           mark:=false;
           break;
           end;
        end;
    if mark then inc(sum);
    if sum>=k then begin pd:=false;break; end;
    if pos[t]+1>hash[a[now],0] then begin pd:=false;break; end;
    t:=hash[a[now],pos[t]+1];
    end;
  if sum>=k then exit(true);
  inc(now);
  end;
exit(false);
end;
begin
assign(input,'patterns.in');
reset(input);
assign(output,'patterns.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
    begin
    read(a[i]);
    inc(hash[a[i],0]);
    hash[a[i],hash[a[i],0]]:=i;
    num[i]:=num[i-1];
    num[i,a[i]]:=num[i-1,a[i]]+1;
    pos[i]:=hash[a[i],0];
    end;
low:=1; high:=n;
while low<high-1 do
  begin
  mid:=(low+high)div 2;
  if ok(mid) then low:=mid else high:=mid;
  end;
if ok(low) then writeln(low)
   else if ok(high) then writeln(high) else writeln(0);
close(input);
close(output);
end.