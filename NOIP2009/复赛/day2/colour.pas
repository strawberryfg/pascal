var n,m,i,x,y,sum:longint;
    link:array[1..10,1..10]of longint;
    num:array[1..10]of longint;
procedure try(dep:longint);
var i,j:longint;
    pd:boolean;
begin
if dep>n then inc(sum)
   else for i:=1 to 4 do
            begin
            pd:=true;
	    for j:=1 to dep-1 do
                if (link[dep,j]=1)and(i=num[j]) then begin pd:=false;break; end;
            if pd=true then
               begin
               num[dep]:=i;
               try(dep+1);
               end;
            end;
end;
begin
assign(input,'colour.in');
reset(input);
assign(output,'colour.out');
rewrite(output);
readln(n,m);
for i:=1 to m do begin readln(x,y);link[x,y]:=1;link[y,x]:=1; end;
try(1);
writeln(sum);
close(input);
close(output);
end.
