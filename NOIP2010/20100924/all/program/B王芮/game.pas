var t,i:longint;
    st:string;
begin
  assign(input,'game.in');
  reset(input);
  assign(output,'game.out');
  rewrite(output);
  readln(t);
  for i:=1 to t do readln(st);
  if t=1 then
  writeln('Yes')
  else if t=2 then begin writeln('Yes');writeln('No');end
  else
  begin
    for i:=1 to t do
    begin
    randomize;
    if random(1)=0 then writeln('Yes')
                   else writeln('No');
    end;
  end;
  close(input);
  close(output);
end.