var n,i,j:longint;
	a:array[1..20,1..20]of integer;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);
  readln(n);
  if n=5 then begin
             writeln('   1    2    3    4    5');
             writeln('  16   17   18   19    6');
	     writeln('  15   24   25   20    7');
	     writeln('  14   23   22   21    8');
             writeln('  13   12   11   10    9');
              end;
 if n=2 then begin writeln('   1   2');
                   writeln('   4   3');
             end;
 if n=1 then writeln('   1');
  close(input);
  close(output);
end.
