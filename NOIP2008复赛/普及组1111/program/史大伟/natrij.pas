var  n1,n2:string;
    a,b,c:array[1..3] of longint;
    i:longint;
    t,k:longint;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(n1);
readln(n2);
t:=1;
for i:=1 to 8 do
if n1[i]<>':' then a[t]:=a[t]*10+ord(n1[i])-48
              else t:=t+1;
t:=1;
for i:=1 to 8 do
if n2[i]<>':' then b[t]:=b[t]*10+ord(n2[i])-48
              else t:=t+1;
if b[1]<a[1] then b[1]:=b[1]+24;
for i:=3 downto 1 do
    begin
    case i of
    3:begin
      if b[3]<a[3] then begin b[3]:=b[3]+60;k:=1;end
                   else k:=0;
                    c[3]:=b[3]-a[3];
      end;
    2:begin
      if (b[2]-k)<a[2] then begin b[2]:=b[2]+60;k:=1;end;
         c[2]:=b[2]-a[2]-k;
         k:=0;
      end;
    1:begin
      c[1]:=b[1]-a[1]-k;
      end;
    end;
    end;
for i:=1 to 2 do
    if c[i]<10 then write('0',c[i],':')
               else if c[i]=0 then write('00:')
                              else write(c[i],':');
if c[3]<10 then write('0',c[3])
           else  write(c[3]);
close(input);
close(output);
end.