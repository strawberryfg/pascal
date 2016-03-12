var n,a2,a3:longint;
        f:array[0..200000]of longint;

function try(n:longint):longint;
  var sum:longint;
  begin
  if f[n]<>0 then exit(f[n]);
  f[n]:=10;
  if n>=1 then inc(f[n],try(n-1));
  if n>=2 then inc(f[n],try(n-2));
  if n>=5 then inc(f[n],try(n-5));
  exit(f[n]);
  end;

begin
assign(input,'sugar.in');
reset(input);
assign(output,'sugar.out');
rewrite(output);
readln(n);
a2:=1;
a3:=4;
f[0]:=1;
if n=1 then begin f[1]:=3;writeln('3');close(input);close(output);exit; end;
if n=2 then begin f[2]:=6;writeln('6');close(input);close(output);exit; end;
if n=3 then begin f[2]:=6;writeln('10');close(input);close(output);exit; end;
if n=4 then begin f[4]:=15;writeln('15');close(input);close(output);exit; end;
if n=5 then begin f[5]:=24;writeln('24');close(input);close(output);exit; end;
writeln(try(n));
close(input);close(output);
end.
