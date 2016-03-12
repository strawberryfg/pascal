var n,d:longint;
    data:array[1..2500]of integer;
    a,sheet:array[1..2500,1..2500]of integer;
procedure file1;
begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);
rewrite(output);
end;
procedure file2;
begin
close(input);
close(output);
end;
function least(fi,fj:longint):longint;
var li,temp:longint;
begin
if (abs(a[fi,fj])<=d)or(abs(a[fi,fj])=fj-fi+1)
   then least:=1
     else begin
          sheet[fi,fj]:=10000;
          for li:=fi to fj-1 do
            begin
            temp:=least(fi,li)+least(li+1,fj);
            if temp<sheet[fi,fj]
              then sheet[fi,fj]:=temp;
            end;
            least:=sheet[fi,fj];
          end;
end;
procedure work;
var wi,wj:longint;
begin
  for wi:=1 to n do
    for wj:=wi to n do
      begin
      if wi=wj then a[wi,wj]:=data[wi]
        else a[wi,wj]:=a[wi,wj-1]+data[wj];
      end;
end;
procedure datain;
var di:longint;
    ch:char;
begin
readln(n,d);
for di:=1 to n do
 begin
 read(ch);
 if ch='H' then data[di]:=1
           else data[di]:=-1;
 end;
end;
begin
file1;
datain;
work;
writeln(least(1,n));
file2;
end.
