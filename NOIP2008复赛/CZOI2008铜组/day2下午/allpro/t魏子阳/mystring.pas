var s:string;
    i,j,num,max,maxn,min,minn:longint;
    str:array[1..500]of string;
begin
assign(input,'mystring.in');
assign(output,'mystring.out');
reset(input);rewrite(output);
readln(s);
i:=1;
num:=0;
while i<=length(s) do
      begin
      if s[i]<>' ' then begin
                        j:=i;
                        inc(num);
                        while (s[j]<>' ')and(j<=length(s)) do
                              begin
                              str[num]:=str[num]+s[j];
                              inc(j);
                              end;
                        i:=j;
 			end;
      inc(i);
      end;
max:=0;
maxn:=0;
min:=maxlongint;
minn:=0;
for i:=1 to num do
    begin
    if length(str[i])>max then begin max:=length(str[i]);maxn:=i;end;
    if length(str[i])<min then begin min:=length(str[i]);minn:=i;end;
    end;
writeln(str[maxn]);
writeln(str[minn]);
close(input);close(output);
end.
