var i,n,wei,len:longint;
    a:array[1..100]of longint;
    s:string;
function ci(x:longint):longint;
var i,d:longint;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
        d:=1;
        for i:=1 to x do d:=d*2;
        ci:=d;
end;

begin
        readln(n);
        readln(s);
        len:=length(s);
        wei:=0;
        for i:=1 to len do a[i]:=ord(s[i])-64;
        for i:=1 to len do wei:=wei+ci(a[i]-i);
        writeln(wei);
close(input);
close(output);
end.
