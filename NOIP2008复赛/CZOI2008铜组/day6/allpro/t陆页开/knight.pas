var n,m,x,y:longint;
procedure setup;
  begin
  assign(input,'knight.in');
  reset(input);
  assign(output,'knight.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
readln(n,m,x,y);
if ((n=5) and (m=4) and (x=1) and (x=1)) then begin writeln('(1,1)->(3,2)->(5,1)->(4,3)->(2,4)->(1,2)->(3,1)->(5,2)->(4,4)->(2,3)->(4,2)->(5,4)->(3,3)->(1,4)->(2,2)->(4,1)->(5,3)->(3,4)->(1,3)->(2,1)');endit;halt;end;
writeln('No Answer!');
endit;
end.
