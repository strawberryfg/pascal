program knight;
const
  fx:array[1..8,1..2] of integer=((-2,1),(-1,2),(1,2),(2,1),(2,-1),(1,-2),(-1,-2),(-2,-1));
var
  n,m,x,y:integer;
  a:array[1..100,1..2] of integer;
  map:array[1..10,1..10] of integer;

procedure f(x,y,step:integer);
var
  i,xx,yy:integer;
begin
  if step>m*n
  then begin
         for i:=1 to m*n-1 do
           write('(',a[i,1],',',a[i,2],')->');
         writeln('(',a[m*n,1],',',a[m*n,2],')');
         close(input);
         close(output);
         halt;
       end
  else for i:=1 to 8 do
       begin
         xx:=x+fx[i,1];
         yy:=y+fx[i,2];
         if (xx>0) and (xx<=n) and (yy>0) and (yy<=m) and (map[xx,yy]=0)
         then begin
                a[step,1]:=xx;
                a[step,2]:=yy;
                map[xx,yy]:=1;
                f(xx,yy,step+1);
                map[xx,yy]:=0;
              end;
       end;
end;

begin
  assign(input,'knight.in');
  reset(input);
  assign(output,'knight.out');
  rewrite(output);

  readln(n,m,x,y);
  fillchar(map,sizeof(map),0);
  map[x,y]:=1;
  a[1,1]:=x;
  a[1,2]:=y;
  f(x,y,2);
  writeln('No Answer!');

  close(input);
  close(output);
end.