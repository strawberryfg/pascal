const maxn=9;
var
	p,w:array[1..maxn,1..maxn,1..maxn]of longint;
	map:array[1..maxn,1..maxn]of longint;
	x,y:array[1..maxn*maxn]of longint;
	f,i,j,k,t:longint;
procedure print;
var i,j:longint;
begin
for i:=1 to maxn do
	begin
	for j:=1 to maxn-1 do
		write(map[i,j],' ');
	writeln(map[i,maxn]);
	end;
close(input);
close(output);
halt;
end;
procedure try(dep:longint);
var i,j,k,t:longint;
begin
if dep>maxn*maxn
	then print
	else
	if map[x[dep],y[dep]]=0 then
	for i:=1 to maxn do
		if p[x[dep],y[dep]][i]=0
			then begin
			for k:=1 to maxn do
				if (k<>x[dep]) then
				begin
				if map[x[dep],k]=0 then p[x[dep],k][i]:=1
						   else if map[x[dep],k]=i then begin f:=1; break; end;
				if map[k,y[dep]]=0 then p[k,y[dep]][i]:=1
		                                   else if map[k,y[dep]]=i then begin f:=1; break; end;
				end;
			for k:=w[x[dep],y[dep]][1] to w[x[dep],y[dep]][1]+2 do
				for t:=w[x[dep],y[dep]][2] to w[x[dep],y[dep]][2]+2 do
					if map[k,t]=0 then p[x[dep],y[dep]][i]:=1
						      else if map[k,t]=i then begin f:=1; break; end;
                        if f=1 then begin f:=0; end
                        else begin
			map[x[dep],y[dep]]:=i;
			try(dep+1);
                        end;
			map[x[dep],y[dep]]:=0;
			for k:=1 to maxn do
				if (k<>x[dep]) then
				begin
				if map[x[dep],k]=0 then p[x[dep],k][i]:=0;
				if map[k,y[dep]]=0 then p[k,y[dep]][i]:=0;
				end;
			for k:=w[x[dep],y[dep]][1] to w[x[dep],y[dep]][1]+2 do
				for t:=w[x[dep],y[dep]][2] to w[x[dep],y[dep]][2]+2 do
					if map[k,t]=0 then p[x[dep],y[dep]][i]:=0;                                         			end else
                        else try(dep+1);
end;
begin
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);
for i:=1 to maxn do
	for j:=1 to maxn do
		read(map[i,j]);
for i:=1 to maxn do
	for j:=1 to maxn do
		case (i-1) div 3 of
			0:case (j-1) div 3 of
				0:begin w[i,j][1]:=1; w[i,j][2]:=1; end;
				1:begin w[i,j][1]:=1; w[i,j][2]:=4; end;
				2:begin w[i,j][1]:=1; w[i,j][2]:=7; end;
				end;
			1:case (j-1) div 3 of
				0:begin w[i,j][1]:=4; w[i,j][2]:=1; end;
				1:begin w[i,j][1]:=4; w[i,j][2]:=4; end;
				2:begin w[i,j][1]:=4; w[i,j][2]:=7; end;
				end;
			2:case (j-1) div 3 of
				0:begin w[i,j][1]:=7; w[i,j][2]:=1; end;
				1:begin w[i,j][1]:=7; w[i,j][2]:=4; end;
				2:begin w[i,j][1]:=7; w[i,j][2]:=7; end;
				end;
			end;
for i:=1 to maxn do
	for j:=1 to maxn do
		if map[i,j]=0
			then begin
			for k:=1 to maxn do
				begin
				if map[i,k]<>0 then p[i,j][map[i,k]]:=1;
				if map[k,j]<>0 then p[i,j][map[k,j]]:=1;
				end;
			for k:=w[i,j][1] to w[i,j][1]+2 do
				for t:=w[i,j][2] to w[i,j][2]+2 do
					if map[k,t]<>0 then p[i,j][map[k,t]]:=1;
			end;
for i:=1 to maxn*maxn do
	x[i]:=(i-1) div maxn+1;
for i:=1 to maxn*maxn do
	if i mod maxn=0 then y[i]:=maxn
		     else y[i]:=i mod maxn;
try(1);
close(input);
close(output);
end.




































