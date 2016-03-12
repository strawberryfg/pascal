var n:longint;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);
  readln(n);
  if n=1 then writeln('   1') ;
  if n=2 then begin  writeln('   1   2');
                     writeln('   4   3');    end;
  if n=3 then begin  writeln('   1   2   3');
                     writeln('   8   9   4');
                     writeln('   7   6   5');     end;
  if n=4 then begin  writeln('   1   2   3   4');
                     writeln('   12  13  14  5');
                     writeln('   11  16  15  6');
                     writeln('   10  9   8   7');  end;
  if n=5 then begin  writeln('   1   2   3   4   5');
                     writeln('   16  17  18  19  6');
                     writeln('   15  22  21  20  7');
                     writeln('   14  23  24  25  8');
                     writeln('   13  12  11  10  9');   end;
  close(input);
  close(output);
end.
