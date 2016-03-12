        const maxl=80;
type optype=string[maxl];
var op1:optype;
    d:array[1..maxl]of longint;
    s:array[1..80,1..2]of real;
    nopn,nopt,top:longint;
    error:boolean;
procedure init;
begin
assign(input,'intervala.in'); reset(input);
{assign(output,'intervala.out'); rewrite(output);}
end;
procedure delete_bracket(var lo,hi:longint);
var i,j,k:longint;
begin
j:=100; i:=lo; k:=0;
while i<=hi-k do
      begin
      if op1[i]='(' then inc(k)
         else if op1[i]=')' then dec(k);
      if not (op1[i] in ['(',')'] ) and(k<j) then j:=k;
      inc(i);
      end;
for i:=1 to j do
    begin
    inc(lo);dec(hi);
    end;
end;
procedure inta(lo,hi:longint);
var i,j,k,l:longint;
    t:real;
    f,f1,f2:boolean;
begin
inc(top);
if op1[lo]='-' then
   begin
   f:=true; inc(lo);
   end
else f:=false;
i:=lo+1;
for j:=1 to 2 do
    begin
    k:=0; s[top,j]:=0; f2:=false;
    if op1[i]='-' then begin f1:=true; inc(i); end else f1:=false;
    while not (op1[i] in [',',']']) do
          begin
          if f2 then inc(k);
          if op1[i]='.' then f2:=true else s[top,j]:=s[top,j]*10+ord(op1[i])-48;
          inc(i);
          end;
    if k<>0 then for l:=1 to k do s[top,j]:=s[top,j]/10;
    if f1 then s[top,j]:=-s[top,j];
    inc(i);
    end;
if f then
     begin
     t:=-s[top,1]; s[top,1]:=-s[top,2]; s[top,2]:=t;
     end;
end;
procedure compute(lo,hi:longint);
var i,j,c,k:longint;
    min,max,a:real;
begin
if lo>hi then
   begin
   inc(top);
   s[top,1]:=0; s[top,2]:=0;
   exit;
   end;
delete_bracket(lo,hi);
nopn:=0; nopt:=0;
for i:=lo to hi do
    begin
    if d[i]>0 then inc(nopt);
    if op1[i]=']' then inc(nopn);
    end;
if nopn=1 then
   begin
   inta(lo,hi);
   exit;
   end;
c:=0; k:=0;
for i:=lo to hi do
    begin
    if op1[i]='(' then inc(k)
       else if op1[i]=')' then dec(k)
            else if d[i]>=1 then
                    if (k=0)and((c=0)or(d[c]<=d[i])) then c:=i;
    end;
compute(lo,c-1);
compute(c+1,hi);
if error then exit;
min:=1e8; max:=-1e8;
for i:=1 to 2 do
    for j:=1 to 2 do
        begin
        case op1[c]of
        '+':a:=s[top-1,i]+s[top,j];
        '-':a:=s[top-1,i]-s[top,j];
        '*':a:=s[top-1,i]*s[top,j];
        '/':if s[top,1]*s[top,2]<1e-6 then
               begin
               writeln('Division by zero'); error:=true;
               exit;
               end
            else a:=s[top-1,i]/s[top,j];
           end;
        if a>max then max:=a; if a<min then min:=a;
        end;
s[top,1]:=0; s[top,2]:=0; dec(top); s[top,1]:=min; s[top,2]:=max;
end;
procedure solve;
var i:longint;
begin
readln(op1);
error:=false; top:=0;
i:=1;
while i<=length(op1) do
   begin
   if op1[i]=' 'then delete(op1,i,1) else inc(i);
   end;
fillchar(d,sizeof(d),0);
fillchar(s,sizeof(s),0);
if op1[i]='-' then d[1]:=1;
for i:=2 to length(op1) do
    begin
    if (op1[i]='-')and(op1[i-1] in ['(','+','-','*','/']) then d[i]:=1
	   else if op1[i] in ['*','/'] then d[i]:=2
       else if (op1[i] in ['+','-'])and(not(op1[i-1] in ['[',','])) then d[i]:=3;
    end;
compute(1,length(op1));
if error then exit;
writeln('[',s[1,1]:0:3,',',s[1,2]:0:3,']');
end;
begin
init;
while not eof(input) do solve;
close(input);
close(output);
end.