var n,c,no:longint;
    s,str,d:string;
procedure king(f,n:longint);
var i,j:longint;
begin
  for i:=1+c to n do
  begin
    d:='';
    str:=str+char(i+64);
    no:=no+1;
    c:=ord(str[f])-64;
    if str=s then begin writeln(no); close(input); close(output); halt; end;
    king(f+1,n);
    d:='';
    for j:=1 to length(str)-1 do
    begin
      d:=d+str[j];
    end;
    str:=d;
  end;
end;
begin
  assign(input,'charcom.in');
  reset(input);
  assign(output,'charcom.out');
  rewrite(output);
  readln(n);
  readln(s);
  king(1,n);
  close(input);
  close(output);
end.
