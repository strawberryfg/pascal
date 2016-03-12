var   a:array[0..21,0..21] of longint;
      n,i,j,f,tx,ty:longint;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
read(n);
a[1,n+1]:=1;
a[5,n]:=1;
a[4,0]:=1;
    f:=1;
    tx:=1;
    ty:=1;
for i:=1 to n*n do
    begin
    if (tx>n)or(ty>n)or(a[ty,tx]<>0) then
                                       begin
                                       case f of
                                       1:begin
                                         dec(tx);
                                         inc(ty);
                                         end;

                                       2:begin
                                         dec(ty);
                                         dec(tx);
                                         end;

                                       3:begin
                                         inc(tx);
                                         dec(ty);
                                         end;
                                       4:begin
                                         inc(ty);
                                         inc(tx);
                                         end;
                                       end;
                                       f:=f+1;
                                       if f>4 then f:=1;
                                       end;
    case f of
    1:begin
      a[ty,tx]:=i;
      inc(tx);
      end;
    2:begin
      a[ty,tx]:=i;
      inc(ty);
      end;
    3:begin
      a[ty,tx]:=i;
      dec(tx);
      end;
    4:begin
      a[ty,tx]:=i;
      dec(ty);
      end;
      end;
    end;
for i:=1 to n do
    begin
    for j:=1 to n do
    write(a[i,j]:4);
    writeln;
    end;
close(input);
close(output);
end.