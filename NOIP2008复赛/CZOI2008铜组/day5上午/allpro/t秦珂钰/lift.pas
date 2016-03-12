program lift(input,output);
const max=200;
var a:array[1..max] of integer;
    b:array[1..max] of boolean;
    i,x,y,n,z,m:integer;
begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  readln(n,x,y);
  for i:=1 to n do
    read(a[i]);
  if x=y then begin
                writeln('0');
                close(input);
                close(output);
                exit;
              end;
  for i:=1 to 20 do
    b[i]:=true;
  m:=0;
  z:=x;
  while x<>y do
  begin
    if x+a[x]>n then if x-a[x]<1 then begin
                                        m:=m-1;
                                        if m=0 then begin
                                                      writeln('-1');
                                                      close(input);
                                                      close(output);
                                                      exit;
                                                    end;
                                        end
                                   else begin
                                          x:=x-a[x];
                                          m:=m+1;
                                        end
                else begin
                       x:=x+a[x];
                       m:=m+1;
                       b[m]:=false;
                     end;
  end;
  writeln(m);
  close(input);
  close(output);
end.
