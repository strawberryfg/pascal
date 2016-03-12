const maxn=300;
var t,i,j,x,y,n,m:longint;
    flag:boolean;
    stack:array[1..1]of longint;
    edge,opp:array[1..maxn,0..maxn]of longint;
    outer,value:array[1..maxn]of longint;
    hash:array[1..maxn]of boolean;
procedure topsort;
var i,now:longint;
begin
fillchar(hash,sizeof(hash),false);
for i:=n downto 1 do
    if (not hash[i])and(outer[i]=0) then
       begin
       stack[1]:=i;
       break;
       end;
now:=n;
while stack[1]<>0 do
 begin
 value[stack[1]]:=now;  dec(now);
 hash[stack[1]]:=true;
 for i:=1 to opp[stack[1],0] do
     begin
     dec(outer[opp[stack[1],i]]);
     end;
 stack[1]:=0;
 for i:=n downto 1 do
     begin
     if (not hash[i])and(outer[i]=0) then
        begin
        stack[1]:=i;
        break;
        end;
     end;
 end;
if now>=1 then flag:=false;
end;
begin
{assign(input,'label.in');
reset(input);
assign(output,'label.out');
rewrite(output);}
readln(t);
for i:=1 to t do
    begin
    readln;
    readln(n,m);
    flag:=true;
    for j:=1 to n do begin edge[j,0]:=0;outer[j]:=0;opp[j,0]:=0; end;
    for j:=1 to m do
        begin
        readln(x,y);
        if x=y then flag:=false;
        inc(edge[x,0]); edge[x,edge[x,0]]:=y;
        inc(opp[y,0]); opp[y,opp[y,0]]:=x;
        inc(outer[x]);
        end;
    if not flag then begin writeln(-1); continue; end;
    topsort;
    if not flag then begin writeln(-1); continue; end;
    for j:=1 to n-1 do write(value[j],' ');
    write(value[n]);
    writeln;
    end;
{close(input);
close(output);}
end.