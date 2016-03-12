var n,m,x,y,i,j:longint; a:array[-2..100,-2..100] of boolean;
hang,lie:array[1..1000] of longint;
procedure print;
   var i:longint;
   begin
   for i:=1 to n*m-1 do
   write('(',hang[i],',',lie[i],')','->');
   write('(',hang[n*m],',',lie[n*m],')');
   close(input);
   close(output);
   halt;
   end;
procedure try(x,y,dep:longint);
    begin
    a[x,y]:=false;
    if dep=n*m then print;
    if a[x-2,y-1]=true then begin hang[dep]:=x;
    lie[dep]:=y;try(x-2,y-1,dep+1);  hang[dep]:=0;
    lie[dep]:=0;dep:=dep-1; a[x-2,y-1]:=true; end;
    if a[x-2,y+1]=true then begin hang[dep]:=x;
    lie[dep]:=y;try(x-2,y+1,dep+1);  hang[dep]:=0;
    lie[dep]:=0;dep:=dep-1; a[x-2,y+1]:=true; end;
    if a[x-1,y+2]=true then begin hang[dep]:=x;
    lie[dep]:=y;try(x-1,y+2,dep+1);  hang[dep]:=0;
    lie[dep]:=0;dep:=dep-1; a[x-1,y+2]:=true; end;
    if a[x+1,y+2]=true then begin hang[dep]:=x;
    lie[dep]:=y;try(x+1,y+2,dep+1);  hang[dep]:=0;
    lie[dep]:=0;dep:=dep-1; a[x+1,y+2]:=true; end;
    if a[x+2,y-1]=true then begin hang[dep]:=x;
    lie[dep]:=y;try(x+2,y-1,dep+1);  hang[dep]:=0;
    lie[dep]:=0; dep:=dep-1;a[x+2,y-1]:=true; end;
    if a[x+2,y+1]=true then begin hang[dep]:=x;
    lie[dep]:=y;try(x+2,y+1,dep+1);  hang[dep]:=0;
    lie[dep]:=0; dep:=dep-1;a[x+2,y+1]:=true; end;
    if a[x-1,y-2]=true then begin hang[dep]:=x;
    lie[dep]:=y;try(x-1,y-2,dep+1);   hang[dep]:=0;
    lie[dep]:=0;dep:=dep-1;a[x-1,y-2]:=true; end;
    if a[x+1,y-2]=true then begin hang[dep]:=x;
    lie[dep]:=y;try(x+1,y-2,dep+1);   hang[dep]:=0;
    lie[dep]:=0;dep:=dep-1;a[x+1,y-2]:=true; end;
    if (x=i) and (y=j) then begin writeln('No Answer!'); close(input);close(output);halt;end;
    hang[dep]:=0;
    lie[dep]:=0;
    end;
begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output);
readln(n,m,x,y);
for i:=1-2 to n+2 do
   for j:=1-2 to m+2 do
   a[i,j]:=false;
   for i:=1 to n do
      for j:=1 to m do
      a[i,j]:=true;
      i:=x;
      j:=y;
   try(x,y,1);
close(input);
close(output);
end.