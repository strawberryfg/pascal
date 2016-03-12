program ex2;
const
  maxn=100;
var
  a,n,m,x,k,i:integer;
  p,down,up:array[1..maxn] of integer;

begin
  assign(input,'work2.in');
  reset(input);
  assign(output,'work2.out');
  rewrite(output);

  readln(a,n,m,x);
  fillchar(p,sizeof(p),0);
  up[1]:=a;
  down[1]:=0;
  p[1]:=a;
  k:=0;
  n:=n-1;
  repeat
    up[2]:=k;
    down[2]:=k;
    p[2]:=p[1];
    for i:=3 to n do
    begin
      up[i]:=up[i-1]+up[i-2];
      down[i]:=up[i-1];
      p[i]:=p[i-1]+up[i-2];
    end;
    if p[n]=m
    then begin
           writeln(p[x]);
           close(input);
           close(output);
           exit;
         end;
    k:=k+1;
  until p[n]>m;
  writeln('No answer.');

  close(input);
  close(output);
end.
