var sum,n,m,t,f,tt:longint;
        a,d:array[1..10000000]of longint;

function pan(t:longint):boolean;
  var i:longint;
  begin
  for i:=1 to f do
        if a[i]=t then exit(false);
  exit(true);
  end;

begin
assign(input,'great.in');
reset(input);
assign(output,'great.out');
rewrite(output);
readln(n,m);
if n=m then begin writeln('0');close(input);close(output);exit; end;
if m=0 then begin writeln('1');close(input);close(output);exit; end;
if n=0 then if m<>0 then begin writeln('-1');close(input);close(output);exit;end;
a[1]:=m;d[1]:=0;
t:=1;f:=1;
sum:=0;
while t<=f do
        begin
        if a[t]=1 then begin writeln(d[t]+1);close(input);close(output);exit;end;
        if not odd(a[t]) then
                        begin
                        tt:=a[t] div 2;
                        if pan(tt) then
                                begin
                                inc(f);
                                a[f]:=tt;
                                d[f]:=d[t]+1;
                                if tt=n then begin writeln(d[f]);close(input);close(output);exit;end;
                                end;
                        end;
        if sqr(sqrt(a[t]))=sqr(trunc(sqrt(a[t])))  then
                        begin
                        tt:=trunc(sqrt(a[t]));
                        if pan(tt) then
                                begin
                                inc(f);
                                a[f]:=tt;
                                d[f]:=d[t]+1;
                                if tt=n then begin writeln(d[f]);close(input);close(output);exit;end;
                                end;
                        end;
        inc(t);
        end;
writeln('-1');
close(input);
close(output);
end.
