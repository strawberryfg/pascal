var i,m,n,u,v,sum:longint;
    link:array[1..100,0..100]of longint;
    a:array[1..100]of longint;
procedure work(dep:longint);
var i,j:longint;
    pd:boolean;
begin
if dep>n then
   begin
   inc(sum);
   exit;
   end;
for i:=1 to 4 do
    begin
    pd:=true;
    for j:=1 to link[dep,0] do
        begin
        if a[link[dep,j]]=i then
           begin pd:=false;break; end;
        end;
    if pd then
       begin
       a[dep]:=i;
       work(dep+1);
       for j:=dep+1 to n do a[j]:=0;
       end;
    end;
end;
begin
assign(input,'cage.in');
reset(input);
assign(output,'cage.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(u,v);
    inc(link[u,0]);
    link[u,link[u,0]]:=v;
    inc(link[v,0]);
    link[v,link[v,0]]:=u;
    end;
work(1);
writeln(sum);
close(input);
close(output);
end.