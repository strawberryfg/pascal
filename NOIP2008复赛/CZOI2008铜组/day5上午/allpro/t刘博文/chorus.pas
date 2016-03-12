var a:array[0..101] of integer;
    sum:array[2..100] of integer;
    n,i,min:longint;

procedure delete(m:integer);
var s,j:integer;
begin
  s:=0;
  for j:=1 to m-1 do if (a[j]>=a[m]) or (a[j]<=a[j-1]) then inc(s);
  for j:=n downto m+1 do if (a[j]>=a[m]) or (a[j]<=a[j+1]) then inc(s);
  sum[m]:=s;
end;

begin
  assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
  rewrite(output);
  readln(n);
  fillchar(a,sizeof(a),0);
  for i:=1 to n do read(a[i]);
  for i:=2 to 99 do delete(i);
  min:=sum[2];
  for i:=3 to 99 do if sum[i]<min then min:=sum[i];
  writeln(min);
  close(input);
  close(output);
end.