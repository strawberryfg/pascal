var n1,n2,n,t,i,j:longint;
    c:char;
    a1,a2:set of 'A'..'Z';
    a:array[1..30]of char;
    f:array[1..30]of boolean;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n1,n2);
for i:=1 to n1 do begin read(c);a1:=a1+[c];a[n1-i+1]:=c;end;
readln;
for i:=1 to n2 do begin read(c);a2:=a2+[c];a[n1+i]:=c;end;
readln;
readln(t);
n:=n1+n2-1;
for i:=1 to t do
  begin
  fillchar(f,sizeof(f),true);
  for j:=1 to n do
        if (f[j])and(a[j] in a1)and(a[j+1] in a2) then
        begin
        c:=a[j];
        a[j]:=a[j+1];
        a[j+1]:=c;
        f[j+1]:=false;
        end;
  end;
for i:=1 to n+1 do
        write(a[i]);
writeln;
close(input);
close(output);
end.