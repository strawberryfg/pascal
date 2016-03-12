Var i,j:longint;
    a,ans:array[1..9,1..9]of longint;
    h,l:array[1..9]of set of 0..10;
    g:array[0..8]of set of 0..10;
Procedure print;
          var i,j:longint;
          begin
            for i:=1 to 9 do
                begin
                  if a[i,1]=0 then write(ans[i,1]) else write(a[i,1]);
                  for j:=2 to 9 do
                      if a[i,j]=0 then write(' ',ans[i,j]) else write(' ',a[i,j]);
                  writeln;
                end;
            close(output);
            halt;
          end;
Procedure search(x,y:longint);
          var i:longint;
          begin
            if x=10 then print
            else if a[x,y]<>0 then
                    if y=9 then search(x+1,1) else search(x,y+1)
               else for i:=1 to 9 do
                        if not(i in h[x]) and not(i in l[y]) and not(i in g[(x-1) div 3*3+(y-1) div 3]) then
                           begin
                             h[x]:=h[x]+[i];
                             l[y]:=l[y]+[i];
                             g[(x-1) div 3*3+(y-1) div 3]:=g[(x-1) div 3*3+(y-1) div 3]+[i];
                             ans[x,y]:=i;
                             if y=9 then search(x+1,1)
                                else search(x,y+1);
                             h[x]:=h[x]-[i];
                             l[y]:=l[y]-[i];
                             g[(x-1) div 3*3+(y-1) div 3]:=g[(x-1) div 3*3+(y-1) div 3]-[i];
                           end;
          end;
Begin
  assign(input,'puzzle.in');
  assign(output,'puzzle.out');
  reset(input);rewrite(output);
  for i:=1 to 9 do
      for j:=1 to 9 do
          begin
            read(a[i,j]);
            if a[i,j]<>0 then
               begin
                 h[i]:=h[i]+[a[i,j]];
                 l[j]:=l[j]+[a[i,j]];
                 g[(i-1) div 3*3+(j-1) div 3]:=g[(i-1) div 3*3+(j-1) div 3]+[a[i,j]];
               end;
          end;
  close(input);
  search(1,1);
  close(output);
End.
