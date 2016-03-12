var tot,t,i:longint;
    pd:boolean;
    a,b:array[1..1000000]of longint;
begin
assign(input,'e:\modify.out');
reset(input);
while not eof do
  begin
  read(t);
  inc(tot);
  a[tot]:=t;
  end;
close(input);
assign(input,'f:\modify.out');
reset(input);
tot:=0;
while not eof do
  begin
  read(t);
  inc(tot);
  b[tot]:=t;
  end;
pd:=true;
for i:=1 to tot do
    begin
    if a[i]<>b[i] then begin pd:=false;break; end;
    end;
if pd then writeln('AC!')
   else begin writeln('Different!',' ',i); end;
close(input);
end.