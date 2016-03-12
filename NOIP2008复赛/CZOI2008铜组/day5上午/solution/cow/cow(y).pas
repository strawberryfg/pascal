program cow;
var
  a:array[1..200,0..1000] of integer;
  i,j,len,n:integer;

begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);

  readln(n);
  fillchar(a,sizeof(a),0);
  a[1,1]:=1; a[1,0]:=1;
  a[2,1]:=1; a[2,0]:=1;
  a[3,1]:=1; a[3,0]:=1;
  a[4,1]:=2; a[4,0]:=1;
  for i:=5 to n do
  begin
    len:=a[i-1,0];
    for j:=1 to len do
    begin
      a[i,j]:=a[i,j]+a[i-1,j]+a[i-3,j];
      if a[i,j]>=10
      then begin
             a[i,j+1]:=a[i,j+1]+1;
             a[i,j]:=a[i,j]-10;
           end;
    end;
    if a[i,len+1]>0
    then a[i,0]:=len+1
    else a[i,0]:=len;
  end;
  for i:=a[n,0] downto 1 do
    write(a[n,i]);
  writeln;

  close(input);
  close(output);
end.
