var n,a,b,i,c,total:longint;s,w:array[1..201]of longint;
procedure print;
begin
writeln(c);
close(input);close(output);
halt;
end;
procedure try(z:longint);
var q:longint;
begin
for q:=1 to c do
    if w[q]=z then begin w[q]:=0;c:=c-1;exit;end;
if z=b then begin print;exit;end
   else begin
        inc(c);
        w[c]:=z;
        if z+s[z]<=n then begin
        z:=z+s[z];
        try(z);         end;
        if z-s[z]>=1 then begin
        z:=z-s[z];
        try(z);         end;
        end;
end;
begin
assign(input,'lift.in');
assign(output,'lift.out');
reset(input);rewrite(output);
total:=10000000;
readln(n,a,b);
for i:=1 to 5 do
    read(s[i]);
readln;
try(a);
writeln('-1');
close(input);close(output);
end.
