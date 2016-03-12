program friends;
var st,st1,st2:string;
    sum1,sum2:array[-1..10] of integer;
    n,i:integer;

procedure init;
var i:integer;
begin
fillchar(sum1,sizeof(sum1),0);
fillchar(sum2,sizeof(sum2),0);
readln(st);
i:=1;
while st[i]<>' ' do
 begin
  inc(sum1[ord(st[i])-ord('0')]);
  inc(i);
 end;
st1:=copy(st,1,i-1);
inc(i);
st2:=copy(st,i,length(st)-i+1);
while i<=length(st) do
 begin
  inc(sum2[ord(st[i])-ord('0')]);
  inc(i);
 end;
end;

function check:boolean;
var i:integer;
begin
check:=true;
for i:=0 to 9 do
 if ((sum1[i]=0)and(sum2[i]<>0))or((sum1[i]<>0)and(sum2[i]=0)) then
  begin
   check:=false;
   exit;
  end;
end;

procedure main;
var yes:boolean;
    i:integer;
    wr:array[0..100] of integer;
begin
yes:=true;
fillchar(wr,sizeof(wr),0);
for i:=0 to 9 do
 if ((sum1[i]=0)and(sum2[i]<>0))or((sum1[i]<>0)and(sum2[i]=0)) then
  begin
   yes:=false;
   inc(wr[0]);
   wr[wr[0]]:=i;
  end;
if yes then
 begin
  writeln('friends');
  exit;
 end;
{if wr[0]>2 then
 begin
  writeln('nothing');
  exit;
 end;
for i:=1 to wr[0] do
 if wr[i]>=2 then
  begin
   writeln('nothing');
   exit;
  end;
for i:=1 to length(st) do
 if (ord(st[i])-ord('0'))=wr[1] then t:=i;
if t>length(st1) then
 begin
  t:=length(st)-length(st1)-1;
  if (t-1<>0)and(sum1[ord(st2[t-1])-ord('0')]<>0) then
   begin
    dec(sum2[wr[1]]);
    dec(sum2[ord(st2[t-1])-ord('0')]);
    if check then
     begin
      writeln('almost friends');
      exit;
     end;
    inc(sum2[wr[1]]);
    inc(sum2[ord(st2[t-1])-ord('0')]);
   end;
  if (t<>length(st2))and(sum1[ord(st2[t+1])-ord('0')]<>0) then
   begin
    dec(sum2[wr[1]]);
    dec(sum2[ord(st2[t+1])-ord('0')]);
    if check then
     begin
      writeln('almost friends');
      exit;
     end;
    inc(sum2[wr[1]]);
    inc(sum2[ord(st2[t+1])-ord('0')]);
   end;
 end
else begin
  if (t-1<>0)and(sum2[ord(st1[t-1])-ord('0')]<>0) then
   begin
    dec(sum1[wr[1]]);
    dec(sum1[ord(st1[t-1])-ord('0')]);
    if check then
     begin
      writeln('almost friends');
      exit;
     end;
    inc(sum1[wr[1]]);
    inc(sum1[ord(st1[t-1])-ord('0')]);
   end;
  if (t<>length(st1))and(sum2[ord(st1[t+1])-ord('0')]<>0) then
   begin
    dec(sum1[wr[1]]);
    dec(sum1[ord(st1[t+1])-ord('0')]);
    if check then
     begin
      writeln('almost friends');
      exit;
     end;
    inc(sum1[wr[1]]);
    inc(sum1[ord(st1[t+1])-ord('0')]);
   end;
 end; }
i:=1;
while i<=length(st1) do
 begin
  if (i-1<>0)and(sum2[ord(st1[i-1])-ord('0')-1]<>0)and(sum2[ord(st1[i])-ord('0')+1]<>0) then
   begin
    if (i-1=1)and(ord(st1[i-1])-ord('0')-1=0) then break;
    dec(sum1[ord(st1[i])-ord('0')]);
    dec(sum1[ord(st1[i-1])-ord('0')]);
    inc(sum1[ord(st1[i])-ord('0')+1]);
    inc(sum1[ord(st1[i-1])-ord('0')-1]);
    if check then
     begin
      writeln('almost friends');
      exit;
     end;
    inc(sum1[ord(st1[i])-ord('0')]);
    inc(sum1[ord(st1[i-1])-ord('0')]);
    dec(sum1[ord(st1[i])-ord('0')+1]);
    dec(sum1[ord(st1[i-1])-ord('0')-1]);
   end;
  if (i-1<>0)and(sum2[ord(st1[i-1])-ord('0')+1]<>0)and(sum2[ord(st1[i])-ord('0')-1]<>0) then
   begin
    dec(sum1[ord(st1[i])-ord('0')]);
    dec(sum1[ord(st1[i-1])-ord('0')]);
    inc(sum1[ord(st1[i])-ord('0')-1]);
    inc(sum1[ord(st1[i-1])-ord('0')+1]);
    if check then
     begin
      writeln('almost friends');
      exit;
     end;
    inc(sum1[ord(st1[i])-ord('0')]);
    inc(sum1[ord(st1[i-1])-ord('0')]);
    dec(sum1[ord(st1[i])-ord('0')-1]);
    dec(sum1[ord(st1[i-1])-ord('0')+1]);
   end;
  inc(i);
 end;
i:=1;
while i<=length(st2) do
 begin
  if (i-1<>0)and(sum1[ord(st2[i-1])-ord('0')-1]<>0)and(sum1[ord(st2[i])-ord('0')+1]<>0) then
   begin
    if (i-1=1)and(ord(st2[i-1])-ord('0')-1=0) then break;
    dec(sum2[ord(st2[i])-ord('0')]);
    dec(sum2[ord(st2[i-1])-ord('0')]);
    inc(sum2[ord(st2[i])-ord('0')+1]);
    inc(sum2[ord(st2[i-1])-ord('0')-1]);
    if check then
     begin
      writeln('almost friends');
      exit;
     end;
    inc(sum2[ord(st2[i])-ord('0')]);
    inc(sum2[ord(st2[i-1])-ord('0')]);
    dec(sum2[ord(st2[i])-ord('0')+1]);
    dec(sum2[ord(st2[i-1])-ord('0')-1]);
   end;
  if (i-1<>0)and(sum1[ord(st2[i-1])-ord('0')+1]<>0)and(sum1[ord(st2[i])-ord('0')-1]<>0) then
   begin
    dec(sum2[ord(st2[i])-ord('0')]);
    dec(sum2[ord(st2[i-1])-ord('0')]);
    inc(sum2[ord(st2[i])-ord('0')-1]);
    inc(sum2[ord(st2[i-1])-ord('0')+1]);
    if check then
     begin
      writeln('almost friends');
      exit;
     end;
    inc(sum2[ord(st2[i])-ord('0')]);
    inc(sum2[ord(st2[i-1])-ord('0')]);
    dec(sum2[ord(st2[i])-ord('0')-1]);
    dec(sum2[ord(st2[i-1])-ord('0')+1]);
   end;
  inc(i);
 end;
writeln('nothing');
end;

begin
assign(input,'friends.in');assign(output,'friends.out');
reset(input);rewrite(output);
readln(n);
for i:=1 to n do
begin
 init;
 main;
end;
close(input);close(output);
end.