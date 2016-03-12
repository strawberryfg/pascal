var n,i,j:longint;
    t,s:int64;
begin
assign(input,'best.in');reset(input);
assign(output,'best.out');rewrite(output);
readln(n);
if n=1 then begin writeln(1);close(input);close(output);halt;end;
i:=1;
while (i+3)*i div 2 <=n do inc(i);
dec(i);
t:=n-(i+3)*i div 2;
if t>=i then begin t:=2+t;for j:=3 to i+1 do t:=t*j;writeln(t);end
        else if t=0 then begin
                         s:=2;
                         for j:=3 to i+1 do s:=s*j;
                         writeln(s);
                         end
             else begin
                  s:=i+2;
                  for j:=2 to i+1 do if i+2-j<>t then s:=s*j;
                  writeln(s);
                  end;
close(input);
close(output);
end.
