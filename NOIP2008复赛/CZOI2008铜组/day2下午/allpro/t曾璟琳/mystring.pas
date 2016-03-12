var  s,str1:string;
     leng,i,max,min,k,p,q,w,e,r,j:longint;
     b:array[1..1000]of longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(s);
s:=s+' ';
i:=1;
max:=0;
min:=100000;
k:=i;
p:=0;
leng:=length(s);
while  i<=leng do
 begin
  if s[i]=' ' then  begin
                      str1:='';
                      for j:=k to i-1 do
                        str1:=str1+s[j];
                      inc(p);
                      b[p]:=length(str1);
                      if b[p]>max then begin max:=b[p];q:=k;w:=i-1;end;
                      if b[p]<min then begin min:=b[p];e:=k;r:=i-1;end;
                      k:=i+1;
                    end;
  inc(i);
 end;
for j:=q to w-1 do
 write(s[j]);
writeln(s[w]);
for j:=e to r-1 do
 write(s[j]);
writeln(s[r]);
close(input);
close(output);
end.
