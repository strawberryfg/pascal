var n,e,minu:int64;
    t:string;
begin
assign(input,'broj.in');
assign(output,'broj.out');
reset(input);
read(n);
close(input);
minu:=9;
while n>minu do
      begin
      str(minu,t);
      e:=e+length(t)*minu;
      n:=n-minu;
      minu:=minu*10;
      end;
e:=e+(length(t)+1)*n;
rewrite(output);
writeln(e);
close(output);
end.
