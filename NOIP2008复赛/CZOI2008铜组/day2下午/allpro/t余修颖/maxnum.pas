var i,n,q:longint;
        a:array[1..1000]of longint;
function zd(c,d:longint):longint;
var p,i,t:longint;
begin
     if c<d then begin t:=c;c:=d;d:=t;end;
     for i:=d downto 1 do
     if (c mod i=0) and (d mod i=0) then break;
     zd:=i;
end;

begin
        assign(input,'maxnum.in');
        assign(output,'maxnum.out');
        reset(input);
        rewrite(output);   

        n:=0;
        while not eof do
        begin
        inc(n);
        readln(a[n]);
        end;
        q:=a[1];
        for i:=2 to n do
        begin
        zd(q,a[i]);
        q:=zd(q,a[i]);
        end;
        writeln(q) ;
        close(input);
	close(output);
end.
