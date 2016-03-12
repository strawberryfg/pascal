const maxx=3000000; maxmo=1000020;
var a,b,c,k,t,sum,last:longint;
    res:array[1..maxx]of longint;
    hash:array[0..maxmo]of integer;
    pd:boolean;
begin
assign(input,'tom.in');
reset(input);
assign(output,'tom.out');
rewrite(output);
readln(a,b,c);
if (a=0)or(b=0) then
   begin
   if c=0 then writeln(1) else writeln('Never');
   end
else
   begin
   k:=1;
   t:=c;
   if t=0 then k:=10
      else begin
           while t>0 do
             begin
             t:=t div 10;
             k:=k*10;
             end;
           end;
   pd:=false;  //true : the same;
   sum:=1;
   res[1]:=a*b mod k;
   hash[res[1]]:=1;
   last:=res[1];
   while last<>c do
    begin
    t:=last;
    t:=t*b mod k;
    if hash[t]=1 then
       begin
       pd:=true;
       break;
       end;
    inc(sum);
    res[sum]:=t;
    hash[t]:=1;
    last:=t;
    end;
   if pd then writeln('Never')
      else writeln(sum);
   end;
close(input);
close(output);
end.
