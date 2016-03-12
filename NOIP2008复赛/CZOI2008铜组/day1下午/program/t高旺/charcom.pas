var n,i,x:longint;
    s,y:string;
begin
  assign(input,'charcom.in');
  assign(output,'charcom.out');
  reset(input);
  rewrite(output);
  readln(n);
  readln(s);
  y:='A';i:=1;
  while y<>s do
    begin
      if y[length(y)]=chr(n+64) then
        begin
          x:=ord(y[length(y)-1]);
          delete(y,length(y)-1,2);
          y:=y+chr(x+1);
        end
                                 else
            if y[length(y)]<chr(n+64) then y:=y+chr(ord(y[length(y)])+1);
      i:=i+1;
    end;
  writeln(i);
  close(input);
  close(output);
end.