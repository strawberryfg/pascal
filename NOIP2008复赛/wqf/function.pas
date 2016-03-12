var a,b,c:longint;
    f:array[-50..50,-50..50,-50..50]of longint;
function w(a,b,c:longint):longint;
begin
if f[a,b,c]>0 then begin w:=f[a,b,c];exit; end;
if (a<=0)or(b<=0)or(c<=0) then f[a,b,c]:=1
   else if (a>20)or(b>20)or(c>20) then f[a,b,c]:=w(a-1,b,c)+w(a-1,b-1,c)+w(a-1,b,c-1)-w(a-1,b-1,c-1)
        else if (a<b)and(b<c) then f[a,b,c]:=w(a,b,c-1)+w(a,b-1,b-1)-w(a,b-1,c)
             else f[a,b,c]:=w(a-1,b,c)+w(a-1,b-1,c)+w(a-1,b,c-1)-w(a-1,b-1,c-1);
w:=f[a,b,c];
end;
begin
assign(input,'function.in');
reset(input);
assign(output,'function.out');
rewrite(output);
readln(a,b,c);
writeln('w(',a,', ',b,', ',c,') = ',w(a,b,c));
close(input);
close(output);
end.
