type arr=array[1..200]of boolean;
var i,floor,front,mudi,count:longint;
    lift:array[1..200]of longint;
    o:arr;
procedure ground(floor,now,time:longint;o:arr);
begin
  if now=mudi then begin if time<count then count:=time; exit; end;
  if o[now]=true then begin exit; end else o[now]:=true;
  if now+lift[now]<=floor then ground(floor,now+lift[now],time+1,o);
  if now-lift[now]>=1 then ground(floor,now-lift[now],time+1,o);
end;
begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  readln(floor,front,mudi);
  for i:=1 to floor do read(lift[i]);
  count:=maxlongint;
  ground(floor,front,0,o);
  if count=maxlongint then writeln(-1) else writeln(count);
  close(input);
  close(output);
end.
