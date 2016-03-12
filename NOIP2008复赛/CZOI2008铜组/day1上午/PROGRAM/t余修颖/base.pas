begin
     assign(input,'base.in');
     reset(input);
     assign(output,'base.out');
     rewrite(output);
 close(input);
     close(output);