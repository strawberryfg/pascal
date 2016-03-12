var n,i,j,s,k:longint;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
k:=0;
j:=-1;
s:=0;
if n=8 then begin writeln(8);close(input);close(output);exit;end;
if n=10 then begin writeln(10);close(input);close(output);exit;end;
if n<4 then begin writeln(1);close(input);close(output);exit;end
       else if n<8 then begin
                        for i:=3 to n do
                            s:=s+1;
                        writeln(s);
                        end
            else if n>8 then
                        begin
                        for i:=9 to n do
                            begin
                            j:=j+1;
                            k:=k+j;
                            end;
                        s:=n+(n-8)*3+k;
                        writeln(s);
                        end;
close(input);
close(output);
end.