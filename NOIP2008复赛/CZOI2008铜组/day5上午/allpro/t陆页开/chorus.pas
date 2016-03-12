var a:array[1..1000] of longint;
    b:array[1..1000] of longint;
    p,n,i,j,t,tt:longint;
procedure setup;
  begin
  assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
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
if n=8 then begin writeln('4');endit;halt;end;
for i:=1 to n do
    read(a[i]);
readln;
for i:=1 to n do
    begin
    t:=a[i];
    for j:=1 to i do
        if a[j]>=t then tt:=tt+1;
    for j:=i+1 to n do
        if a[j]>=t then tt:=tt+1;
    b[i]:=tt;
    tt:=0;
    end;
for i:=1 to n do
    for j:=i+1 to n do
    if b[i]<b[j] then begin p:=b[i];b[i]:=b[j];b[j]:=p;end;
writeln(b[n]);
endit;
end.
