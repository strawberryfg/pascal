var i,k,a,b,n:longint;
    c,d:array[-200..201]of longint;
procedure print;
  begin
  writeln(k);
  close(input);
  close(output);
  halt;
  end;
procedure lift(f:longint);
  begin
  if f=b then print
         else begin
              k:=k+1;
              if d[f+c[f]]=1 then  else begin
              if (d[f+c[f]]=0) and (f+c[f]<=n)
                 then begin d[f+c[f]]:=1;lift(f+c[f]);end;
              d[f+c[f]]:=0; end;
              if d[f-c[f]]=1 then  else begin
              if (f-c[f]>=1) and (d[f-c[f]]=0)
                 then begin d[f-c[f]]:=1;lift(f-c[f]);end;
              d[f-c[f]]:=0; end;
              k:=k-1;
              if k=0 then writeln('-1');
              end;
  end;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,a,b);
for i:=1 to n do
    read(c[i]);
d[1]:=1;
lift(a);
close(input);
close(output);
end.
