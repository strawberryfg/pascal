var min,n,i,j:longint;
    g:array[0..18,0..18] of longint;
    f:Array[0..18] of boolean;
procedure dfs(last,dep,ans:longint);
var x,i,j:longint;
begin
if dep=(n div 2)+1 then
                begin
                        if ans<min then min:=ans;
                end
else
if ans>=min then exit;
        begin
                for i:=last+1 to n do
                        if not(f[i]) then
                        begin
                        f[i]:=true;
                        for j:=i+1 to n do
                                if not(f[j]) then
                                                begin
                                                f[j]:=true;
                                                dfs(i,dep+1,ans+g[i,j]);
                                                f[j]:=false;
                                                end;
                        f[i]:=false;
			break;
                        end;
        end;
end;
begin
assign(input,'spring.in');reset(input);
assign(output,'spring.out');rewrite(output);
read(n);
for i:=1 to n do
        for j:=1 to n do
                read(g[i,j]);
min:=maxlongint;
f[0]:=true;
dfs(0,1,0);
writeln(min);
close(input);
close(output);
end.
