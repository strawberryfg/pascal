var s:string;
    i,n,k,l,j,max,min,b,m:longint;
    a:array[1..125,1..125]of char;
    c:array[1..126]of longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(s);
i:=1;
while i<n do
  begin
  while s[j]<>' ' do
    inc(j);
  for k:=i to j do
      begin
      a[b,k]:=s[k-i+1];
      inc(c[b]);
      end;
  inc(b);
  i:=j;
  end;
max:=c[b];
min:=maxlongint;
for k:=b-1 downto 1 do
    begin
    if max<c[k] then begin max:=c[k];l:=k;end;
    if min>c[k] then begin min:=c[k];m:=k;end;
    end;
i:=0;
while ord(a[l,i])>60 do
  begin
  inc(i);
  write(a[l,i]);
  end;
if l=b-1 then writeln(s[length(s)])
         else writeln;
i:=0;
while ord(a[m,i])>60 do
  begin
  inc(i);
  write(a[m,i]);
  end;
writeln;
close(input);
close(output);
end.