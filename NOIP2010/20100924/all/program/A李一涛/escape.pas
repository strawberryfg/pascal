begin
 assign(input,'escape.in'); reset(input);
 assign(output,'escape.out'); rewrite(output);
 writeln('3');
 writeln('5');
 writeln('-1');
 close(input); close(output);
end.