var f,a:array[1..9,1..9]of longint;
    i,j,pi,pj,t:longint;
function nine(i,j,ans:longint):boolean;
var ti,tj,k,l:longint;
begin
nine:=true;
ti:=(i-1) div 3;
tj:=(j-1) div 3;
for k:=ti*3+1 to ti*3+3 do
    for l:=tj*3+1 to tj*3+3 do
        begin
        if (ans=f[k,l])and(k<>i)and(l<>j) then exit(false);
        end;
end;
procedure print;
var i,j:longint;
begin
for i:=1 to 9 do
    begin
    for j:=1 to 8 do
        write(f[i,j],' ');
    write(f[i,9]);
    writeln;
    end;
end;
procedure endfile;
begin
close(input);
close(output);
end;
procedure find(i,j:longint);
begin
if j+1>9 then begin pi:=i+1;pj:=1; end
   else begin pi:=i;pj:=j+1; end;
end;
function check(i,j,ans:longint):boolean;
var k:longint;
begin
check:=true;
for k:=1 to i-1 do
        if f[k,j]=ans then exit(false);
for k:=1 to j-1 do
    if f[i,k]=ans then exit(false);
for k:=j+1 to 9 do
    if f[i,k]=ans then exit(false);
for k:=i+1 to 9 do
    if f[k,j]=ans then exit(false);
end;
procedure try(x,y,dep:longint);
var i,j:longint;
begin
if dep>81 then begin print;endfile;halt; end
   else begin
        if a[x,y]<>0 then begin find(x,y);try(pi,pj,dep+1); end
           else begin
                for i:=1 to 9 do
                    begin
                    if (check(x,y,i)=true)and(nine(x,y,i)=true) then
                       begin
                       f[x,y]:=i;
                       find(x,y);
                       try(pi,pj,dep+1);
                       f[x,y]:=0;
                       end
                    end;
                end;
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
        read(t);
        a[i,j]:=t;
        f[i,j]:=t;
        end;
    readln;
    end;
try(1,1,1);
close(input);
close(output);
end.
