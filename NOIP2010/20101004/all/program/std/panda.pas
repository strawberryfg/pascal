program panda;
  const inputname='panda.in';
        outputname='panda.out';
  type ty=array[0..9999]of longint;
  var f1,f2:text;
      dui:array[0..10]of ^ty;
      p:array[1..100]of longint;
      d:array[1..100]of longint;
      a:array[1..100]of longint;
      i,j,k,n,min:longint;
      time:longint;
  procedure change(var x,y:longint);
    var z:longint;
    begin
      z:=x;x:=y;y:=z;
    end;
  begin
    assign(f1,inputname);
    reset(f1);
    assign(f2,outputname);
    rewrite(f2);
    for i:=0 to 10 do
      new(dui[i]);
    dui[0]^[0]:=1;
    readln(f1,k,n);
    for i:=1 to k do
      read(f1,p[i]);
    for i:=1 to k-1 do
      for j:=i+1 to k do
        if p[i]>p[j] then
          change(p[i],p[j]);
    for i:=1 to k do
      begin
        d[i]:=0;
        a[i]:=p[i];
      end;
    for i:=1 to n do
      begin
        min:=maxlongint;
        for j:=1 to k do
          if a[j]<min then
            min:=a[j];
        dui[i div 10000]^[i mod 10000]:=min;
        for j:=1 to k do
          if a[j]=min then
            begin
              inc(d[j]);
              a[j]:=p[j]*dui[d[j] div 10000]^[d[j] mod 10000];
            end;
      end;
    writeln(f2,dui[n div 10000]^[n mod 10000]);
    close(f1);
    close(f2);
  end.
