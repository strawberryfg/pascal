program lift_bfs;
{made by pig}
var k:array[1..200]of integer;
    s:array[1..200]of integer;
    total:array[1..200]of integer;
    n,a,b,front,tail:integer;
procedure seton;
  begin
    assign(input,'lift.in');
    assign(output,'lift.out');
    reset(input);
    rewrite(output);
  end;
procedure setoff;
  begin
    close(input);
    close(output);
  end;
procedure readin;
  var i:integer;
  begin
    read(n,a,b);
    if a=b then begin write(0);setoff;end;
    for i:=1 to n do
     read(k[i]);
    for i:=1 to n do
      begin
       total[i]:=0;
       s[i]:=0;
      end;
    s[1]:=a;
    front:=1;
    tail:=2;
  end;
procedure work;
  var t:integer;
  begin
    if front=tail then begin write(-1);setoff;halt;end;
    if k[s[front]]+s[front]<=n then
     begin
       if k[s[front]]+s[front]=b then begin write(total[front]+1);setoff;halt;end;
       t:=1;
       while (s[t]<>k[s[front]]+s[front]) and (t<tail) do t:=t+1;
       if t=tail then begin total[tail]:=total[front]+1;s[tail]:=k[s[front]]+s[front];inc(tail);end;
     end;
    if s[front]-k[s[front]]>0 then
     begin
       if s[front]-k[s[front]]=b then begin write(total[front]+1);setoff;halt;end;
       t:=1;
       while (s[t]<>s[front]-k[s[front]]) and (t<tail) do t:=t+1;
       if t=tail then begin total[tail]:=total[front]+1;s[tail]:=s[front]-k[s[front]];inc(tail);end;
     end;
    inc(front);
    work;
  end;
begin
  seton;
  readin;
  work;
  write(-1);
  setoff;
end.