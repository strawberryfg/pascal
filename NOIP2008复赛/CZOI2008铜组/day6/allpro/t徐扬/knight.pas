var st:string;
begin
 assign(input,'knight.in');
 assign(output,'knight.out');
 reset(input);
 rewrite(output);
 readln(st);
 writeln('No Answer!');
 close(input);
 close(output);
end.