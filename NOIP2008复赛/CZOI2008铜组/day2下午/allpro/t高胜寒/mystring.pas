var s:string;
    i,long,shorter,longer,lno,sno,ccc,ddd:integer;
begin
  assign(input,'mystring.in');
  reset(input);
  assign(output,'mystring.out');
  rewrite(output);
  readln(s);
  shorter:=32767;
  for i:=1 to length(s) do
  begin
    if (s[i]>='a')and(s[i]<='z') then long:=long+1 else
    begin
        if long>longer then begin longer:=long; lno:=i; end;
        if long<shorter then begin shorter:=long; sno:=i; end;
        long:=0;
    end;
  end;
  ccc:=0;
  ddd:=0;
  if long>longer then begin longer:=long; lno:=i; ccc:=1; end;
  if (long<shorter)and(long<>0) then
     begin shorter:=long; sno:=i; ddd:=1; end;
  if shorter=32767 then begin writeln; exit; end;
  for i:=lno-longer+ccc to lno-1+ccc do
      write(s[i]);
  writeln;
  for i:=sno-shorter+ddd to sno-1+ddd do
      write(s[i]);
  writeln;
  close(input);
  close(output);
end.
