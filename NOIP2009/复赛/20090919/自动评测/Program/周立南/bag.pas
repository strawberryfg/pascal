var n:longint;
    f:array [0..1005] of int64;

procedure search(n:longint);
begin
  if f[n-1]=0 then search(n-1);
  if f[n-2]=0 then search(n-2);
  if f[n-3]=0 then search(n-3);
  f[n]:=f[n-1]+f[n-2]*5+f[n-3]*11;
end;

begin
  assign(input,'bag.in');
  assign(output,'bag.out');
  reset(input);
  rewrite(output);
  readln(n);
  f[1]:=1;
  f[2]:=5;
  f[3]:=10;
  if n<=3 then begin
                 writeln(f[n]);
                 close(input);
                 close(output);
                 halt;
               end;
  search(n);
  writeln(f[n] mod 997);
  close(input);
  close(output);
end.
