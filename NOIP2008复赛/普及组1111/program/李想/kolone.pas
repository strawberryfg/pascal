var n1,n2,t,i,j,k,p:longint;
    str1,str2,s:string;
    sss:char;
function min(a,b:longint):longint;
  begin
  if a>b then min:=b
         else min:=a;
  end;
begin
readln(n1,n2);
readln(str1);
readln(str2);
readln(t);
k:=n1+n2;
p:=n1;
s:='                                                                      ';
for i:=1 to n1 do
    s[i]:=str1[n1-i+1];
for i:=1 to n2 do
    s[i+n1]:=str2[i];
for i:=1 to min(n1,n2) do
    for j:=1 to i do
        begin
        sss:=s[p];s[p]:=s[p+1];s[p+1]:=sss;
        if j<>i then p:=p+2
                else p:=p-2*(i-1);
        end;
for i:=min(n1,n2)+1 to t do
    if k mod 2<>0 then
        if i mod 2=0 then for i:=2 to n1+n2 do
                          begin
                          sss:=s[i];s[i]:=s[i+1];s[i+1]:=sss;
                          inc(i);
                          end
                     else for i:=1 to n1+n2-1 do
                          begin
                          sss:=s[i];s[i]:=s[i+1];s[i+1]:=sss;
                          inc(i);
                          end
                        else
        if i mod 2=0 then for i:=2 to n1+n2-1 do
                          begin
                          sss:=s[i];s[i]:=s[i+1];s[i+1]:=sss;
                          inc(i);
                          end
                     else for i:=1 to n1+n2 do
                          begin
                          sss:=s[i];s[i]:=s[i+1];s[i+1]:=sss;
                          inc(i);
                          end;
writeln(s);
end.
