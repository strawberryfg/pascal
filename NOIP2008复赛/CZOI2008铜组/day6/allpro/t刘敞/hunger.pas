var s,e,choose:array[1..1000]of longint;
    b,i,max:longint;
function check(n:longint):boolean;
        var i:longint;
        begin
        check:=true;
        for i:=1 to n-1 do
                if (choose[i]=1)and(e[i]>=s[n]) then exit(false);
        end;
procedure print;
        var k,i:longint;
        begin
        k:=0;
        for i:=1 to b do
                if choose[i]=1 then k:=k+(e[i]-s[i]+1);
        if k>max then max:=k;
        end;
procedure try(dep:longint);
        var i:longint;
        begin
        if dep>b then print
                else
                for i:=0 to 1 do
                        begin
                        choose[dep]:=i;
                        if (i=0)or(check(dep)) then try(dep+1);
                        end;
        end;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
read(b);
for i:=1 to b do
        read(s[i],e[i]);
try(1);
writeln(max);
close(input);
close(output);
end.