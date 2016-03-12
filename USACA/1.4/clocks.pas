{
ID: xiaweiy1
PROB:clocks
LANG:PASCAL
}
const eff:array[1..9,0..9]of integer=
          ((3,1,2,4,0,0,0,0,0,0),(4,1,2,3,5,0,0,0,0,0),
          (3,2,3,6,0,0,0,0,0,0),(4,1,4,5,7,0,0,0,0,0),
          (5,1,3,5,7,9,0,0,0,0),(4,3,5,6,9,0,0,0,0,0),
          (3,4,7,8,0,0,0,0,0,0),(4,5,7,8,9,0,0,0,0,0),
          (3,6,8,9,0,0,0,0,0,0));
     con:array[1..12]of integer=(-1,-1,1,-1,-1,2,-1,-1,3,-1,-1,0);
type taa=array[1..9]of longint;
var a,t,use:taa;
    i,j,k:longint;
    min:string;
procedure work(a,use:taa;i1,i2,i5:longint);
var i,j:longint;
    ts:string;
    pd:boolean;
begin
use[1]:=i1; use[2]:=i2; use[5]:=i5;
use[4]:=4-(a[1]+use[1]+use[2])mod 4;
use[4]:=use[4] mod 4;
use[3]:=4-(a[2]+use[1]+use[2]+use[5])mod 4;
use[3]:=use[3] mod 4;
use[6]:=4-(a[3]+use[2]+use[3])mod 4;
use[6]:=use[6] mod 4;
use[7]:=4-(a[4]+use[1]+use[4]+use[5])mod 4;
use[7]:=use[7] mod 4;
use[8]:=4-(a[7]+use[4]+use[7])mod 4;
use[8]:=use[8] mod 4;
use[9]:=4-(a[6]+use[3]+use[5]+use[6])mod 4;
use[9]:=use[9] mod 4;
ts:='';
pd:=true;
for i:=1 to 9 do
    begin
    for j:=1 to eff[i,0] do
        a[i]:=a[i]+use[eff[i,j]];
    a[i]:=a[i] mod 4;
    if a[i]<>0 then begin pd:=false;break; end;
    end;
if pd=false then exit;
for i:=1 to 9 do
    begin
    for j:=1 to use[i] do
        begin
        ts:=ts+char(i+48);
        if length(ts)>length(min) then exit;
        if (length(ts)=length(min))and(ts>min) then exit;
        end;
    end;
if (length(ts)<length(min))or((length(ts)=length(min))and(ts<min)) then min:=ts;
end;
begin
assign(input,'clocks.in');
reset(input);
assign(output,'clocks.out');
rewrite(output);
min:='999999999999999999999999999999999999999';
readln(a[1],a[2],a[3]);
readln(a[4],a[5],a[6]);
readln(a[7],a[8],a[9]);
for i:=1 to 9 do a[i]:=con[a[i]];
for i:=1 to 9 do t[i]:=a[i];
for i:=0 to 3 do
    for j:=0 to 3 do
        for k:=0 to 3 do
            work(a,use,i,j,k);
for i:=1 to length(min) do
    begin
    write(ord(min[i])-48);
    if i<length(min) then write(' ');
    end;
writeln;
close(input);
close(output);
end.
