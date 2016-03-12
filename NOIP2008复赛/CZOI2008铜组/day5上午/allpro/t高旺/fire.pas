var a:array[1..100,1..100]of char;
    max,i,j,n:longint;
    
function pd(x,y:integer):boolean;
var i:longint;
begin
  pd:=true;
  for i:=x-1 downto 1 do
    if a[i,y]='X' then break
                  else if a[i,y]='w' then exit(false);
  for i:=x+1 to n do
    if a[i,y]='X' then break
                  else if a[i,y]='w' then exit(false);
  for i:=y-1 downto 1 do
    if a[x,i]='X' then break
                  else if a[x,i]='w' then exit(false);
  for i:=y+1 to n do
    if a[x,i]='X' then break
                  else if a[x,i]='w' then exit(false);
end;

procedure gws(f:longint);
var i,j:longint;
begin
  if f>max then max:=f;
  for i:=1 to n do
    for j:=1 to n do
      if(a[i,j]='.')and(pd(i,j))then begin
                                        a[i,j]:='w';
                                        gws(f+1);
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
                           a[i,j]:='w';
                           gws(1);
                           a[i,j]:='.';
                          end;
  writeln(max);
  close(input);
  close(output);
end.
