var i,j,u,v,t,n,m,old,w,ne,cnt,min,p:longint;
    link,value:array[0..301,0..5000]of longint;
    a,now,time,hash:array[0..301]of longint;
begin
assign(input,'escape.in');
reset(input);
assign(output,'escape.out');
rewrite(output);
readln(n,m);
for i:=1 to n do read(a[i-1]);
for i:=1 to m do
    begin
    readln(u,v,t);
    cnt:=link[u,0]+1;
    link[u,cnt]:=v;
    inc(link[u,0]);
    value[u,cnt]:=t;
    end;
readln(p);
for i:=1 to p do
    begin
    readln(u,v,w);
    old:=1; ne:=1;
    now[1]:=u; time[1]:=0;
    fillchar(hash,sizeof(hash),0);
    min:=maxlongint;
    while old<=ne do
      begin
      t:=now[old];
      if t=v then
         begin

         if time[old]<min then min:=time[old];
         inc(old);
         continue;
         end;
      for j:=1 to link[t,0] do
          begin
          if (a[link[t,j]]>w)and(link[t,j]<>v) then continue;
          //if hash[link[t,j]]=1 then continue;
          if time[old]+value[t,j]>min then break
             else begin
                  inc(ne);
                  hash[link[t,j]]:=1;
                  //min:=time[old]+value[t,j];
                  now[ne]:=link[t,j];
                  time[ne]:=time[old]+value[t,j];
                  end;
          end;
      inc(old);
      end;
    if min=maxlongint then writeln(-1) else writeln(min);
    end;
close(input);
close(output);
end.
