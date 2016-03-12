var a:array[0..21,0..21]of integer;
    i,j,n,t,s:integer;
procedure print;
begin
  for i:=1 to n do
    for j:=1 to n do
    begin
      write(a[i,j]:4);
      if j=n then writeln;
    end;
  close(input);
  close(output);
end;
procedure work(t:integer);
begin
  if s>sqr(n) then begin print; halt end;
  case t of 0:begin
                while a[i,j]=0 do begin a[i,j]:=s; inc(s); inc(j); end;
                inc(t); inc(i); dec(j); work(t);
              end;
            1:begin
                while a[i,j]=0 do begin a[i,j]:=s; inc(s); inc(i); end;
                inc(t); dec(i); dec(j); work(t);
              end;
            2:begin
                while a[i,j]=0 do begin a[i,j]:=s; inc(s); dec(j); end;
                inc(t); dec(i); inc(j); work(t);
              end;
            3:begin
                while a[i,j]=0 do begin a[i,j]:=s; inc(s); dec(i); end;
                inc(t); t:=t mod 4; inc(i); inc(j); work(t);
              end;
  end;
end;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);
  readln(n); s:=1; t:=0; j:=1;
  fillchar(a,sizeof(a),0);
  for i:=0 to n+1 do begin a[i,0]:=1; a[0,i]:=1; a[n+1,i]:=1; a[i,n+1]:=1; end;
  i:=1;
  while s<=sqr(n) do work(t);
end.
