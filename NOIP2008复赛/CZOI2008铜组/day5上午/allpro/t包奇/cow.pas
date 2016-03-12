program cow;
var a:array[1..50000] of integer;
    total,n:integer;
function djj(i:integer):integer;
var j,cm,year:integer;
begin
  cm:=1;
  for year:=1 to i-1 do
  begin
    for j:=1 to cm do
        inc(a[j]);
    for j:=1 to cm do
        begin
         if a[j]>=4 then begin inc(cm);a[cm]:=1;end;
        end;
  end;
  djj:=cm;
end;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
  readln(n);
  close(input);
  fillchar(a,sizeof(a),0);
  a[1]:=1;
  total:=djj(n);
  writeln(total);
  close(output);
end.
