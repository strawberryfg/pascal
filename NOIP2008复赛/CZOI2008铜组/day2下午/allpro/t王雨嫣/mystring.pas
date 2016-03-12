var a:string;
    i,s1,s2,m1,m2,k,l,m,n:longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(a);
s1:=1;
s2:=0;
m1:=length(a);
m2:=0;
while s1<length(a) do
      begin
      for i:=s1 to length(a) do
          if a[i]=' ' then begin s2:=i-1;break;end;
      if i=length(a) then s2:=i;
      if s2-s1+1>m2 then begin m:=s1;n:=s2;m2:=s2-s1+1;end;
      if s2-s1+1<m1 then begin k:=s1;l:=s2;m1:=s2-s1+1;end;
      s1:=s2+2;
      end;
for i:=m to n do write(a[i]);
writeln;
for i:=k to l do write(a[i]);
writeln;
close(input);
close(output);
end.
