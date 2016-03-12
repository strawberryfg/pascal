var a:array[0..100,0..100] of longint;
    i,j,m,n,count,x1:longint;
    x:char;
    
procedure gwtry(x,y:longint);
var i:longint;
begin
  a[x,y]:=0;
  for i:=1 to 4 do
    begin
      if i=1 then if a[x+1,y]=1 then gwtry(x+1,y);
      if i=2 then if a[x,y+1]=1 then gwtry(x,y+1);
      if i=3 then if a[x-1,y]=1 then gwtry(x-1,y);
      if i=4 then if a[x,y-1]=1 then gwtry(x,y-1);
    end;
end;

begin
  assign(input,'cell.in');
  reset(input);
  assign(output,'cell.out');
  rewrite(output);
  readln(m,n);
  for i:=1 to m do
    begin
      for j:=1 to n do
        begin
          read(x);
          x1:=ord(x)-48;
          if x1>0 then a[i,j]:=1
                  else a[i,j]:=0;
        end;
      readln;
    end;
  for i:=1 to m do
    for j:=1 to n do
      if a[i,j]=1 then begin
                          count:=count+1;
                          gwtry(i,j);
                        end;
writeln(count);
close(input);
close(output);
end.
