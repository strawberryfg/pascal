var n,s:longint;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  readln(n);
  if n<10 then
     s:=n*1
  else
    if n<100 then
       s:=9+(n-9)*2
    else
      if n<1000 then
         s:=189+(n-99)*3
      else
        if n<10000 then
           s:=2889+(n-999)*4
        else
          if n<100000 then
             s:=38889+(n-9999)*5
          else
            if n<1000000 then
               s:=488889+(n-99999)*6
            else
              if n<10000000 then
                 s:=5888889+(n-999999)*7
              else
                if n<100000000 then
                   s:=68888889+(n-9999999)*8
                else
                  if n<1000000000 then
                     s:=788888889+(n-99999999)*9;
  writeln(s);
  close(input);
  close(output);
end.