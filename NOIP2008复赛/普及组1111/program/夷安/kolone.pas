var a:array[1..100] of longint;
    b1,b2:array[1..100]of char;
    i,j,k,n1,n2,t,tmp:longint;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);
rewrite(output);
readln(n1,n2);
for i:=1 to n1 do
    read(b1[i]);
readln;
for i:=1 to n2 do
    read(b2[i]);
readln;
read(t);
for i:=1 to n1 do
    a[i]:=n1-i+1;
for i:=n1+1 to n1+n2 do
    a[i]:=i-n1+100;
for i:=1 to t do
    begin
    j:=1;
    while j<n1+n2 do
          begin
          if a[j] div 100>=a[j+1] div 100 then j:=j+1
          else begin
               tmp:=a[j];
               a[j]:=a[j+1];
               a[j+1]:=tmp;
               j:=j+2;
               end;
          end;
    end;
for i:=1 to n1+n2 do
    if a[i] div 100<1 then write(b1[a[i]])
                      else write(b2[a[i]-100]);
writeln;
close(input);
close(output);
end.
