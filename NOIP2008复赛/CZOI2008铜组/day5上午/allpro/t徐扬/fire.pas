var  n,i:longint;
     str:string;
begin
 assign(input,'fire.in');
 assign(output,'fire.out');
 reset(input);
 rewrite(output);
 readln(n);
 for i:=1 to n do
    readln(str);
 writeln(n);
 close(input);
 close(output);
end.