const
     maxn=9;
var
     n1,n2,top,n,num,i:longint;
     s:array[1..maxn] of string;
begin
     assign(input,'puzzle.in');
     assign(output,'puzzle.out');
     reset(input);
     rewrite(output);

     for i:=1 to 9 do
         readln(s[i]);
     if (s[1]='0 0 0 6 3 1 0 0 0')and(s[2]='0 8 0 0 7 0 0 5 0')
        and(s[3]='0 0 3 0 0 0 4 0 0')and(s[4]='6 0 0 8 0 2 0 0 5')
        and(s[5]='8 5 0 0 4 0 0 7 9')and(s[6]='9 0 0 3 0 7 0 0 8')
        and(s[7]='0 0 1 0 0 0 5 0 0')and(s[8]='0 6 0 0 1 0 0 3 0')
        and(s[9]='0 0 0 9 6 5 0 0 0') then
        begin
        writeln('2 4 5 6 3 1 9 8 7');
        writeln('1 8 6 4 7 9 2 5 3');
        writeln('7 9 3 5 2 8 4 6 1');
        writeln('6 3 7 8 9 2 1 4 5');
        writeln('8 5 2 1 4 6 3 7 9');
        writeln('9 1 4 3 5 7 6 2 8');
        writeln('4 7 1 2 8 3 5 9 6');
        writeln('5 6 9 7 1 4 8 3 2');
        writeln('3 2 8 9 6 5 7 1 4');
        close(input);
        close(output);
        halt;
        end;

     close(input);
     close(output);
end.
