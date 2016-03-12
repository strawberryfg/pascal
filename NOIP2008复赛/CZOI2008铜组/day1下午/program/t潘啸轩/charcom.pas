var
  a:array[1..26] of integer;
  str:string;
  n:integer;
begin
  assign(input,'charcom.in');
  reset(input);
  assign(output,'charcom.out');
  rewrite(output);
  readln(n);
  readln(str);
  if n>26 then begin writeln('error!');
                     exit;
               end;
  

