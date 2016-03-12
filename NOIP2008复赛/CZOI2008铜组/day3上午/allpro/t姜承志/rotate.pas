var shape:packed array[0..21,0..21]of integer;
    t,n:integer;
    x,y,h:byte;
begin
assign(input,'rotate.in');
assign(output,'rotate.out');
reset(input);
read(h);
close(input);
shape[0,1]:=1;
shape[1,h+1]:=1;
shape[h+1,h]:=1;
shape[h,0]:=1;
n:=h*h;
x:=1;
y:=1;
t:=1;
while t<=n do
      begin
      while shape[x,y]=0 do begin
                            shape[x,y]:=t;
                            inc(t);
                            inc(y);
                            end;
      if t>n then break;
      dec(y);
      inc(x);
      while shape[x,y]=0 do begin
                            shape[x,y]:=t;
                            inc(t);
                            inc(x);
                            end;
      if t>n then break;
      dec(x);
      dec(y);
      while shape[x,y]=0 do begin
                            shape[x,y]:=t;
                            inc(t);
                            dec(y);
                            end;
      if t>n then break;
      inc(y);
      dec(x);
      while shape[x,y]=0 do begin
                            shape[x,y]:=t;
                            inc(t);
                            dec(x);
                            end;
      if t>n then break;
      inc(x);
      inc(y);
      end;
rewrite(output);
for x:=1 to h do
    begin
    for y:=1 to h do
        write(shape[x,y]:4);
    writeln;
    end;
close(output);
end.