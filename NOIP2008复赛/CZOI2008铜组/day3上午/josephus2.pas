var k,m,start,i:longint;
    find:boolean;
function check(n:longint):boolean;
var result:longint;
begin
result:=(start+m-1)mod n;
if result>=k then begin
                  start:=result;
                  exit(true);
                  end
                  else
                  exit(false);
end;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
readln(k);
m:=k;
find:=false;
while find=false do
      begin
      find:=true;
      start:=0;
      for i:=0 to k-1 do
          if check(2*k-i)=false then
             begin
             find:=false;
             break;
             end;
      inc(m);
      end;
writeln(m-1);
close(input);
close(output);
end.