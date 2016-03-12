type rec=array[1..3]of extended;
var i,n,m,t1,t2,a,b,now,done,tot,j:longint;
    ans:extended;
    edge:array[1..1000002,1..3]of extended;
    x,y:array[1..10000]of longint;
    fa:array[1..10000]of longint;
    procedure sort(l,r: longint);
      var
         i,j: longint;
         tmp:rec;
         tt:extended;
      begin
         i:=l;
         j:=r;
         tt:=edge[(l+r) div 2,3];
         repeat
           while edge[i,3]<tt do
            inc(i);
           while tt<edge[j,3] do
            dec(j);
           if not(i>j) then
             begin
                tmp:=edge[i];
                edge[i]:=edge[j];
                edge[j]:=tmp;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function calc(a,b:longint):extended;
var t1,t2:longint;
    t:extended;
    mid:int64;
begin
t1:=abs(x[a]-x[b]); t2:=abs(y[a]-y[b]);
mid:=int64(t1)*int64(t1)+int64(t2)*int64(t2);
t:=sqrt(mid);
exit(t);
end;
function getf(x:longint):longint;
begin
if fa[x]=x then exit(x)
	else fa[x]:=getf(fa[x]);
exit(fa[x]);
end;
begin
assign(input,'roads.in');
reset(input);
assign(output,'roads.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
	begin
	readln(x[i],y[i]);
	fa[i]:=i;
	end;
for i:=1 to m do
	begin
	readln(a,b);
	t1:=getf(fa[a]); t2:=getf(fa[b]);
	if t1<>t2 then
		begin
		fa[t2]:=t1;
		end;
	end;
for i:=1 to n-1 do
	begin
	for j:=i+1 to n do
		begin
		inc(tot);
		edge[tot,1]:=i;
		edge[tot,2]:=j;
		edge[tot,3]:=calc(i,j);
		end;
	end;
sort(1,tot);
now:=1; done:=1;
while (now<=tot)and(done<=n-1)do
	begin
	a:=trunc(edge[now,1]); b:=trunc(edge[now,2]);
	t1:=getf(fa[a]); t2:=getf(fa[b]);
	if t1<>t2 then
		begin
		inc(done);
		ans:=ans+edge[now,3];
		fa[t2]:=t1;
		end;
	inc(now);
	end;
writeln(ans:0:2);
close(input);
close(output);
end.
