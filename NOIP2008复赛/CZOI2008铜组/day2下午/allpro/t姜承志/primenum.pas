var temp,total:integer;
function  prime(n:integer):boolean;
          var i:integer;
          begin
          prime:=true;
          for i:=2 to trunc(sqrt(n)) do
              if n mod i=0 then begin
                                prime:=false;
                                exit;
                                end;
          end;
begin
assign(input,'primenum.in');
assign(output,'primenum.out');
reset(input);
while not eof do
      begin
      read(temp);
      if (prime(temp))and (temp <>0)and(temp<>1) then
         inc(total);
      end;
close(input);
rewrite(output);
writeln(total);
close(output);
end.
