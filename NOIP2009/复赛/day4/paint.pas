var i,n,t:longint;
    s:string;
    f:array[1..100,1..100]of longint;
function doit(beg,en:longint):longint;
var i:longint;
begin
if f[beg,en]<>0 then exit(f[beg,en]);
if s[beg]=s[en] then f[beg,en]:=doit(beg+1,en)
   else begin
        for i:=beg to en do
            begin
            t:=doit(beg,i)+doit(i+1,en);
            if (f[beg,en]=0)or(t<f[beg,en]) then f[beg,en]:=t;
            end;
        end;
exit(f[beg,en]);
end;
begin
assign(input,'paint.in');
reset(input);
assign(output,'paint.out');
rewrite(output);
readln(s);
n:=length(s);
for i:=1 to n do f[i,i]:=1;
writeln(doit(1,n));
close(input);
close(output);
end.