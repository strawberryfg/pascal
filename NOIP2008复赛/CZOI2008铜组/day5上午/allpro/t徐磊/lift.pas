var build:array[1..200,1..2]of integer;
    i,a,b,n:longint;
function check1(a:longint):boolean;
begin
  check1:=false;
  if a-build[a,1]>0 then
    if (build[a,2]+1<build[a-build[a,1],2])or(build[a-build[a,1],2]=-1)
      then check1:=true;
end;

function check2(a:longint):boolean;
begin
  check2:=false;
  if a+build[a,1]<=n then
    if (build[a,2]+1<build[a+build[a,1],2])or(build[a+build[a,1],2]=-1)
      then check2:=true;
end;


procedure sou(m:integer);
begin
  if check1(m) then begin build[m-build[m,1],2]:=build[m,2]+1;sou(m-build[m,1]);end;
  if check2(m) then begin build[m+build[m,1],2]:=build[m,2]+1;sou(m+build[m,1]);end;
end;

begin
  assign(input,'lift.in');reset(input);
  assign(output,'lift.out');rewrite(output);
  fillchar(build,sizeof(build),0);
  for i:=1 to 200 do build[i,2]:=-1;
  readln(n,a,b);
  for i:=1 to n do
    read(build[i,1]);
  build[a,2]:=0;
  sou(a);
  writeln(build[b,2]);
  close(input);
  close(output);
end.
