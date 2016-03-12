program count;
var
  a:array[0..9] of longint;
  n,i,t,p:longint;

begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);

  readln(n);
  fillchar(a,sizeof(a),0);
  for i:=1 to n do
  begin
    t:=i;
    while t>0 do
    begin
      p:=t mod 10;
      a[p]:=a[p]+1;
      t:=t div 10;
    end;
  end;
  for i:=0 to 9 do
    writeln(a[i]);

  close(input);
  close(output);
end.