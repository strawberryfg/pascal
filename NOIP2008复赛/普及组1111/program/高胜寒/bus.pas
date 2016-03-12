var s:string;
    a,b,i,j,one,two,max,count,maxn,tyou:longint;
function pd(one,two:longint):boolean;
var i,old,news:longint;
begin
  news:=0; old:=0;
  for i:=one to two do
      if s[i]='H' then old:=old+1 else news:=news+1;
  if (abs(old-news)>b)and(old<>0)and(news<>0) then pd:=false else pd:=true;
end;
begin
  assign(input,'bus.in');
  reset(input);
  assign(output,'bus.out');
  rewrite(output);
  readln(a,b);
  readln(s);
  i:=1;
  while i<a do
  begin
    one:=tyou+1;
    maxn:=max;
    two:=one-1;
    for j:=i to a do
    begin
      two:=two+1;
      if pd(one,two) then begin max:=j; tyou:=two; end;
    end;
    if maxn<>max then count:=count+1;
    i:=max;
  end;
  writeln(count-1);
  close(input);
  close(output);
end.
