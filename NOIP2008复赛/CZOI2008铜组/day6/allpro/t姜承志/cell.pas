var x,y,i1,i2,total:byte;
    pic:packed array[0..61,0..61]of char;
function pd(x,y:byte):boolean;
         begin
         pd:=true;
         if not(pic[x+1,y]in['1','2','3','4','5','6','7','8','9',#0]) then begin
                                     pd:=false;
                                     exit;
                                     end;
         if not(pic[x-1,y]in['1','2','3','4','5','6','7','8','9',#0]) then begin
                                     pd:=false;
                                     exit;
                                     end;
         if not(pic[x,y+1]in['1','2','3','4','5','6','7','8','9',#0]) then begin
                                     pd:=false;
                                     exit;
                                     end;
         if not(pic[x,y-1]in['1','2','3','4','5','6','7','8','9',#0]) then begin
                                     pd:=false;
                                     exit;
                                     end;

         end;
begin
assign(input,'cell.in');
assign(output,'cell.out');
reset(input);
readln(x,y);
for i1:=1 to x do
    begin
    for i2:=1 to y do
        read(pic[i1,i2]);
    readln;
    end;
close(input);
for i1:=1 to x do
    for i2:=1 to y do
        if(pic[i1,i2]<>'0')and(pd(i1,i2)) then begin
                                               if (i1=1) and (i2=1) then continue;
                                               if (i1=x) and (i2=1) then continue;
                                               if (i1=1) and (i2=y) then continue;
                                               if (i1=x) and (i2=y) then continue;
                                               inc(total);
                                               end;


rewrite(output);
writeln(total);
close(output);
end.
