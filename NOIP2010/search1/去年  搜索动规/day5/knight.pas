const px:array[1..8] of longint=(-2,-1,1,2,2,1,-1,-2);
      py:array[1..8] of longint=(-1,-2,-2,-1,1,2,2,1);
var n,m,i,j,min:longint;
    x,y:array[1..20] of longint;
    d,g:array[1..20,1..20] of longint;
    q:array[0..1,1..100000] of longint;
    l:array[1..100000] of longint;
    bo:array[1..20,1..20] of boolean;
    hash:array[1..10] of boolean;
procedure init;
begin
	fillchar(g,sizeof(g),0);
	fillchar(d,sizeof(d),$ff);
	read(n,m);
	for i:=1 to m do
	  begin read(x[i],y[i]);g[x[i],y[i]]:=i;end;
end;
procedure bfs(a,b:longint);
var h,t,x,y,tx,ty,i:longint;
begin
	fillchar(bo,sizeof(bo),false);
        fillchar(q,sizeof(q),0);
	fillchar(l,sizeof(l),0);
	h:=0;t:=1;l[1]:=0;
	q[0,1]:=a;q[1,1]:=b;
        d[g[a,b],g[a,b]]:=0;
	bo[a,b]:=true;
	repeat
	 inc(h);
	 x:=q[0,h];y:=q[1,h];
	 for i:=1 to 8 do
	   begin
	   tx:=x+px[i];ty:=y+py[i];
	   if (tx>0) and (tx<=n) and (ty>0) and (ty<=n) then
	      begin
	      inc(t);
	      q[0,t]:=tx;q[1,t]:=ty;l[t]:=l[h]+1;
	      if bo[tx,ty]=false then
		 begin
	         bo[tx,ty]:=true;
		 if g[tx,ty]<>0 then d[g[a,b],g[tx,ty]]:=l[t];
		 end
              else
                 dec(t);
	      end;
	   end;
	until h=t;
end;
procedure dfs(s,v,dep,len:longint);
var i,j:longint;
begin
	if len>min then exit;
	if dep=m then
	   begin
	   if (len+d[v,s]<min) and (d[v,s]<>-1) then min:=len+d[v,s];
	   exit;
	   end;
	for i:=1 to m do
	 if (hash[i]=false) and (d[v,i]<>-1) then
	    begin
	    hash[i]:=true;
	    dfs(s,i,dep+1,len+d[v,i]);
	    hash[i]:=false;
	    end;
end;
begin
assign(input,'knight.in');reset(input);
assign(output,'knight.out');rewrite(output);
	init;
	for i:=1 to m do bfs(x[i],y[i]);
	min:=maxlongint;
	for i:=1 to m do
	  begin
	  fillchar(hash,sizeof(hash),false);
	  hash[i]:=true;
	  dfs(i,i,1,0);
	  end;
	writeln(min);
close(input);close(output);
end.
