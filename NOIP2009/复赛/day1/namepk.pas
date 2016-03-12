var n,i,j,find:longint;
    s1,s2,s:string;
    hp,strr,spd:array[1..2]of longint;
    x,y:array[1..20]of longint;
procedure work;
var sum,i,j:longint;
begin
sum:=0;
for i:=1 to length(s1) do
    begin
    inc(sum,((83-x[i])*(83-x[i]))mod 97);
    sum:=sum mod 97;
    end;
hp[1]:=300-sum;
sum:=0;
for i:=1 to length(s2) do
    begin
    inc(sum,((83-y[i])*(83-y[i]))mod 97);
    sum:=sum mod 97;
    end;
hp[2]:=300-sum;
sum:=1;
for i:=1 to length(s1) do
    begin
    sum:=sum*x[i] mod 79;
    end;
strr[1]:=22+sum;
sum:=1;
for i:=1 to length(s2) do
    begin
    sum:=sum*y[i] mod 79;
    end;
strr[2]:=22+sum;
sum:=0;
for i:=1 to length(s1)-1 do
    for j:=i+1 to length(s1) do
        begin
        sum:=sum+x[i]*x[j];
        sum:=sum mod 11;
        end;
spd[1]:=sum;
sum:=0;
for i:=1 to length(s2)-1 do
    for j:=i+1 to length(s2) do
        begin
        sum:=sum+y[i]*y[j];
        sum:=sum mod 11;
        end;
spd[2]:=sum;
end;
procedure doit;
var i,sp1,sp2,st1,st2,hp1,hp2,aa,bb:longint;
begin
i:=1;
while true do
begin
sp1:=20-spd[1];
sp2:=20-spd[2];
st1:=strr[1];
st2:=strr[2];
hp1:=hp[1]; hp2:=hp[2];
aa:=0; bb:=0;
if i mod sp1=0 then begin hp2:=hp2-st1;if hp2<=0 then aa:=1; end;
if i mod sp2=0 then begin hp1:=hp1-st2;if hp1<=0 then bb:=1; end;
if (aa=1)and(bb=0) then writeln('win')
    else if (aa=1)and(bb=1) then writeln('tie')
         else if (aa=0)and(bb=1) then writeln('lose');
if(aa=1)or(bb=1) then break;
hp[1]:=hp1;
hp[2]:=hp2;
inc(i);
end;
end;
begin
assign(input,'namepk.in');
reset(input);
assign(output,'namepk.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(s);
    find:=pos(' ',s);
    s1:=copy(s,1,find-1);
    delete(s,1,find);
    s2:=s;
    fillchar(x,sizeof(x),0); fillchar(y,sizeof(y),0);
    for j:=1 to length(s1) do x[j]:=ord(s1[j]);
    for j:=1 to length(s2) do y[j]:=ord(s2[j]);
    work;
    doit;
    end;
close(input);
close(output);
end.
