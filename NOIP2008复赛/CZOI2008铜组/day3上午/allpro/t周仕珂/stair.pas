
var n,k,i,total,step,p,j:longint;
        hj:array[1..10000]of longint;
        pdhj:array[1..10000] of boolean;

procedure try(dep:longint);
var i:longint;
begin
if step=n  then begin inc(total);step:=0; end
                else  for i:=1 to 3 do
                                        begin

                                        step:=step+i;


                                        if not(pdhj[step]) then step:=step-i
                                                        else try(dep+1);
                                        end;

end;
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
readln(n);
readln(k);
fillchar(pdhj,sizeof(pdhj),true);
for i:=1 to k do
        begin
        read(hj[i]);
        pdhj[hj[i]]:=false;
        end;
step:=0;
total:=0;
try(1);
writeln(total div 2+1);
close(input);
close(output);
end.
