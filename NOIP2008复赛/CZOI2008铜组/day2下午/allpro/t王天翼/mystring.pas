var s,s1,s2:string;
    a:array[1..10000] of string;
    b,c:array[1..10000] of longint;
    i,j,k,t,x,m,n:longint;
begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);
  k:=1;j:=0;
  readln(s);
  x:=length(s);
  for i:=1 to x do
    a[i]:='';
  for i:=1 to x do
    if s[i]<>' ' then a[k]:=a[k]+s[i]
                 else inc(k);
m:=0;
  for i:=1 to k do
      if length(a[i])>m then begin m:=length(a[i]); s1:=a[i]; end;
  writeln(s1);
n:=length(a[1]);
  for i:=1 to k do
      if length(a[i])<n then begin n:=length(a[i]); s2:=a[i]; end;
  writeln(s2);
  close(input);
  close(output);
end.

