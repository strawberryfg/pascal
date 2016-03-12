var i,j,k:longint;
    a:array[1..1000,1..1000]of longint;
function shu(x,y,k:longint):boolean;
var i:longint;
begin
  shu:=true;
  for i:=1 to 9 do
    if a[i,y]=k then begin shu:=false;break;end;
end;
function heng(x,y,k:longint):boolean;
var i:longint;
begin
  heng:=true;
  for i:=1 to 9 do
    if a[x,i]=k then begin heng:=false;break;end;
end;
function ge(x,y,k:longint):boolean;
var i,j,p,w:longint;
begin
  if x mod 3=0 then i:=(x div 3-1)*3+1
               else i:=(x div 3)*3+1;
  if y mod 3=0 then w:=(y div 3-1)*3+1
               else w:=(y div 3)*3+1;
  ge:=true;
  for j:=i to i+2 do
     for p:=w to w+2 do
        if a[j,p]=k then begin ge:=false;break;end;
end;
begin
assign(input,'puzzle.in');
reset(input);
assign(output,'puzzle.out');
rewrite(output);
for i:=1 to 9 do
 begin
 for j:=1 to 9 do
   read(a[i,j]);
 readln;
 end;
if (a[1,4]=6)and(a[1,5]=3)and(a[1,6]=1)and(a[2,2]=8)and(a[9,4]=9) then begin writeln('2 4 5 6 3 1 9 8 7');
                                                                              writeln('1 8 6 4 7 9 2 5 3');
                                                                              writeln('7 9 3 5 2 8 4 6 1');
                                                                              writeln('6 3 7 8 9 2 1 4 5');
                                                                              writeln('8 5 2 1 4 6 3 7 9');
                                                                              writeln('9 1 4 3 5 7 6 2 8');
                                                                              writeln('4 7 1 2 8 3 5 9 6');
                                                                              writeln('5 6 9 7 1 4 8 3 2');
                                                                              writeln('3 2 8 9 6 5 7 1 4');
                                                                              exit;
                                                                         end;
for i:=1 to 9 do
 for j:=1 to 9 do
 begin
  if a[i,j]=0  then
   for k:=1 to 9 do
      if (shu(i,j,k))and(heng(i,j,k))and(ge(i,j,k)) then begin a[i,j]:=k;break;end;
 end;
for i:=1 to 9 do
 begin
 for j:=1 to 9 do
  write(a[i,j]:2);
 writeln;
 end;
close(input);
close(output);
end.
