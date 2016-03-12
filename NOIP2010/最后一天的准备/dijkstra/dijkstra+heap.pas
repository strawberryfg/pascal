//14:54
var i,t,n,m,x,y,z,tot,num,now:longint;
	pos,heap,key:array[1..100]of longint;
	value,edge:array[1..100,0..100]of longint;
	exist:array[1..100]of boolean;
procedure modify(id,v:longint);
var p,tmp:longint;
begin
if v<key[id] then
	begin
	key[id]:=v;
	p:=pos[id];
	while p div 2>=1 do
		begin
		if key[heap[p]]<key[heap[p div 2]] then
			begin
                      	tmp:=pos[heap[p]]; pos[heap[p]]:=pos[heap[p div 2]]; pos[heap[p div 2]]:=tmp;
			tmp:=heap[p]; heap[p]:=heap[p div 2]; heap[p div 2]:=tmp;

			p:=p div 2;
			end
		else break;
		end;
	end;
end;
procedure extract;
var p,tmp,t1,t2,pnum:longint;
begin
num:=heap[1];
now:=key[num];
pos[heap[1]]:=pos[heap[tot]]; pos[heap[tot]]:=0;
heap[1]:=heap[tot]; heap[tot]:=0;

dec(tot);
exist[num]:=false;
p:=1;
while (p*2<=tot)do
	begin
	t1:=key[heap[p*2]]; if p*2+1<=tot then t2:=key[heap[p*2+1]] else t2:=maxlongint;
	if t1<=t2 then pnum:=0 else pnum:=1;
	if key[heap[p]]>key[heap[p*2+pnum]] then
		begin
                tmp:=pos[heap[p]]; pos[heap[p]]:=pos[heap[p*2+pnum]]; pos[heap[p*2+pnum]]:=tmp;
		tmp:=heap[p]; heap[p]:=heap[p*2+pnum]; heap[p*2+pnum]:=tmp;

		p:=p*2+pnum;
		end
	else break;
	end;
end;
begin
assign(input,'dij.in');
reset(input);
readln(n,m);
for i:=1 to m do
	begin
	readln(x,y,z);
	inc(edge[x,0]);
	edge[x,edge[x,0]]:=y;
	value[x,y]:=z;
	end;
for i:=1 to n do
	begin
	pos[i]:=i;
	heap[i]:=i;
	exist[i]:=true;
	key[i]:=maxlongint;
	end;
tot:=n;
key[1]:=0;
while tot>0 do
	begin
	extract;
	if now=maxlongint then break;
	for i:=1 to edge[num,0] do
		begin
		t:=edge[num,i];
		if exist[t] then modify(t,key[num]+value[num,t]);
		end;
	end;
writeln(key[n]);
close(input);
end.
