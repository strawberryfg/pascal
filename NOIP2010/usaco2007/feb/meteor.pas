const dx:array[1..4]of integer=(0,0,1,-1);
      dy:array[1..4]of integer=(1,-1,0,0);
var x,y,t,time,a,b,from:array[1..1000020]of longint;
    tx,ty,sx,sy,tail,head,mintime,i,j,minx,maxx,miny,maxy,m,qian,hou:longint;
    mark:boolean;
    v:array[-2..10020,-2..10020]of longint;
function pd(c,d:longint):boolean;
begin
if (c<minx)or(c>maxx+2)or(d<miny)or(d>maxy+2) then
   exit(false)
else exit(true);
end;
begin
assign(input,'meteor.in');
reset(input);
assign(output,'meteor.out');
rewrite(output);
readln(m);
for i:=1 to m do
    begin
    readln(x[i],y[i],t[i]);
    if x[i]<minx then minx:=x[i];
    if x[i]>maxx then maxx:=x[i];
    if y[i]<miny then miny:=y[i];
    if y[i]>maxy then maxy:=y[i];
    if (v[x[i],y[i]]=0)or(t[i]<v[x[i],y[i]]-1) then
       v[x[i],y[i]]:=t[i]+1;
    for j:=1 to 4 do
        begin
        tx:=x[i]+dx[j]; ty:=y[i]+dy[j];
        if pd(tx,ty) then
           begin
           if (v[tx,ty]=0)or(t[i]<v[tx,ty]-1) then v[tx,ty]:=t[i]+1;
           end;
        end;
    end;
mintime:=maxlongint;
tail:=1; head:=1;
a[head]:=0; b[head]:=0; time[head]:=0;
mark:=true;
qian:=1; hou:=1;
while ((qian=hou)and(tail<=head))or(hou<qian) do
  begin
  if time[tail]>mintime then
     begin inc(tail);if tail>109090 then begin inc(hou);tail:=1;end; continue;
     end;
  sx:=a[tail]; sy:=b[tail];
  for i:=1 to 4 do
      begin
      tx:=sx+dx[i]; ty:=sy+dy[i];
      if pd(tx,ty) then
         begin
         if (v[tx,ty]=0)or(time[tail]+1<v[tx,ty]-1) then
            begin
            inc(head);
            if head>109090 then begin inc(qian);head:=1; end;
            a[head]:=tx;
            b[head]:=ty;
            time[head]:=time[tail]+1;
            from[head]:=tail;
            if v[tx,ty]=0 then
               begin
               if time[head]<mintime then mintime:=time[head];
               if mintime=0 then begin mark:=false;break; end;
               end;
            end;
         end;
      end;
  if not mark then break;
  inc(tail);
  if tail>109090 then begin inc(hou);tail:=1; end;
  end;
if mintime=maxlongint then writeln(-1) else writeln(mintime);
close(input);
close(output);
end.
