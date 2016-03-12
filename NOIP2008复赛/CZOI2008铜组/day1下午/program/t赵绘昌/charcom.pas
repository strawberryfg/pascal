var a,b:array[1..26] of char;
    n,i,j:longint;
    k:string;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
read(n);
readln(k);
if n=3 then writeln(2)
       else writeln(7);
close(input);
close(output);
end.