{   1  2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17
 10 10 3 7 0 3 7 6 4 6  4  9  1  9  1  2  8  2
  7  0 7 0 7 4 3 4 3 1  6  1  6  0  7  7  0  5
  3  0 0 3 3 3 0 0 3 3  0  0  3  1  2  1  2  3
     1 1 1 2 2 3 5 5 7  8  9  1011 12 13 14 15
                                                     }
const maxn=100;
type arr=array[1..maxn]of longint;
var  c10,c7,c3,c4,e:arr;
    old,ne,t10,t7,t3,i,k:longint;
procedure print;
var i,j:longint;
begin
i:=ne;
j:=0;
while i<>0 do
      begin
      inc(j);
      e[j]:=i;
      i:=c4[i];
      end;
for i:=j downto 1 do
    write(c10[e[i]]:4);
writeln;
for i:=j downto 1 do
    write(c7[e[i]]:4);
writeln;
for i:=j downto 1 do
    write(c3[e[i]]:4);
writeln;
for i:=1 to j do
    write(i:4);
writeln;
writeln;
end;
procedure pd(a,b,c:longint);
var i:longint;
    tf:boolean;
begin
tf:=true;
for i:=1 to ne do
    if (a=c10[i])and(b=c7[i])and(c=c3[i]) then begin tf:=false;break;end;
if tf=true then
           begin
           inc(ne);
           c10[ne]:=a;c7[ne]:=b;c3[ne]:=c;
           c4[ne]:=old;
           if (a=5)or(b=5)then begin print;end;
           end;
end;
begin
c10[1]:=10;c7[1]:=0;c3[1]:=0;old:=1;ne:=1;c4[1]:=0;
while old<=ne do
      begin
      for i:=1 to 6 do
          case i of
          {10-7}1:begin
                  t3:=c3[old];
                  k:=c10[old]+c7[old];
                  if k>7 then begin t7:=7;t10:=k-7 end
                         else begin t10:=0;t7:=k; end;
                  pd(t10,t7,t3);
                  end;
          {10-3}2:begin
                  t7:=c7[old];
                  k:=c10[old]+c3[old];
                  if k>3 then begin t3:=3;t10:=k-3; end
                         else begin t10:=0;t3:=k; end;
                  pd(t10,t7,t3);
                  end;
          {7-10}3:begin
                  t3:=c3[old];
                  k:=c10[old]+c7[old];
                  t7:=0;t10:=k;
                  pd(t10,t7,t3);
                  end;
          {7-3}4:begin
                  t10:=c10[old];
                  k:=c3[old]+c7[old];
                  if k>3 then begin t3:=3;t7:=k-3 end
                         else begin t7:=0;t3:=k; end;
                  pd(t10,t7,t3);
                  end;
          {3-10}5:begin
                  t7:=c7[old];
                  k:=c10[old]+c3[old];
                  if k>10 then begin t10:=10;t3:=k-10 end
                         else begin t3:=0;t10:=k; end;
                  pd(t10,t7,t3);
                  end;
          {3-7}6:begin
                  t10:=c10[old];
                  k:=c7[old]+c3[old];
                  if k>7 then begin t7:=7;t3:=k-7 end
                         else begin t3:=0;t7:=k; end;
                  pd(t10,t7,t3);
                  end;
          end;
    old:=old+1;
end;
end.
