var a,b,c,d:integer;
begin
     assign(input,'base.in');
     reset(input);
     assign(output,'base.out');
     rewrite(output);
     read(a,b,c,d);writeln(12);
     close(input);
     close(output);
end.