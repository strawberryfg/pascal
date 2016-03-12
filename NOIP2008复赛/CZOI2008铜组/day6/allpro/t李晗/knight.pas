program knight;
const dx:array[1..4] of longint=(1,2,2,1{,-1,-2,-2,-1});
      dy:array[1..4] of longint=(-2,-1,1,2{,2,1,-1,-2});
var n,m,x,y,top,k,i:longint;
    a:array[0..1000] of longint;
begin
  assign(input,'knight.in');reset(input);
  assign(output,'knight.out');rewrite(output);
  read(n,m,x,y);
  top:=0;
  k:=0;
  for i:=0 to 1000 do a[i]:=0;
  while (x<>m) or (y<>n) do
    begin
     k:=k+1;
     if k>4 then begin
                   k:=a[top];
                   x:=x-dx[k];
                   y:=y-dy[k];
                   top:=top-1;
                   if top=0 then begin  writeln('No Answer!'); halt end
                 end
            else begin
                   x:=x+dx[k];
                   y:=y+dy[k];
                   if(x>m)or(y<0)or(y>n) then begin
                                                x:=x-dx[k];
                                                y:=y-dy[k];
                                              end
                                         else begin
                                                top:=top+1;
                                                a[top]:=k;
                                                k:=0;
                                              end;
                 end
    end;
x:=0;y:=0;
for i:=1 to top do
  begin
    x:=x+dx[a[i]];
    y:=y+dy[a[i]];
    if i<>top then write('(',x,',',y,')->')
              else write('(',x,',',y,')');
  end;
close(input);
close(output);
end.
