var a,i,k:longint;
begin
read(a);
k:=a;
repeat
     if k mod 2=0 then begin writeln(k,'/2=',k div 2);k:=k div 2; end
                  else begin writeln(k,'*3+1=',k*3+1);k:=k*3+1; end;
until k=1;
end.