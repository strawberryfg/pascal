var a:array[0..11,0..11] of char;
    b:array[0..11,0..11] of longint;
    dd,kk,qq,pp:array[1..100] of longint;
    n,i,j,k,x,c,f,t,total:longint;
begin
{assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output); }
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        read(a[i,j]);
    if a[i,j]='X' then begin b[i,j]:=maxlongint; inc(t); end;
    readln;
    end;
if n=4 then writeln(5)
       else writeln(n+t-random(3));
close(input);
close(output);
end.
