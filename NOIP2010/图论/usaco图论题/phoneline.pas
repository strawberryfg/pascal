var  mark:array[1..1020]of boolean;
     key,que:array[1..100000]of longint;
     i,x,y,n,p,k,left,right,mid,num,dis,max:longint;
     f,g,edge:array[1..1020,0..1020]of longint;
     hash:array[1..10200,1..2]of longint;
function ok(now:longint):boolean;
var i,x,y,st,tail,head,nownum,t:longint;
begin
fillchar(g,sizeof(g),0);
for i:=1 to p do
    begin
    x:=hash[i,1]; y:=hash[i,2];
    if f[x,y]>now then
       begin
       g[x,y]:=1;
       g[y,x]:=1;
       end;
    end;
st:=1; for i:=2 to n do key[i]:=maxlongint;
fillchar(que,sizeof(que),0);
que[1]:=1;
tail:=1; head:=1;
fillchar(mark,sizeof(mark),false); mark[1]:=true;
while tail<=head do
  begin
  nownum:=que[tail];
  mark[nownum]:=false;
  for i:=1 to edge[nownum,0] do
      begin
      t:=edge[nownum,i];
      if (key[nownum]<>maxlongint)and(key[nownum]+g[nownum,t]<key[t]) then
         begin
         key[t]:=key[nownum]+g[nownum,t];
         if not mark[t] then
            begin
            inc(head);
            que[head]:=t;
            mark[t]:=true;
            end;
         end;
      end;
  inc(tail);
  end;
if key[n]>k then exit(false)
   else exit(true);
end;
begin
assign(input,'phoneline.in');
reset(input);
assign(output,'phoneline.out');
rewrite(output);
readln(n,p,k);
for i:=1 to p do
    begin
    readln(x,y,dis);
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    inc(edge[y,0]);
    edge[y,edge[y,0]]:=x;
    f[x,y]:=dis;
    f[y,x]:=dis;
    hash[i,1]:=x; hash[i,2]:=y;
    if dis>max then max:=dis;
    end;
left:=0; right:=max;
num:=0;
while left<right-1 do
  begin
  mid:=(left+right) div 2;
  if not ok(mid) then begin left:=mid end
     else begin num:=mid; right:=mid; end;
  end;
if num=0 then writeln(-1)
   else begin
        if ok(left) then writeln(left)
                    else writeln(right);
        end;
close(input);
close(output);
end.