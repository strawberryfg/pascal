var a:array[1..100,1..100]of char;
    max,i,j,n:longint;
function check(x,y:integer):boolean;
var i:longint;
begin
  check:=true;
  for i:=x-1 downto 1 do
    if a[i,y]='X' then break
                  else if a[i,y]='P' then exit(false);
  for i:=x+1 to n do
    if a[i,y]='x' then break
                  else if a[i,y]='P' then exit(false);
  for i:=y-1 downto 1 do
    if a[x,i]='X' then break
                  else if a[x,i]='P' then exit(false);
  for i:=y+1 to n do
    if a[x,i]='X' then break
                  else if a[x,i]='P' then exit(false);
end;

procedure sou(m:longint);
var i,j:longint;
begin
  if m>max then max:=m;
  for i:=1 to n do
    for j:=1 to n do
      if(a[i,j]='.')and(check(i,j))then begin
        a[i,j]:='P';
        sou(m+1);
        a[i,j]:='.';
      end;
end;


begin
  assign(input,'fire.in');reset(input);
  assign(output,'fire.out');rewrite(output);
  readln(n);
  for i:=1 to n do
  begin
    for j:=1 to n do
      read(a[i,j]);
    readln;
  end;
  max:=0;
  for i:=1 to n do
    for j:=1 to n do
      if a[i,j]='.' then begin
        a[i,j]:='P';
        sou(1);
        a[i,j]:='.';
      end;
  writeln(max);
  close(input);close(output);
end.
