 var i,j,n,min:longint;
    f:array[0..31,0..31]of longint;
procedure sos(x,y,dep:longint);
begin
if (x=1)and(y=1) then if dep<min then begin min:=dep;exit; end;
if dep>=min then exit;
if min=2*n-1 then begin writeln(min);close(input);close(output);halt; end;
if f[x+1,y]=0 then begin f[x+1,y]:=1; sos(x+1,y,dep+1); f[x+1,y]:=0; end;
if f[x,y+1]=0 then begin f[x,y+1]:=1; sos(x,y+1,dep+1); f[x,y+1]:=0; end;
if f[x-1,y]=0 then begin f[x-1,y]:=1; sos(x-1,y,dep+1); f[x-1,y]:=0; end;
if f[x,y-1]=0 then begin f[x,y-1]:=1; sos(x,y-1,dep+1); f[x,y-1]:=0; end;
end;
begin
assign(input,'sos.in'); reset(input); assign(output,'sos.out'); rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do read(f[i,j]);
    readln;
    end;
for i:=0 to n+1 do
    begin f[i,0]:=1; f[i,n+1]:=1;f[0,i]:=1; f[n+1,i]:=1; end;
min:=maxlongint;
sos(n,n,1);
writeln(min);
close(input);
close(output);
end.
