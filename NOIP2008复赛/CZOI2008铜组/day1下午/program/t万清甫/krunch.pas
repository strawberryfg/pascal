var s,t:string;
    i,j:longint;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(s);
i:=1;
while i<=length(s) do
      begin
      if s[i]=' 'then inc(j) else begin
                                  delete(s,1,j);break;
                                  end;
      inc(i);
      end;
i:=length(s); j:=i+1;
while i>0 do
      begin
      if s[i]=' 'then dec(j) else begin
                                  delete(s,j,length(s));break;
                                  end;
      dec(i);
      end;
for i:=1 to length(s) do
    begin
    if i>length(s) then break;
    t:=s[i];
    if (t='A') or (t='E') or(t='I')or (t='O')or(t='U') then
       begin delete(s,i,1);dec(i);continue; end;
    for j:=1 to i-1 do
        if s[j]=t then
        begin
           if ((t=' ')and(j+1=i)) then
           begin
           delete(s,i,1);dec(i);break;
           end else
           if (t<>'.')and(t<>',')and(t<>'?')and(t<>' ') then
           begin
           delete(s,i,1);dec(i);break;
           end;
        end;
    if (t='.')or(t=',')or(t='?') then if s[i-1]=' 'then begin
     delete(s,i-1,1);dec(i);continue;end;
     if i+1>length(s) then break;
    end;
writeln(s);
close(input);
close(output);
end.
