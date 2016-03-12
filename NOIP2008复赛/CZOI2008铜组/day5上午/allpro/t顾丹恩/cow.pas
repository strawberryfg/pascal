var a,b,c,d,i,j,m,n:longint;
v:array[0..201] of longint;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
fillchar(v,sizeof(v),0);
v[1]:=1;
v[2]:=1;
v[3]:=1;
v[4]:=2;
for i:=5 to n do
v[i]:=v[i-1]+v[i-3];
writeln(v[n]);
close(input);
close(output);
end.
