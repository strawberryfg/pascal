program ex;
var a:array[1..200] of longint;
    i,k,sum,n,p:longint;
begin
    assign(input,'cow.in');
    reset(input);
    assign(output,'cow.out');
    rewrite(output);
    readln(n);
    if n<4 then begin
                    writeln('1');
                    close(input);
                    close(output);
                    halt;
                end
           else if n<7 then begin
                                p:=p-2;
                                writeln(p);
                                close(input);
                                close(output);
                                halt;
                            end
                       else if n>=8 then begin
                                             k:=6;
                                             sum:=0;
                                             for i:=3 to n-5 do
                                                 sum:=sum+i;
                                         end;
    writeln(sum+k);
    close(input);
    close(output);
end.
