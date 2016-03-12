var k,n:longint;

procedure start;
begin
assign(input,'broj.in');reset(input);
assign(output,'broj.out');rewrite(output);
end;

procedure over;
begin
close(input);
close(output);
end;

procedure intt;
begin
readln(n);
end;

procedure outt;
begin
writeln(k);
end;

procedure run;
var i,j:longint;
    t:string;
begin
if n<10 then k:=n
 else if n<99 then k:=9*1+(n-9)*2
      else if n<999 then k:=9*1+90*2+(n-99)*3
           else if n<9999 then k:=9*1+90*2+900*3+(n-999)*4
                else if n<99999 then k:=9*1+90*2+900*3+9000*4+(n-9999)*5
                     else if n<999999 then k:=9*1+90*2+900*3+9000*4+90000*5+(n-99999)*6
                          else if n<9999999 then k:=9*1+90*2+900*3+9000*4+90000*5+900000*6+(n-999999)*7
                               else if n<99999999 then k:=9*1+90*2+900*3+9000*4+90000*5+900000*6+9000000*7+(n-9999999)*8
                                    else if n<999999999 then k:=9*1+90*2+900*3+9000*4+90000*5+900000*6+9000000*7+90000000*8+(n-99999999)*9
                                         else  k:=9*1+90*2+900*3+9000*4+90000*5+900000*6+9000000*7+90000000*8+90000000*9+10;
end;

begin
//start;
intt;
run;
outt;
over;
end.
