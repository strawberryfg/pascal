var a:array[1..1000]of longint;
    i,max:longint;
function max1(a,b:longint):longint;
  var c:longint;
  begin
  if a<b then begin c:=a;a:=b;b:=c;end;
  if b =0 then max1:=a
          else max1:=max1(b,a mod b);
  end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
i:=1;
read(a[1]);
max:=a[1];
while not eoln do
      begin
      inc(i);
      read(a[i]);
      max:=max1(max,a[i]);
      if max=1 then begin writeln(1);close(input);close(output);halt;end;
      end;
writeln(max);
close(input);
close(output);
end.