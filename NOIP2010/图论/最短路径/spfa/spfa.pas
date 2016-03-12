var n,m,st,en,i,x,y,w,cnt,u,v,sum,tail,head,now:longint;
    mark:array[1..100]of boolean;
    link,value:array[1..100,0..100]of longint;
    key,queue:array[1..100]of longint;
begin
assign(input,'spfa.in');
reset(input);
assign(output,'spfa.out');
rewrite(output);
readln(n,st,en);
readln(m);
for i:=1 to m do
  begin
  readln(x,y,w);
  cnt:=link[x,0]+1;
  link[x,cnt]:=y;
  inc(link[x,0]);
  value[x,y]:=w;
  inc(sum);
  //edge[sum,1]:=x; edge[sum,2]:=y;  edge[sum,3]:=w;
  end;
tail:=1; head:=1; queue[1]:=st;
for i:=1 to n do key[i]:=maxlongint;
key[st]:=0;
mark[st]:=true;  //true rudui enter
while (tail<=head) do
  begin
  now:=queue[tail];
  mark[now]:=false;
  for i:=1 to link[now,0] do
      begin
      v:=link[now,i];
      if (key[now]<>maxlongint)and(key[v]>key[now]+value[now,v]) then
         begin
         key[v]:=key[now]+value[now,v];
         if mark[v]=false then
            begin
            inc(head);
            queue[head]:=v;
            mark[v]:=true;
            end;
         end;          
      end;
  inc(tail);
  end;
writeln(key[en]);
close(input);
close(output);
end.