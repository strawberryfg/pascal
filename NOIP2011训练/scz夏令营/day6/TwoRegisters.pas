var r,fmin,i,x,y,cnt:longint;
    s,res:string;
begin
assign(input,'TwoRegisters.in');
reset(input);
assign(output,'TwoRegisters.out');
rewrite(output);}
readln(r);
fmin:=maxlongint;
res:='';
for i:=1 to r-1 do
    begin
    x:=r; y:=i;
    cnt:=0;
    s:='';
    while (x>=1)and(y>=1) do
      begin
      if x>y then
         begin
         s:='X'+s;
         inc(cnt);
         if cnt>fmin then break;
         x:=x-y;
         end
      else if x<y then
              begin
              s:='Y'+s;
              inc(cnt);
              if cnt>fmin then break;
              y:=y-x;
              end
          else break;
      end;
    if (x=1)and(y=1) then
       if (cnt<fmin)or((cnt=fmin)and(s<res)) then
          begin
          fmin:=cnt;
          res:=s;
          end;
    end;
writeln(res);
close(input);
close(output);
end.
