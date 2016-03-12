program prime;
var n:longint;
    a:array[1..18]of longint;
    s:set of byte;
function zhao(x,b:longint):boolean;
        var j:longint;
        begin
        zhao:=true;
        for j:=1 to x-1 do
            if a[j]=b then zhao:=false;
        end;
procedure print;
        var i:longint;
        begin
        if (a[1]+a[n])in s then
                begin
                for i:=1 to n-1 do
                    write(a[i],' ');
                writeln(a[n]);
                end;
        end;
procedure work(n,dep:longint);
        var i:longint;
        begin
        if dep>n then print
                 else for i:=1 to n do
                        begin
                        a[dep]:=i;
                        if ((a[dep]+a[dep-1])in s)and zhao(dep,i) then work(n,dep+1);
                        end;
        end;
begin
assign(input,'prime.in');reset(input);
assign(output,'prime.out');rewrite(output);
readln(n);
a[1]:=1;
s:=[2,3,5,7,11,13,17,19,23,29,31];
work(n,2);
close(input);
close(output);
end.