var m,n,i,j,k,cnt,x,y,v,tail,head,minlen,mincost,t:longint;
    link,jihe,edge,f:array[0..10000,0..1000]of longint;
    last,now,value,len,en:array[1..1000000]of longint;
begin
assign(input,'paths.in');
reset(input);
assign(output,'paths.out');
rewrite(output);
readln(m,n);
fillchar(f,sizeof(f),0);
for i:=1 to n do
    begin
    readln(x,y,v);
    link[x,y]:=v;
    cnt:=edge[x,0]+1;
    edge[x,cnt]:=y;
    edge[x,0]:=cnt;
    f[x,y]:=1;
    end;
tail:=1; head:=1;
last[1]:=-1; now[1]:=0; jihe[1,0]:=1;jihe[1,1]:=0;
value[1]:=0; len[1]:=0;
minlen:=maxlongint; mincost:=maxlongint;
{for k:=0 to n do
    begin
    for i:=0 to n do
        begin
        for j:=0 to n do
            begin
            if (k<>i)and(k<>j)and(i<>j)and(f[i,k]<>0)and(f[k,j]<>0) then
               begin
               if (f[i,j]=0)or(f[i,k]+f[k,j]<f[i,j]) then
                 f[i,j]:=f[i,k]+f[k,j];
               end;
            end;
        end;
    end;
    }
while tail<=head do
  begin
  t:=now[tail];
  for i:=1 to edge[t,0] do
      begin
      if len[tail]+1>minlen then continue;
      inc(head);
      last[head]:=t;
      now[head]:=edge[t,i];
      {jihe[head]:=jihe[tail];
      cnt:=jihe[head,0]+1;
      jihe[head,cnt]:=now[head];
      jihe[head,0]:=cnt;}
      value[head]:=value[tail]+link[t,edge[t,i]];
      en[head]:=edge[t,i];
      len[head]:=len[tail]+1;
      if edge[t,i]=1 then
         begin
         if len[head]<minlen then begin minlen:=len[head]; mincost:=value[head]; end
            else if (len[head]=minlen)and(value[head]<mincost) then mincost:=value[head];
         end;
      end;
  inc(tail);
  end;
writeln(mincost);
close(input);
close(output);
end.