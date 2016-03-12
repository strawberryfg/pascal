var
   f,p,n,i,m,u,v,t,x,y,w,k,j,min,r,temp:longint;
   g:array[0..300,0..300] of longint;
   c,a,map:array[0..299] of longint;
begin
  assign(input,'escape.in');reset(input);
  assign(output,'escape.out');rewrite(output);
  readln(n,m);
  for i:=0 to n-1 do read(a[i]);
  fillchar(g,sizeof(g),0);
  for i:=1 to m do
    begin
      readln(u,v,t);
      g[u,v]:=t;
    end;
  readln(p);
  for i:=1 to p do
    begin
      readln(x,y,w);
      fillchar(c,sizeof(c),0);
      for j:=0 to n-1 do map[j]:=maxint;
      map[x]:=0;
      temp:=a[y];
      a[y]:=0;
      f:=x;
      c[x]:=1;
      while (f<>-1) and (f<>y) do
        begin
          min:=maxint;
          r:=maxint;
          for j:=0 to n-1 do
            begin
              if (c[j]=0) and (g[f,j]>0) and (a[j]<=w) and (g[f,j]+map[f]<map[j])
              then begin
                     map[j]:=g[f,j]+map[f];
                     if map[j]<r then begin min:=j;r:=map[j]; end;
                   end;

            end;
          if min<>maxint then begin inc(k);f:=min;c[min]:=1; end
                         else begin inc(k);f:=-1; end;
        end;
      if map[y]<maxint then writeln(map[y]) else writeln(-1);
      a[y]:=temp;
    end;
  close(input);close(output);
end.
