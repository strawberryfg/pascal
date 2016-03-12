const a:array[1..8]of longint=(-1,1,2,2,1,-1,-2,-2);
      b:array[1..8]of longint=(2,2,1,-1,-2,-2,1,-1);
var x,y,m,n:longint;
    x1,y1:array[1..101]of longint;
procedure print(dep:longint);
  var i:longint;
  begin
  for i:=1 to dep-1 do
      write('(',x1[i],',',y1[i],')->');
  writeln('(',x1[dep],',',y1[dep],')');
  close(input);
  close(output);
  halt;
  end;
function check(a,b,dep:longint):boolean;
  var i:longint;
  begin
  if (1<=a)and(a<=n)and(1<=b)and(b<=m) then for i:=1 to dep do
                                                if (x1[i]=a)and(y1[i]=b)
                                                    then begin
                                                         check:=false;
                                                         exit;
                                                         end
                                                    else
                                       else begin check:=false;exit;end;
  check:=true;
  end;
procedure kn(x,y,dep:longint);
  var i:longint;
  begin
  if dep=m*n+1 then print(dep-1)
               else begin
                  for i:=1 to 8 do
                      if check(x+a[i],y+b[i],dep)
                      then begin
                           x1[dep]:=x+a[i];
                           y1[dep]:=y+b[i];
                           kn(x+a[i],y+b[i],dep+1);
                           x1[dep]:=0;
                           y1[dep]:=0;
                           end;
                  end;
  end;
begin
assign(input,'knight.in');
reset(input);
assign(output,'knight.out');
rewrite(output);
read(n,m,x,y);
x1[1]:=x;
y1[1]:=y;
if (m=1)and(n=1) then begin writeln('(1,1)');halt;end;
kn(x,y,2);
writeln('No Answer!');
close(input);
close(output);
end.
