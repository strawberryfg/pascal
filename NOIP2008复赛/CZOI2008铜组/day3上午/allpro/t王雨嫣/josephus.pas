var n,k,i,t,s,nn,kk:longint;
    a:array[1..28]of longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
readln(k);
t:=2*k;
n:=k;
s:=0;
while s<k do
      begin
      inc(n);
      s:=0;
      nn:=n mod t;
      if nn=0 then nn:=t;
      for i:=1 to t do
          a[i]:=1;
      while nn>k do
            begin
            a[nn]:=0;
            inc(s);
            kk:=0;
            while kk<n do
                  begin
                  nn:=(nn+1)mod t;
                  if nn=0 then nn:=t;
                  if a[nn]=1 then inc(kk);
                  end;
            end;
      end;
writeln(n);
close(input);
close(output);
end.