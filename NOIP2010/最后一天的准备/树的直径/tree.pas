//16:32    16:52
var i,n,m,x,y,w:longint;
	edge,f:array[1..100,0..100]of longint;
	que,dis,from:array[1..100]of longint;
        hash:array[1..100]of integer;
function fun(x,cho:longint):longint;
var tail,head,now,i,t,num,nowmax:longint;
begin
fillchar(que,sizeof(que),0);
fillchar(hash,sizeof(hash),0);
tail:=1; head:=1; que[1]:=x; from[1]:=0;
hash[x]:=1;
num:=0; nowmax:=0;

while tail<=head do
	begin
	now:=que[tail];
	for i:=1 to edge[now,0] do
		begin
                t:=edge[now,i];
                if hash[t]=1 then continue;
		if (t<>from[tail]) then
			begin
			inc(head);
                        hash[t]:=1;
			que[head]:=t;
			from[head]:=now;
			dis[head]:=dis[tail]+f[now,t];
			if dis[head]>nowmax then
				begin
				num:=t;
				nowmax:=dis[head];
				end;
			end;
		end;
	inc(tail);
	end;
if cho=2 then exit(nowmax)
	else exit(fun(num,2));
end;
begin
assign(input,'tree.in');
reset(input);
readln(n,m);
for i:=1 to m do
	begin
	readln(x,y,w);
	inc(edge[x,0]);
	edge[x,edge[x,0]]:=y;
        inc(edge[y,0]);
        edge[y,edge[y,0]]:=x;
	f[x,y]:=w;
        f[y,x]:=w;
	end;
writeln(fun(1,1));
close(input);
end.
