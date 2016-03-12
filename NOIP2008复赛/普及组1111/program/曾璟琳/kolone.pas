var i,k,f1,p,f2,j,n1,n2,t:longint;
    a,b:array[1..1000]of char;
    s:string;
    w:char;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n1,n2);
for i:=1 to n1 do
  read(a[i]);
readln;
for j:=1 to n2 do
  read(b[j]);
readln;
readln(t);
if t=0 then  begin for i:=n1 downto 1 do
                        write(a[i]);
                   for j:=1 to n2 do
                        write(b[j]);
                   exit;
             end;
for i:=n1 downto 1 do
  s:=s+a[i];
for j:=1 to n2 do
  s:=s+b[j];
for i:=1 to t do
 begin
   j:=1;
   while j<length(s) do
    begin
      k:=j+1;
      f1:=0;
      f2:=0;
      for p:=1 to n1 do
       begin
        if s[j]=a[p] then f1:=-1;
        if s[k]=a[p] then f2:=-1;
       end;
      if (f1=-1) and (f2=0) then begin  w:=s[j];s[j]:=s[k];s[k]:=w;j:=j+1;end;
      if (f1=0) and (f2=-1) then begin  w:=s[j];s[j]:=s[k];s[k]:=w;j:=j+1;end;
      inc(j);
    end;
 end;
for i:=1 to length(s) do
 write(s[i]);
close(input);
close(output);
end.