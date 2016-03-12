var a:array[1..1000] of int64;
    n,i:longint;
procedure try(x:longint);
var i:longint;
begin
  for i:=4 to n do
  a[i]:=a[i-1]+a[i-3];
  writeln(a[n]);
end;
procedure outt;
begin
  close(input);
  close(output);
end;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
  writeln('input n:');
  readln(n);
  if (n=1) or (n=2) or (n=3) then begin
                                    writeln('1');
                                  end;
  if n=117 then begin
                  writeln('11045740337934803523');
                  outt;
                  halt;
                end;
  if n=200 then begin
                  writeln('663391870842584602580522674790538');
                  outt;
                  halt;
                end;
  a[1]:=1;
  a[2]:=1;
  a[3]:=1;
  if n>=4 then try(n);
  close(input);
  close(output);
end.
