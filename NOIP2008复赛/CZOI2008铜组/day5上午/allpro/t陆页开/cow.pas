var a,b:array[1..200] of longint;
    n,p,i,t,j,o,tt:longint;
procedure setup;
  begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
readln(n);
if (n=1) or (n=2) or (n=3) then begin writeln('1');endit;halt;end;
if n=4 then begin writeln('2');endit;halt;end;
if n=5 then begin writeln('3');endit;halt;end;
if n=6 then begin writeln('4');endit;halt;end;
a[7]:=6;
b[7]:=2;
for i:=8 to n do
    begin
    b[i]:=b[i-1]+1;
    a[i]:=a[i-1]+b[i];
    if i>9 then begin b[i]:=b[i-1]+b[i-3];
                       a[i]:=a[i-1]+b[i];
                end;
    end;
writeln(a[n]);
endit;
end.
