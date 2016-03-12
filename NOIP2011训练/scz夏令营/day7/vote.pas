const maxn=520;
var code:integer;
    ss,ts:string;
    n,m,k,i,j,ans,x,y,flag,t,totalcat,totaldog,pd:longint;
    final,love,hate,cat,dog:array[0..maxn]of longint;
    vis:array[0..maxn]of boolean;
    edge:array[0..maxn,0..maxn]of longint;
function find(p:longint):boolean;
var i:longint;
begin
for i:=1 to edge[p,0] do
    begin
    if (not vis[edge[p,i]]) then
       begin
       vis[edge[p,i]]:=true;
       if (final[edge[p,i]]=0)or(find(final[edge[p,i]])) then
          begin
          final[edge[p,i]]:=p;
          exit(true);
          end;
       end;
    end;
exit(false);
end;
begin
assign(input,'vote.in');
reset(input);
assign(output,'vote.out');
rewrite(output);
readln(n,m,k);
for i:=1 to k do
    begin
    readln(ss);

    t:=pos(' ',ss);
    ts:=copy(ss,1,t-1);

    if ts[1]='C' then flag:=0 else flag:=1;
    delete(ts,1,1);
    val(ts,x,code);
    x:=flag*n+x;

    delete(ss,1,t);
    if ss[1]='C' then pd:=0 else pd:=1;
    delete(ss,1,1);
    val(ss,y,code);
    y:=pd*n+y;

    if flag=0 then
       begin
       inc(totalcat);  cat[totalcat]:=i;
       love[i]:=x; hate[i]:=y;
       end
    else
       begin
       inc(totaldog);  dog[totaldog]:=i;
       love[i]:=x; hate[i]:=y;
       end;
    end;
for i:=1 to totalcat do
    begin
    for j:=1 to totaldog do
        begin
        if (love[cat[i]]=hate[dog[j]])or(hate[cat[i]]=love[dog[j]]) then
           begin
           inc(edge[cat[i],0]);
           edge[cat[i],edge[cat[i],0]]:=dog[j];
           end;
        end;
    end;
ans:=0;
{for i:=1 to totalcat do
    begin
    write(cat[i],':           ');
    for j:=1 to edge[cat[i],0] do write(edge[cat[i],j],'   ');
    writeln;
    end; }
for i:=1 to totalcat do
    begin
    fillchar(vis,sizeof(vis),false);
    if find(cat[i]) then inc(ans);
    end;
//for i:=1 to totaldog do writeln(final[dog[i]],' ',dog[i]);
//writeln;
writeln(k-ans);
close(input);
close(output);
end.