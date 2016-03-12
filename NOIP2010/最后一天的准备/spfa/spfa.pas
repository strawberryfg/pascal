//14:34
var t,n,m,i,x,y,z,tail,head,now:longint;
	dis,que,cnt:array[1..100]of longint;
	edge,f:array[1..100,0..100]of longint;
	mark:array[1..100]of boolean;
	pd:boolean;
begin
readln(n,m);
for i:=1 to m do
	begin
	readln(x,y,z);
	inc(edge[x,0]);
	edge[x,edge[x,0]]:=y;
	inc(edge[y,0]);
	edge[y,edge[y,0]]:=x;
	f[x,y]:=z;
	f[y,x]:=z;
	end;for i:=1 to n do dis[i]:=maxlongint;
dis[1]:=0; mark[1]:=true; que[1]:=1; cnt[1]:=1;
tail:=1; head:=1;
pd:=false;
while (tail<=head)do
	begin
	now:=que[tail];
	for i:=1 to edge[now,0] do
		begin
		t:=edge[now,i];
		if (dis[now]<>maxlongint)and(dis[now]+f[now,t]<dis[t]) then
			dis[t]:=dis[now]+f[now,t];
		if not mark[t] then
			begin
			inc(head);
			que[head]:=t;
			mark[t]:=true;
			inc(cnt[t]);
			if cnt[t]>n then
				begin
				pd:=true;
				break;
				end;
			end;
		end;
	if pd then break;
	mark[now]:=false;
	inc(tail);
	end;if pd then writeln('fuquanhuilu')
	else  writeln(dis[n]);
end.
