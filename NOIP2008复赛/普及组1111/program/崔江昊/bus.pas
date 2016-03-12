var i,n,h:longint; a:array[1..3000] of boolean; x:char;
procedure try(b,e,dep,che:longint);
   var i,s,j,k,o,p:longint;
   begin
   if dep=0 then begin writeln(che); close(input); close(output); halt; end
            else for i:=e downto b do
                    begin
                    for j:=b to e-i+1 do
                       begin
                       o:=0; p:=0;
                       for k:=j to i+j-1 do
                         begin
                         if a[k]=false then  o:=o+1
                                       else p:=p+1;
                         end;


                         if (abs(o-p)<=h) or (o=0) or (p=0) then begin
                                             try(b,j-1,dep-i,che+1);
                                             try(i+J,e,dep-i,che+1);
                                             end;
                       end;
                    end;
   end;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,h);
for i:=1 to n do
   begin
   read(x);
   if x='H' then a[i]:=true
            else a[i]:=false;
   end;
try(1,n,n,0);
close(input);
close(output);
end.
