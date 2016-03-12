program primenum;
var i,j,k,count:longint;
    a:array [1..1000]of longint;

function su(x:longint):boolean;
var  i:longint;
     b:boolean;
begin
        b:=true;
        if x<=1 then begin su:=false; exit;end;
        if (x=2)or(x=3) then begin su:=true; exit; end;
        if x mod 2=1 then   begin
                for i:=2 to trunc(sqrt(x))do
                        if x mod i=0 then begin b:=false; break; end end
                        else b:=false;
        su:=b;
end;

begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
        i:=0;
        while not eof do
        begin
                inc(i);
                readln(a[i]);
        end;
        count:=0;
        for j:=1 to i do
                if su(a[j]) then inc(count);
        writeln(count);
close(input);
close(output);
end.
