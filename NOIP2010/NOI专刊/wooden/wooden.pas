var i,now,ahead,n,tt,sum:longint;
    len,wei,vis:array[1..50000]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y,tt: longint;
      begin
         i:=l;
         j:=r;
         x:=len[(l+r) div 2];
         tt:=wei[(l+r)div 2];
         repeat
           while (len[i]<x)or((len[i]=x)and(wei[i]<tt)) do
            inc(i);
           while (x<len[j])or((x=len[j])and(tt<wei[j])) do
            dec(j);
           if not(i>j) then
             begin
                y:=len[i];
                len[i]:=len[j];
                len[j]:=y;
                y:=wei[i];
                wei[i]:=wei[j];
                wei[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
begin
assign(input,'wooden.in');
reset(input);
assign(output,'wooden.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    read(len[i],wei[i]);
    end;
sort(1,n);
now:=1;
while true do
  begin
  now:=1;
  while (now<=n)and(vis[now]=1) do inc(now);
  if now>n then break;
  inc(sum);
  tt:=wei[now];
  ahead:=now;
  while (ahead<=n) do
    begin
    if (vis[ahead]=0)and(tt<=wei[ahead]) then
       begin
       tt:=wei[ahead];
       vis[ahead]:=1;
       inc(ahead);
       end
    else inc(ahead);
    end;
  end;
writeln(sum);
close(input);
close(output);
end.