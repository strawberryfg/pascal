var a:array[0..9] of longint;
n,i,j,k,s,t:longint;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
readln(n);
k:=9;
if n>=k then begin a[0]:=0; for i:=1 to 9 do a[i]:=1;end;
k:=99;
   while n>=k do
     begin
     a[0]:=a[0]+a[1]*9;
     for i:=1 to 9 do
     a[i]:=a[i]*11+(k-9)div 10+1-a[i];
     k:=k*10+9;
     end;
     k:=(k-9) div 10 +1;
     if k<n then
       for i:=k to n do
     begin
     t:=i;
     while t >0 do begin
                     s:=t mod 10;
                     a[s]:=a[s]+1;
                     t:=t div 10;
                     end;
     end;
for i:=0 to 9 do
writeln(a[i]);
close(input);
close(output);
end.
