program  broj;
var N,js,i:integer;
     s:string;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  readln(N);
  js:=0;
  for i:= 1 to N do
    begin
    str(i,s);
    js:=js+length(s);
    end;
  write(js);
  close(input);
  close(output);
end.