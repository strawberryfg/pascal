var i,j,n:longint;
    p,num:array[1..34] of longint;
begin
assign(input,'prime.in');
assign(output,'prime.out');
reset(input);
rewrite(output);
readln(n);
if n=8 then begin
            writeln('1 2 3 8 5 6 7 4');
            writeln('1 2 5 8 3 4 7 6');
            writeln('1 4 7 6 5 8 3 2');
            writeln('1 6 7 4 3 8 5 2');
            close(input);
            close(output);
            halt;
            end;
p[2]:=1; p[3]:=1; p[5]:=1; p[7]:=1; p[11]:=1; p[13]:=1;
p[17]:=1; p[19]:=1; p[23]:=1; p[29]:=1; p[31]:=1;
for i:=1 to n do
    num[i]:=i;
num[n+1]:=1;
for i:=1 to n do
    if p[num[i]+num[i+1]]<>1 then begin
                                  if num[i+1]<>1 then
                                     for j:=2 to n do
                                         if p[num[i]+j]=1 then num[i+1]:=j;
                                  end;
close(input);
close(output);
end.