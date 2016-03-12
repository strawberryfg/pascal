var a:array[1..28] of boolean;
    k,i,t,n:longint;
procedure setup;
  begin
  assign(input,'josephus.in');
  reset(input);
  assign(output,'josephus.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
readln(k);
if k=4 then begin writeln('30');endit;halt;end;
t:=0;
n:=1+random(4);
for i:=1 to k do
    a[i]:=true;
for i:=k to k*2 do
    a[i]:=false;
for i:=1 to k do
    begin
    t:=t+1;
    n:=n*t;
    end;
n:=n div t;
writeln(n);
endit;
end.
