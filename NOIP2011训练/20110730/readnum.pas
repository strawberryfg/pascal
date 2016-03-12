const spe:array[2..6]of char=('S','B','Q','W','Y');
var s:string;
    t,i,j,len,st,tmp,tt:longint;
    pd:boolean;
begin
assign(input,'readnum.in');
reset(input);
assign(output,'readnum.out');
rewrite(output);
readln(s);
if s[1]='+' then delete(s,1,1)
   else if s[1]='-' then
           begin
           write('F');
           delete(s,1,1);
           end;
t:=pos('.',s);
if t=0 then t:=length(s)+1;
i:=1;
pd:=false;
len:=t;
st:=0;
while i<t do
 begin
 if s[i]<>'0' then
    begin
    pd:=true;
    write(s[i]);
    if st<>0 then tmp:=i-st+1 else tmp:=i;
    if len-tmp>=2 then
       begin
       if len-tmp>8 then
          write(spe[6])
       else if len-tmp>5 then write(spe[len-tmp-4]) else write(spe[len-tmp]);
       end;
    inc(i);
    end
 else
    begin
    j:=i;
    while (j+1<t)and(s[j+1]='0') do inc(j);

    if (i=1) then
       begin
       st:=j+1; //j+1 kaishi
       len:=t-j;
       end;
    if st<>0 then tmp:=i-st+1 else tmp:=i;
    if st<>0 then tt:=j-st+1 else tt:=j;
    if (len-tmp>=5)and(len-tmp<=7)and(len-tt<=5) then
       begin
       write('W');
       if len-tt<>1 then write('0');
       end
    else if (j+1<t)and(i>1) then write('0');
    i:=j+1;
    end;
 end;
if not pd then write('0');
if (t<>length(s)+1)and(t<>length(s)) then
   begin
   write('D');
   for i:=t+1 to length(s) do
       begin
       write(s[i]);
       end;
   end;
writeln;
close(input);
close(output);
end.
