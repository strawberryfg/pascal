var n,m,x,y,i,ti,tn,sum:longint;
    thash,link,next:array[1..1000,0..1000]of integer;
    hash,a,spe:array[1..1000]of longint;
procedure print;
var i:longint;
begin
for i:=1 to tn do
    begin
    if (spe[i]<=0) then writeln('F') else writeln('T');
    end;
end;
procedure doit(dep:longint);
var i,j:longint;
begin
for i:=1 to dep-1 do
    begin
    if spe[a[i]]<>-1 then continue;
    for j:=i+1 to dep do
        begin
        if link[a[j],a[i]]=0 then continue else begin inc(sum); spe[a[i]]:=1; end;
        end;
    end;
end;
procedure work(n,dep:longint);
var i:longint;
begin
if dep>tn then begin doit(dep-1);exit; end;
if link[a[dep-1],a[1]]=1 then begin doit(dep-1);exit; end;
for i:=1 to next[n,0] do
    begin
    if hash[next[n,i]]=1 then continue;
    if next[n,i]=ti then begin doit(dep-1); exit; end;
    a[dep]:=next[n,i];
    hash[next[n,i]]:=1;
    work(next[n,i],dep+1);
    hash[next[n,i]]:=0;
    if sum=tn then begin print;close(input);close(output);halt; end;
    end;
end;
begin
assign(input,'message.in');
reset(input);
assign(output,'message.out');
rewrite(output);
readln(n,m);
tn:=n;
for i:=1 to m do
    begin
    readln(x,y);
    if thash[x,y]=0 then
       begin
       link[x,y]:=1;
       inc(next[x,0]);
       next[x,next[x,0]]:=y;
       thash[x,y]:=1;
       end;
    end;
for i:=1 to n do spe[i]:=-1;
for i:=1 to n do
    begin
    if (spe[i]=1)or(spe[i]=0) then continue;
    fillchar(hash,sizeof(hash),0);
    ti:=i;
    fillchar(a,sizeof(a),0);
    a[1]:=i;
    work(i,2);
    end;
for i:=1 to n do
    if spe[i]<=0 then writeln('F') else writeln('T');
close(input);
close(output);
end.
