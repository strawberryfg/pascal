const maxn=252; maxm=70000; maxx=80000;
      dx:array[1..4]of longint=(-1,0,0,1);
      dy:array[1..4]of longint=(0,-1,1,0);
var i,j,k,r,c,sum,wolve,sheep,head,tail,x,y,tx,ty,o,v,tt:longint;
    g:array[1..maxn,1..maxn]of char;
    pd:boolean;
    hash:array[1..maxn,1..maxn]of longint;
    cnt:array[1..maxm,1..2]of longint;
    mark:array[1..maxm]of boolean;
    q:array[1..maxx,1..2]of longint;
begin
assign(input,'ovce.in');
reset(input);
assign(output,'ovce.out');
rewrite(output);
readln(r,c);
for i:=1 to r do
    begin
    for j:=1 to c do
        read(g[i,j]);
    readln;
    end;
sum:=0;
for i:=1 to r do
    begin
    for j:=1 to c do
        begin
        if (hash[i,j]=1)or(g[i,j]='#')or(g[i,j]='.') then continue;
        pd:=false;    // true : it does not matter;
        if (i=1)or(i=r)or(j=1)or(j=c) then pd:=true;
        wolve:=0; sheep:=0;
        if g[i,j]='o' then inc(sheep) else if g[i,j]='v' then inc(wolve);

        head:=1; tail:=1; q[1,1]:=i; q[1,2]:=j;
        hash[i,j]:=1;
        if not pd then
          begin
          while head<=tail do
            begin
            x:=q[head,1]; y:=q[head,2];
            for k:=1 to 4 do
                begin
                inc(tt);
                tx:=x+dx[k];
                ty:=y+dy[k];
                if (tx<=0)or(tx>r)or(ty<=0)or(ty>c) then continue;
                if (g[tx,ty]='#')or(hash[tx,ty]=1) then continue;
                if (tx=1)or(tx=r)or(ty=1)or(ty=c) then
                   begin
                   pd:=true;
                   break;
                   end;
                hash[tx,ty]:=1;
                inc(tail);
                q[tail,1]:=tx;
                q[tail,2]:=ty;
                if g[tx,ty]='o' then inc(sheep)
                   else if g[tx,ty]='v' then inc(wolve);
                end;
            if pd then break;
            inc(head);
            end;
          end;
        inc(tt,tail);
        if not pd then
           begin
           inc(sum);
           cnt[sum,1]:=sheep; cnt[sum,2]:=wolve;
           mark[sum]:=pd;
           end;
        end;
    end;
o:=0; v:=0;
for i:=1 to sum do
    begin
    if not mark[i] then
       begin
       if cnt[i,1]>cnt[i,2] then inc(o,cnt[i,1])
          else inc(v,cnt[i,2]);
       end;
    end;
writeln(o,' ',v);
close(input);
close(output);
end.
