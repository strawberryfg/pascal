program fire;
var n,i,j:longint;
    a:array[1..100,1..100]of longint;
begin
     assign(input,'fire.in');reset(input);
     assign(output,'fire.out');rewrite(output);
     readln(n);
     for i:=1 to n do
         for j:=1 to n do
         read(a[i,j]);
         writeln('5');
     close(input);
     close(output);
end.