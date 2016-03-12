var       s,n:int64;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
read(n);
s:=n;
if n<10 then begin write(s);close(input);close(output);exit;end;
s:=s+n-9;
if n<100 then begin write(s);close(input);close(output);exit;end;
s:=s+n-99;
if n<1000 then begin write(s);close(input);close(output);exit;end;
s:=s+n-999;
if n<10000  then begin write(s);close(input);close(output);exit;end;
s:=s+n-9999;
if n<100000 then begin write(s);close(input);close(output);exit;end;
s:=s+n-99999;
if n<1000000 then begin write(s);close(input);close(output);exit;end;
s:=s+n-999999;
if n<10000000 then begin write(s);close(input);close(output);exit;end;
s:=s+n-9999999;
if n<100000000 then begin write(s);close(input);close(output);exit;end;
s:=s+n-99999999;
if n<1000000000 then begin write(s);close(input);close(output);exit;end;
end.