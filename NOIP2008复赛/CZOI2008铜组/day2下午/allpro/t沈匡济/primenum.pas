var i,n,s:longint;
function prime(n:longint):boolean;
        var i:longint;
        begin
        prime:=true;
        for i:=2 to trunc(sqrt(n)) do
            if n mod i=0 then begin prime:=false;exit;end;
        end;
begin
assign(input,'primenum.in');reset(input);
assign(output,'primenum.out');rewrite(output);
s:=0;
while not eoln do
        begin
        readln(n);
        if prime(n) then inc(s);
        end;
writeln(s);
close(input);
close(output);
end.
