const maxn=5000;
var stock,f,num:array [1..maxn] of longint;
    ok:array[1..maxn] of boolean;
    i,j:longint;
    ans1,ans2,n:longint;
begin
   assign(input,'buylow.in');
   reset(input);
   assign(output,'buylow.out');
   rewrite(output);

   read(n);
   for i:=1 to n do read(stock[i]);
   for i:=1 to n do ok[i]:=true;
   ans1:=0;
   for i:=1 to n do
    begin
      f[i]:=1;
      num[i]:=1;
      for j:=1 to i-1 do
         begin
              if stock[j]=stock[i] then
                 ok[j]:=false;
              if (stock[j]>stock[i])and(ok[j]) then
                 if f[j]+1>f[i]
                    then begin
                              f[i]:=f[j]+1;
                              num[i]:=num[j];
                         end
                    else if f[j]+1=f[i] then
                            num[i]:=num[i]+num[j];
         end;
      if f[i]>ans1 then ans1:=f[i];
    end;

   ans2:=0;
   for i:=1 to n do
    if (f[i]=ans1)and(ok[i]) then
       ans2:=ans2+num[i];
   write(ans1,' ',ans2);
   close(input);close(output);
end.

