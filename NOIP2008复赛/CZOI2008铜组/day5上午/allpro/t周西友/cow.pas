program exp1;
var a:array[1..10000]of longint;
    sf:array[1..10000]of integer;
    i,c,d,total,n,td:longint;
begin
 assign(input,'cow.in');
 reset(input);
 assign(output,'cow.out');
 rewrite(output);
 fillchar(a,sizeof(a),0);
 fillchar(sf,sizeof(sf),0);
  a[1]:=1;
  c:=1;
  d:=2;
  total:=0;
 readln(n);
 if n=1 then
  begin
   writeln('2');
   close(input);
   close(output);
   halt;
  end;
   while c<=n do
    begin
     td:=d;
     for i:=1 to td-1 do
      begin
       sf[i]:=sf[i]+1;
      end;
      i:=1;
      while i<=td-1 do
      begin
       if sf[i]>=4 then
        begin
         a[i]:=a[i]+1;
         d:=d+1;
        end;
        i:=i+1;
      end;
      c:=c+1;
    end;
   for i:=1 to d-1 do
    total:=total+a[i];
   writeln(total);
  close(input);
  close(output);
end.

