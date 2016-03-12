var   s:string;
      a:array [1..1000]of longint;
      i,k,n,m,p,q,r,o,x,j:longint;
begin assign(input,'mystring.in');
      reset(input);
      assign(output,'mystring.out');
      rewrite(output);
      readln(s);
      i:=1;
      while i<=length(s) do
         begin
           if s[i]=' ' then
           begin
           inc(m);
           inc(i);
           end
           else
           inc(i);
         end;
      inc(m);
      for k:=1 to m do
      a[k]:=0;
      k:=1;
      n:=1;
      while k<=m do
      begin
      if (s[n]<>' ') and(n<=length(s)) then
      begin
      inc(a[k]);
      inc(n);
      end
      else
      begin
      inc(n);
      inc(k);
      end;
      inc(k);
      end;
      begin
      for p:=1 to m do
          for q:=p+1 to m do
          if a[p]>a[q] then
          r:=a[p];
          a[p]:=a[q];
          a[q]:=r;
      end;
      for q:=1 to m-1 do
      if a[q]=a[m] then
      begin o:=q;
            break;
      end;
      x:=0;
      begin
      for j:=1 to o-1 do
          x:=x+a[j];
      end;
      begin
      for p:=x+1 to (x+a[o]) do
      write(s[p]);
      end;
      begin
      for q:=1 to a[1] do
      write(s[q]);
      end;
      close(input);
      close(output);
end.
