var n,i,j,all,s,num,k,number,ans:longint;
    a:array[0..201]of longint;
    count:array[0..256]of boolean;
begin
  assign(input,'ghillie.in'); reset(input);
  assign(output,'ghillie.out'); rewrite(output);
  readln(n);
  while not eoln do begin inc(all); read(a[all]); count[a[all]]:=true; end;
  for i:=1 to n do
  begin
    for j:=1 to all do
    begin
      if not count[a[j]] then continue;
      num:=0; ans:=0; number:=a[j];
      while number<>0 do
      begin
        num:=1; s:=number mod 10;
        for k:=1 to i+1 do num:=num*s;
        ans:=ans+num; number:=number div 10;
      end;
      if ans<=255 then count[ans]:=false;
    end;
  end;
  for i:=0 to 255 do if count[i] then begin write(i); break; end;
  j:=i+1;
  for i:=j to 255 do if count[i] then write(' ',i);
  writeln;
  close(input); close(output);
end.