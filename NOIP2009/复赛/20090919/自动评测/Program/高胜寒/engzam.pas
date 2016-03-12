var n,m,i,j,l,t:longint;
    s:char;
    c:string;
    p:array[1..1000]of string;
    a:array[1..1000]of longint;
begin
  assign(input,'engzam.in'); reset(input);
  assign(output,'engzam.out'); rewrite(output);
  readln(n,m);
  for i:=1 to n do
  begin
    read(s);
    while s<>' ' do begin p[i]:=p[i]+s; read(s); end;
    readln(a[i]);
  end;
  for i:=1 to m do
  begin
    read(s);
    c:='';
    while s<>' ' do begin c:=c+s; read(s); end;
    readln(l); t:=0;
    for j:=1 to n do if (copy(p[j],1,length(c))=c)and(a[j]>=l) then inc(t);
    writeln(t);
  end;
  close(input); close(output);
end.