var n,b,temp,i:byte;
    total:longint;
    bad:packed array[1..32]of boolean;
procedure try(dep:byte);
          var i:byte;
          begin
          if dep=n then inc(total)
                   else
          if dep<n then begin
                        for i:=1 to 3 do
                            if bad[dep+i]=false then try(dep+i);
                        end;
          end;
begin
assign(input,'stair.in');
assign(output,'stair.out');
reset(input);
read(n,b);
for i:=1 to b do begin
                 read(temp);
                 bad[temp]:=true;
                 end;
close(input);
try(0);
rewrite(output);
writeln(total);
close(output);
end.