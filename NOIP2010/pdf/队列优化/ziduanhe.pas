var n,m,i,t,max,j,len,left,right,mid:longint;
    a,sum,pos,ori,f:array[0..1000000]of longint;
    exist:array[0..1000000]of boolean;
begin
assign(input,'ziduanhe.in');
reset(input);
assign(output,'e:\wqf\ziduanhe1.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
   begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
   end;
f[0]:=0;
max:=-2147483648;
len:=1;
ori[1]:=0;
max:=a[1];
for i:=2 to n do
    begin
    if i-m-1>0 then
       begin
       if exist[i-m-1]=true then
          begin
          for j:=pos[i-m-1] to len-1 do
              begin
              f[j]:=f[j+1];
              ori[j]:=ori[j+1];
              pos[ori[j+1]]:=j;
              end;
          exist[i-m-1]:=false;
          ori[len]:=0;
          f[len]:=0;
          dec(len);
          end;
       end;
    if sum[i-1]>=f[len] then
       begin
       inc(len);
       f[len]:=sum[i-1];
       pos[i-1]:=len;  // bianhaowei i de pos[i] zai f array zhong de position
       ori[len]:=i-1;  //yuanbenzai  shuzuzhongdeweizhi
       exist[i-1]:=true;
       end
    else
       begin
       left:=1; right:=len;
       while right-left>1 do
         begin
         mid:=(left+right)div 2;
         if sum[i-1]>f[mid] then left:=mid+1 else right:=mid-1;
         end;
       if sum[i-1]>f[left] then
          begin
          for j:=left+1 to len do
              begin
              exist[ori[j]]:=false;
              pos[ori[j]]:=0;
              ori[j]:=0;
              f[j]:=0;
              end;
          f[left+1]:=sum[i-1];
          exist[i-1]:=true;
          ori[left+1]:=i-1;
          pos[i-1]:=left+1;
          len:=left+1;
          end
       else
          begin
          for j:=left to len do
              begin
              exist[ori[j]]:=false;
              pos[ori[j]]:=0;
              ori[j]:=0;
              f[j]:=0;
              end;
          f[left]:=sum[i-1];
          exist[i-1]:=true;
          ori[left]:=i-1;
          pos[i-1]:=left;
          len:=left;
          end;
       end;
    if sum[i]-f[1]>max then max:=sum[i]-f[1];
    end;
writeln(max);
close(input);
close(output);
end.
