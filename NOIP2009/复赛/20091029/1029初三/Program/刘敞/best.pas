var n,i,l,k:longint;
    a:array[1..2000]of longint;
procedure work(k:longint);
        var i,m:longint;
        begin
         m:=0;
         for i:=1 to l do
                begin
                 a[i]:=a[i]*k+m;
                 m:=a[i] div 10;
                 a[i]:=a[i] mod 10;
                end;
         while m>0 do
                begin inc(l);a[l]:=m mod 10;m:=m div 10;end;
        end;
begin
 assign(input,'best.in');
 reset(input);
 assign(output,'best.out');
 rewrite(output);
 readln(n);
 a[1]:=1;l:=1;k:=3;
 while n>=2*k+1 do
        begin
         work(k);
         dec(n,k);
         inc(k);
        end;
 if n-k<2 then work(n) else begin work(n-2);work(2);end;
 for i:=l downto 1 do write(a[i]);
 writeln;
 close(input);
 close(output);
end.
