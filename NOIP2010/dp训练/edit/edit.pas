var n,la,lb,t,res1,res2,res3,i,j:longint;
    a,b:string;
    f:array[0..255,0..255]of longint;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
begin
assign(input,'edit.in');
reset(input);
assign(output,'edit.out');
rewrite(output);
readln(n);
for t:=1 to n do
    begin
    readln(a);
    readln(b);
    la:=length(a); lb:=length(b);
    fillchar(f,sizeof(f),0);
    for i:=1 to lb do f[0,i]:=i;
    for i:=1 to la do f[i,0]:=i;
    for i:=1 to la do
       begin
       for j:=1 to lb do
           begin
           if (i>=1)and(j>=1) then
               begin
               if a[i]<>b[j] then res1:=f[i-1,j-1]+1
                             else res1:=f[i-1,j-1];
               end
           else res1:=maxlongint;
           if (i>=1) then res2:=f[i-1,j]+1 else res2:=maxlongint;
           if (j>=1) then res3:=f[i,j-1]+1 else res3:=maxlongint;
           f[i,j]:=min(res1,res2);
           f[i,j]:=min(f[i,j],res3);
           end;
       end;
    writeln(f[la,lb]);
    end;

close(input);
close(output);
end.