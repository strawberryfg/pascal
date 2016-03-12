var n,m,i:longint; answer:int64;
    max:array[7..200]of longint;

begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);

    readln(n);
     if n<=3 then begin writeln(1); close(input);close(output); exit; end;
     if n<=7 then begin writeln(n-2); close(input);close(output); exit; end;
     max[7]:=1;
     answer:=5;
    for i:=8 to n do
        max[i]:=max[i-1]+(i div 4)-1;
    for i:=8 to n do
        answer:=answer+max[i];
    writeln(answer);

close(input);
close(output);
end.