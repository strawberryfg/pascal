var f,n,m,w,sum,i,j,k,s,e,t,u,v,tw:longint;
    mark,pd,relaxed:boolean;
    d:array[1..100000]of longint;
    edge:array[1..100000,1..3]of longint;
begin
assign(input,'wormhole.in');
reset(input);
assign(output,'wormhole.out');
rewrite(output);
readln(f);
for i:=1 to f do
    begin
    readln(n,m,w);
    sum:=0;
    fillchar(edge,sizeof(edge),0);
    fillchar(d,sizeof(d),0);
    for j:=1 to m do
        begin
        readln(s,e,t);
        inc(sum);
        edge[sum,1]:=s;
        edge[sum,2]:=e;
        edge[sum,3]:=t;
        inc(sum);
        edge[sum,1]:=e;
        edge[sum,2]:=s;
        edge[sum,3]:=t;
        end;
    for j:=1 to w do
        begin
        readln(s,e,t);
        inc(sum);
        edge[sum,1]:=s;
        edge[sum,2]:=e;
        edge[sum,3]:=-1*t;
        end;
    tw:=w;
    mark:=false;
    for j:=1 to n do d[j]:=maxlongint;
    d[1]:=0;
    for j:=1 to n-1 do
        begin
        relaxed:=false;
        for k:=1 to sum do
            begin
            u:=edge[k,1]; v:=edge[k,2]; w:=edge[k,3];
            if (d[u]<>maxlongint)and(d[v]>d[u]+w) then
               begin
               d[v]:=d[u]+w;
               {if d[v]<0 then
                  begin mark:=true;break; end;}
               relaxed:=true;
               end;
            end;
        if not relaxed then break;
        end;
    pd:=true;
    for j:=1 to sum do
        begin
        u:=edge[j,1]; v:=edge[j,2]; w:=edge[j,3];
        if (d[u]<>maxlongint)and(d[v]>d[u]+w) then
           begin
           pd:=false;break;
           end;
        end;
    if pd=false then writeln('YES') else writeln('NO');
    //writeln('NO');
    end;
close(input);
close(output);
end.
