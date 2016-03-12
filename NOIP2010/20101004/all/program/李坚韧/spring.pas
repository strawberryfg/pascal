var
  n,i,j,m,temp,a,b,k,c,ans,t:longint;
  w:Array[0..18,0..18] of longint;
  x,y:array[0..18] of longint;
begin
  assign(input,'spring.in');
  reset(input);
  assign(output,'spring.out');
  rewrite(output);

  randomize;
  read(n);
  for i:=1 to n do
    for j:=1 to n do
      read(w[i,j]);

  ans:=maxlongint;
  for t:=1 to 50 do
  begin
    temp:=0;
    for j:=1 to n div 2 do
    begin
      temp:=temp+w[j*2,j*2-1];
      x[j]:=j*2;
      y[j]:=j*2-1;
    end;
    m:=n div 2;

    for j:=1 to 30000 do
    begin
      a:=random(m)+1;
      repeat
        b:=random(m)+1;
      until(b<>a);

      if w[x[a],y[a]]+w[x[b],y[b]]>w[x[a],y[b]]+w[x[b],y[a]] then
      begin
        temp:=temp-(w[x[a],y[a]]+w[x[b],y[b]])+(w[x[a],y[b]]+w[x[b],y[a]]);

        c:=y[a];
        y[a]:=y[b];
        y[b]:=c;
      end;

      if w[x[a],y[a]]+w[x[b],y[b]]>w[x[a],x[b]]+w[y[a],y[b]] then
      begin
        temp:=temp-(w[x[a],y[a]]+w[x[b],y[b]])+(w[x[a],x[b]]+w[y[a],y[b]]);

        c:=y[a];
        y[a]:=x[b];
        x[b]:=c;
      end;

      if temp<ans then ans:=temp;
    end;
  end;

  writeln(ans);

  close(input);
  close(output);
end.






















