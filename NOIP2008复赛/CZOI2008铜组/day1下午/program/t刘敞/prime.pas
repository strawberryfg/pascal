var n:longint;
    a:array[1..20]of longint;
function prime(n:longint):boolean;
        var i:longint;
        begin
        prime:=true;
        for i:=2 to trunc(sqrt(n)) do
                if n mod i=0 then exit(false);
        end;
function same(n:longint):boolean;
        var i:longint;
        begin
        same:=false;
        for i:=1 to n-1 do
                if a[i]=a[n] then exit(true);
        end;
procedure print;
        var i:longint;
        begin
        if prime(a[n]+1)then
        begin
        for i:=1 to n-1 do
                write(a[i],' ');
        writeln(a[n]);
        end;
        end;
procedure try(dep:longint);
        var i:longint;
        begin
        if dep>n then print
                else
                for i:=2 to n do
                        begin
                        a[dep]:=i;
                        if not same(dep) and prime(a[dep-1]+i) then try(dep+1);
                        end;
        end;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
read(n);
a[1]:=1;
if n mod 2=0 then try(2);
close(input);
close(output);
end.