var n,i,count,mid,now,min:longint;
    check:boolean;
    tmp,sum,a,delta:array[0..100000]of longint;
procedure dfs(dep:longint);
begin
if dep>n then
    begin
    inc(count)
    end
   else begin
        if not check then exit;
        a[dep]:=sum[dep-1]-a[dep-1];
        if a[dep]<a[dep-1] then begin check:=false; exit; end;
        dfs(dep+1);
        end;
end;
begin
assign(input,'seq.in');
reset(input);
assign(output,'seq.out');
rewrite(output);
readln(n);
for i:=1 to n do begin read(sum[i]);tmp[i]:=sum[i];sum[i]:=sum[i]*2; end;
for i:=1 to n-1 do
    begin
    delta[i]:=sum[i+1]-sum[i];    // a[i+2]-a[i] shu zong:n+1
    end;
count:=0;
mid:=sum[1] div 2;
now:=mid;
  check:=true;
  a[1]:=now;
  dfs(2);
min:=2147483647;
a[n+1]:=sum[n]-a[n];
if check=true then if a[n+1]<a[n] then check:=false;
if check=false then min:=0
else
begin
for i:=1 to n do
    begin
    if i mod 2=0 then
       begin
       if tmp[i]-a[i]+1<min then min:=tmp[i]-a[i]+1;
       end;
    end;
end;
writeln(min);
close(input);
close(output);
end.