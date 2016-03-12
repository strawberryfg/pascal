var n,s:longint;c:string;
procedure try(sum:string);
var i:longint;sume:string;
begin
sume:=sum;
if sume=c then writeln(s) else
for i:=1 to n-ord(sum[length(sum)])+64 do
          begin
          if sume=c then begin writeln(s); close(input);close(output);halt;end;
          sume:=sume+chr(i+ord(sum[length(sum)]));
          inc(s);
          end;
 for i:=1 to n-ord(sum[length(sum)])+64 do try(sum+chr(ord(sum[i])+2));
sum:=chr(ord(sum[1])+1);
try(sum);
end;
begin
assign(input,'charcom.in');
assign(output,'charcom.out');
reset(input);
rewrite(output);
readln(n);
readln(c);
s:=1;
if c='A'then begin writeln(1); close(input);close(output);halt;end else
try('A');
end.
