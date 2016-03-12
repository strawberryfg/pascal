var a:array[1..30]of boolean;
    f:array[1..30]of longint;
    n,k,i,t,s:longint;
procedure try(dep,now:longint);
        var i:longint;
        begin
        if now=n then inc(s)
                else
                for i:=1 to 3 do
                        if (now+i<=n)and(not a[now+i]) then
                                try(dep+1,now+i);
        end;
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
readln(n);
readln(k);
fillchar(a,sizeof(a),false);
for i:=1 to k do
        begin
        read(t);
        a[t]:=true;
        end;
s:=0;
if k<>0 then try(1,0)
        else
        begin
        f[1]:=1;
        f[2]:=2;
        f[3]:=4;
        for i:=4 to n do
                f[i]:=f[i-1]+f[i-2]+f[i-3];
        s:=f[n];
        end;
writeln(s);
close(input);
close(output);
end.