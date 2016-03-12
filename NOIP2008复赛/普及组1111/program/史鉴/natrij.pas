var st1,st2:string;
    h1,m1,s1,h2,m2,s2,time1,time2,time,a,b,c:longint;
function change(s:string):longint;
var i,temp:longint;
begin
  temp:=0;
  for i:=1 to length(s) do
    temp:=temp*10+ord(s[i])-48;
  change:=temp;
end;
begin
  assign(input,'natrij.in');
  reset(input);
  assign(output,'natrij.out');
  rewrite(output);
  readln(st1);
  readln(st2);
  h1:=change(copy(st1,1,2));
  m1:=change(copy(st1,4,2));
  s1:=change(copy(st1,7,2));
  h2:=change(copy(st2,1,2));
  m2:=change(copy(st2,4,2));
  s2:=change(copy(st2,7,2));
  time1:=h1*3600+m1*60+s1;
  time2:=h2*3600+m2*60+s2;
  if time2<time1 then time2:=time2+86400;
  time:=time2-time1;
  a:=time div 3600;
  if a<10 then write('0',a,':') else write(a,':');
  time:=time mod 3600;
  b:=time div 60;
  if b<10 then write('0',b,':') else write(b,':');
  time:=time mod 60;
  c:=time;
  if c<10 then writeln('0',c) else writeln(c);
  close(input);
  close(output);
end.