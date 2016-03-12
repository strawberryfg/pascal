procedure huan( n,m,i:longint);
var   a:array[1..20,1..20] of longint;
      p,q,j:longint;
begin for p:=m to m+n-1 do
      begin
      a[m,p]:=i+p-m;
      end;
      for q:=m to m+n-1 do
      begin
      a[q,m+n-1]:=a[m,m+n-1]+q-m+1;
      end;
      for p:=m+n-1 downto m do
      begin
      a[m+n-1,p]:=a[m+n-1,m+n-1]+m+n-1-p;
      end;
      for q:=m+n-1 downto m do
      begin
      a[q,m]:=a[m+n-1,m]+m+n-1-q;
      end;
end;
var   a:array[1..20,1..20] of longint;
      n,p,q,i,o:longint;
      k:real;
begin
      assign(input,'rotate.in');
      reset(input);
      assign(output,'rotate.out');
      rewrite(output);
      readln(n);
      if n mod 2 =0 then
      begin
      huan(1,n,1);
      for k:=((n div 2)-1) downto 1 do
      begin
      i:=trunc(2*k);
      o:=2;
      huan(o,i,trunc(8*k+5));
      inc(o);
      end;
      end;
      if n mod 2 =1 then
      begin
      huan(1,n,1);
      for k:=((n div 2)-1/2) downto 1 do
      begin
      i:=trunc(2*k);
      o:=2;
      huan(o,i,trunc(8*k+1));
      inc(o);
      end;
      end;
      for p:=1 to n do
         for q:=1 to n do
         if q=1 then
         write('  ',a[p,q]:3)
         else
         write(a[p,q]:3);
      close(input);
      close(output);
end.


