var s,maxs,mins,nows:string;
    i,x,min,max:integer;
    t:boolean;
begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);
  readln(s);
  s:=s+' ';
  nows:=s[1];x:=1;
  max:=0;
  i:=2;
  while i<=length(s) do
    begin
      if s[i]<>' ' then begin
                          nows:=nows+s[i];
                          x:=x+1;
                          i:=i+1;
                         end
                   else if x>max then begin
                                         max:=x;
                                         maxs:=nows;
                                         nows:=s[i+1];
                                         i:=i+2;
                                       end;

    end;
  nows:=s[1];x:=1;
  min:=300;
  i:=2;
  while i<=length(s) do
    begin
      if s[i]<>' ' then begin
                          nows:=nows+s[i];
                          x:=x+1;
                          i:=i+1;
                         end
                   else if x<min then begin
                                         min:=x;
                                         mins:=nows;
                                         nows:=s[i+1];
                                         i:=i+2;
                                         x:=1;
                                       end
                                   else begin
                                          nows:=s[i+1];
                                          i:=i+2;
                                          x:=1;
                                        end;

    end;

  writeln(maxs);
  writeln(mins);
  close(input);
  close(output);
end.
