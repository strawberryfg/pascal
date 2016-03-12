var a:array[1..9,1..9]of longint;
    n,i,j:longint;
procedure print;
        var i,j:longint;
        begin
        for i:=1 to 9 do
                begin
                for j:=1 to 8 do
                        write(a[i,j],' ');
                writeln(a[i,9]);
                end;
        end;
function find(z,x,y:longint):boolean;
        var i,j:longint;
        begin
        find:=true;
        for i:=1 to 9 do
                if ((a[x,i]=z)and(i<>y))or((a[i,y]=z)and(i<>x)) then
                begin find:=false;exit;end;
        for i:=((x-1) div 3)*3+1 to ((x-1) div 3+1)*3 do
                for j:=((y-1) div 3)*3+1 to ((y-1) div 3+1)*3 do
                        if (a[i,j]=z)and(i<>x)and(j<>y) then
                        begin find:=false;exit;end;
        end;
procedure zhao(dep:longint);
        var i,k:longint;
        begin
        k:=dep mod 9;if k=0 then k:=9;
        if dep>81 then begin print;close(input);close(output);halt;end
                  else if a[(dep+8)div 9,k]<>0 then zhao(dep+1)
                  else for i:=1 to 9 do
                           begin
                           a[(dep+8)div 9,k]:=i;
                           if find(i,(dep+8)div 9,k) then zhao(dep+1);
                           a[(dep+8)div 9,k]:=0;
                           end;
        end;
begin
assign(input,'puzzle.in');reset(input);
assign(output,'puzzle.out');rewrite(output);
for i:=1 to 9 do
        begin
        for j:=1 to 9 do
                read(a[i,j]);
        readln;
        end;
zhao(1);
end.
