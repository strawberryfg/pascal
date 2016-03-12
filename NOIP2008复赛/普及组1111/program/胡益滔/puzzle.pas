var
	i,j:longint;
	g:array[1..10,0..9] of longint;
	f1,f2:array[1..9,0..9] of boolean;
	f3:array[1..3,1..3,0..9] of boolean;

procedure print;
var
        i,j:longint;
begin
        for i:=1 to 9 do
	begin
	        for j:=1 to 8 do
	                write(g[i,j],' ');
	        writeln(g[i,9]);
	end;
end;

procedure try(x,y:longint);
var
	i:longint;
begin
        if g[x,y]>0 then
        begin
                if y<9 then try(x,y+1) else try(x+1,1);
                exit;
        end;
	if x>9 then
	begin
                print;
		close(input);
		close(output);
		halt;
	end;
	for i:=1 to 9 do
	begin
		if f1[x,i] or f2[y,i]
		or f3[(x-1) div 3+1,(y-1) div 3+1,i]
		then continue;
		g[x,y]:=i;
		f1[x,i]:=true;
		f2[y,i]:=true;
		f3[(x-1) div 3+1,(y-1) div 3+1,i]:=true;
		if y<9 then try(x,y+1) else try(x+1,1);
                g[x,y]:=0;
		f1[x,i]:=false;
		f2[y,i]:=false;
		f3[(x-1) div 3+1,(y-1) div 3+1,i]:=false;
	end;
end;

begin
	assign(input,'puzzle.in');
	reset(input);
	assign(output,'puzzle.out');
	rewrite(output);
    	for i:=1 to 9 do
    	begin
        	for j:=1 to 9 do
        	begin
            		read(g[i,j]);
            		f1[i,g[i,j]]:=true;
            		f2[j,g[i,j]]:=true;
            		f3[(i-1) div 3+1,(j-1) div 3+1,g[i,j]]:=true;
        	end;
        	readln;
    	end;
    	try(1,1);
	close(input);
	close(output);
end.
