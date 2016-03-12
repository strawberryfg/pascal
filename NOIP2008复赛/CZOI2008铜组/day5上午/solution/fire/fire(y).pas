program fire;
var
  map:array[0..100] of string;
  n,max,i,j,step:integer;

function test(x,y:integer):boolean;
var
  i,j:integer;
begin
  if map[x,y]<>'.'
  then begin
         test:=false;
         exit;
       end;
  i:=x-1;
  j:=y;
  while (map[i,j]='.') and (i>0) do
    dec(i);
  if (i>0) and (map[i,j]='F')
  then begin
         test:=false;
         exit;
       end;
  i:=x+1;
  j:=y;
  while (map[i,j]='.') and (i<=n) do
    inc(i);
  if (i<=n) and (map[i,j]='F')
  then begin
         test:=false;
         exit;
       end;
  i:=x;
  j:=y-1;
  while (map[i,j]='.') and (j>0) do
    dec(j);
  if (j>0) and (map[i,j]='F')
  then begin
         test:=false;
         exit;
       end;
  i:=x;
  j:=y+1;
  while (map[i,j]='.') and (j<=n) do
    inc(j);
  if (j<=n) and (map[i,j]='F')
  then begin
         test:=false;
         exit;
       end;
  test:=true;
end;

procedure f(x,y:integer);
var
  i,j:integer;
begin
  if test(x,y)
  then begin
         map[x,y]:='F';
         inc(step);
         if step>max
         then max:=step;
         for i:=1 to n do
           for j:=1 to n do
             if (i>x) or ((i=x) and (j>y))
             then f(i,j);
         dec(step);
         map[x,y]:='.';
       end;
end;

begin
  assign(input,'fire.in');
  reset(input);
  assign(output,'fire.out');
  rewrite(output);

  readln(n);
  for i:=1 to n do
    readln(map[i]);
  max:=0;

  for i:=1 to n do
    for j:=1 to n do
    begin
      step:=0;
      f(i,j);
    end;
  writeln(max);

  close(input);
  close(output);
end.
