var a,b:array[1..100000]of longint;
    n,i,j,temp,total:longint;
    pd:boolean;
begin
 assign(input,'seq.in'); reset(input);
 assign(output,'seq.out'); rewrite(output);
 readln(n); total:=0; pd:=true;
 for i:=1 to n do readln(a[i]); i:=a[1];
 while pd=true do
 begin
  b[1]:=i;
  for j:=1 to n do
  begin
   temp:=a[j]*2-b[j];
   if temp>=b[j] then b[j+1]:=temp else begin pd:=false; break end;
  end;
  if j=n then inc(total);
  dec(i);
 end;
 writeln(total);
 close(input); close(output);
end.