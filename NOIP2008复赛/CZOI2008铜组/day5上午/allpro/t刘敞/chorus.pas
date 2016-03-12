var n,i:longint;
    a,h:array[1..10000]of longint;
function check(m:longint):boolean;
        var p:array[1..100]of boolean;
            i,j:longint;b:boolean;
        begin
        check:=true;
        fillchar(p,sizeof(p),true);
        for i:=1 to m do
                p[a[i]]:=false;
        for i:=1 to n do
                if p[i] then
                begin
                for j:=1 to i-1 do
                        if p[j] and(h[i]<=h[j]) then exit(false);
                for j:=i+1 to n do
                        if p[j] and(h[i]>=h[j]) then exit(false);
                end;
        end;
procedure try(dep,r:longint);
        var j:longint;
        begin
        if dep>i then begin if check(i) then begin writeln(i);close(input);close(output);halt;end;end
                else
                for j:=r to n do
                        begin
                        a[dep]:=j;
                        try(dep+1,j+1);
                        end;
        end;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
read(n);
for i:=1 to n do
        read(h[i]);
for i:=0 to n do
        try(1,1);
close(input);
close(output);
end.
