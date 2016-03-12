program polygon;
var
  a,a1:array [1..50,1..50] of longint;
  ch:char;
  b,c:array [1..50] of longint;
  p,p1:array [1..50] of shortint;
  n,i,ans,code,pp:longint;
  procedure work;
  var
    i,j,k,te,te1,te2,te3,te4:longint;
  begin
    for i:=1 to n do
      for j:=1 to n do
      begin
        a[i,j]:=-maxlongint;
        a1[i,j]:=maxlongint;
      end;
    for i:=1 to n do
    begin
      a[i,i]:=c[i];
      a1[i,i]:=c[i];
    end;
    for j:=1 to n-1 do
      for i:=1 to n-j do
        for k:=i to i+j-1 do
          if p[k+1]=0
            then begin
              te:=a[i,k]+a[k+1,i+j];
              if te>a[i,i+j] then a[i,i+j]:=te;
              te:=a1[i,k]+a1[k+1,i+j];
              if te<a1[i,i+j] then a1[i,i+j]:=te;
            end
            else begin
              te1:=a[i,k]*a[k+1,i+j];
              te2:=a[i,k]*a1[k+1,i+j];
              te3:=a1[i,k]*a[k+1,i+j];
              te4:=a1[i,k]*a1[k+1,i+j];
              if te1>a[i,i+j] then a[i,i+j]:=te1;
              if te2>a[i,i+j] then a[i,i+j]:=te2;
              if te3>a[i,i+j] then a[i,i+j]:=te3;
              if te4>a[i,i+j] then a[i,i+j]:=te4;
              if te1<a1[i,i+j] then a1[i,i+j]:=te1;
              if te2<a1[i,i+j] then a1[i,i+j]:=te2;
              if te3<a1[i,i+j] then a1[i,i+j]:=te3;
              if te4<a1[i,i+j] then a1[i,i+j]:=te4;
            end;
    if a[1,n]>ans then ans:=a[1,n];
  end;
begin
  assign(input,'polygon.in');
  assign(output,'polygon.out');
  reset(input);
  readln(n);
  read(ch);
  if ch='+'
    then p1[1]:=0
    else p1[1]:=1;
  read(b[1]);
  for i:=2 to n do
  begin
    read(ch);read(ch);
    if ch='+'
      then p1[i]:=0
      else p1[i]:=1;
    read(b[i]);
  end;
  close(input);
  ans:=-maxlongint;
  for pp:=1 to n do
  begin
    code:=pp;
    for i:=1 to n do
    begin
      c[i]:=b[code];
      p[i]:=p1[code];
      inc(code);
      if code>n then dec(code,n);
    end;
    work;
  end;
  rewrite(output);
  write(ans);
  close(output);
end.
