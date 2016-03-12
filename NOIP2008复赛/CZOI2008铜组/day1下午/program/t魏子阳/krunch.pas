var s1:string;
    h,i,j:longint;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
read(s1);
while s1[1]=' ' do delete(s1,1,1);
while s1[length(s1)]=' ' do delete(s1,length(s1),1);
h:=1;
for i:=1 to length(s1)do
begin
for j:=i+1 to length(s1)do
    if s1[j]=s1[i] then begin delete(s1,j,1);dec(j);end;
end;
while 1<>0 do
      begin
      if h>length(s1) then break;
      while (s1[h]='A')or(s1[h]='E')or(s1[h]='I')or(s1[h]='O')or(s1[h]='U') do
            begin
 	    delete(s1,h,1);
            end;
      while s1[h]=s1[h+1] do
            begin
            delete(s1,h+1,1);
            if h+1>length(s1) then break;
            end;
      while (s1[h]=' ')and((s1[h+1]='.')or(s1[h+1]=',')or(s1[h+1]='?')) do delete(s1,h,1);
      inc(h);
      end;

write(s1);
close(input);
close(output);
end.
