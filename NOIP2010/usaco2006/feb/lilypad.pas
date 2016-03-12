var dx:array[1..8]of longint=(-2,-2,-1,-1,1,1,2,2);
    dy:array[1..8]of longint=(-1,1,-2,2,-2,2,-1,1);
var i,j,m,n,tail,head,min,sum,sx,sy,ex,ey,tx,ty,nowx,nowy,ttail,thead:longint;
    hash:array[1..100000,1..30,1..30]of integer;
    num,x,y,step:array[1..100000]of longint;
    a,f:array[1..100,1..100]of longint;
begin
assign(input,'lilypad.in');
reset(input);
assign(output,'lilypad.out');
rewrite(output);
readln(m,n);
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        read(a[i,j]);
        if a[i,j]=3 then
           begin sx:=i;sy:=j; end
        else if a[i,j]=4 then begin ex:=i;ey:=j; end;
        f[i,j]:=maxlongint;
        end;
    end;
tail:=1; head:=1; min:=maxlongint; sum:=0;
x[tail]:=sx; y[tail]:=sy;
hash[1,sx,sy]:=1;
f[sx,sy]:=0; ttail:=1; thead:=1;
while(ttail<thead)or((ttail=thead)and(tail<=head)) do
  begin
  if num[tail]>min then begin inc(tail);if tail>1000000 then begin inc(ttail);tail:=1; end;continue;  end;
  nowx:=x[tail]; nowy:=y[tail];
  for i:=1 to 8 do
      begin
      tx:=nowx+dx[i]; ty:=nowy+dy[i];
      if (tx<1)or(tx>m)or(ty<1)or(ty>n) then continue;
      if (hash[tail,tx,ty]=1) then continue;
      if (a[tx,ty]=2) then continue;
      //if head+1>1000000 then break;
      if (f[nowx,nowy]+1>f[tx,ty]) then continue;
      inc(head);
      if head>100000 then begin inc(thead);head:=1; end;
      hash[head]:=hash[tail];
      hash[head,tx,ty]:=1;
      //step[head]:=step[tail]+1;
      //if step[head]<f[tx,ty] then f[tx,ty]:=step[head];
      f[tx,ty]:=f[nowx,nowy]+1;
      if a[tx,ty]=0 then num[head]:=num[tail]+1
         else begin
              num[head]:=num[tail];
              end;
      x[head]:=tx; y[head]:=ty;
      if (tx=ex)and(ty=ey) then
         begin
         if num[head]<min then begin min:=num[head]; sum:=1; end
            else
              begin
              if num[head]=min then inc(sum);
              end;
         end;
      end;
  inc(tail);
  if tail>100000 then begin inc(ttail);tail:=1; end;
  end;

  if min=-1 then writeln(-1) else
  begin
   writeln(min);
   writeln(sum);
  end;
close(input);
close(output);
end.
