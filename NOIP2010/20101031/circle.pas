const f:array[1..6]of longint=(4,12,28,84,244,732);
var i,n,mo:longint;
    t,now:int64;
begin
assign(input,'circle.in');
reset(input);
assign(output,'circle.out');
rewrite(output);
readln(n);
mo:=20101031;
if n<=6 then begin writeln(f[n]);close(input);close(output);halt; end
   else begin
        now:=f[6];
        for i:=7 to n do
            begin
            if i mod 2=1 then
               begin
               t:=(int64(now)-int64(12)) mod mo;
               now:=int64(now)*int64(2)+int64(t);
               now:=now mod mo;
               end
            else begin
                 now:=int64(now)*int64(3)+int64(12);
                 now:=now mod mo;
                 end;
            end;
        if n mod 2=1 then writeln(now mod mo+4)
           else writeln(now mod mo);
        end;
close(input);
close(output);
end.
