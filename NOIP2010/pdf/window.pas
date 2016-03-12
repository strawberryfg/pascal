var n,k,t,i,j,len,left,right,mid:longint;
    a,f,now,num:array[1..100000]of longint;
    exist:array[1..100000]of boolean;
begin
assign(input,'window.in');
reset(input);
assign(output,'window.out');
rewrite(output);
readln(n,k);
for i:=1 to n do begin read(a[i]);exist[i]:=true; end;
f[1]:=a[1]; len:=1; now[1]:=1;   num[1]:=1;
for i:=2 to k do
    begin
    if a[i]>f[len] then begin inc(len);f[len]:=a[i];now[i]:=len;num[len]:=i; end
       else begin
            left:=1; right:=len;
            while left<right do
              begin
              mid:=(left+right)div 2;
              if a[i]>f[mid] then left:=mid+1
                 else right:=mid-1;
              end;
            if a[i]<f[left] then
               begin
               f[left]:=a[i];
               num[i]:=left;

               for j:=left to len do
                   begin
                   if j<>left then f[j]:=0;
                   exist[now[j]]:=false;
                   end;
               now[left]:=i;
               //exist[now[left]]:=true;
               len:=left;
               end
            else
               begin
               f[left+1]:=a[i];
               num[i]:=left+1;

               for j:=left+1 to len do
                   begin
                   if j<>left+1 then f[j]:=0;
                   exist[now[j]]:=false;
                   end;
                now[left+1]:=i;
               //exist[now[left+1]]:=true;
               len:=left+1;
               end;
            end;
    end;
writeln(1,' min:',f[1]);
for i:=1 to n-k do
    begin
    //t:=num[i];
    if exist[i]=true then
       begin
       exist[i]:=false;
       if num[i]<>0 then
          begin
          for j:=num[i] to len-1 do
             f[j]:=f[j+1];
          f[len]:=0; dec(len);
          end;
       end;
    if a[i+k]>f[len] then begin inc(len);f[len]:=a[i+k];now[len]:=i+k;num[i+k]:=len; end
    else
    begin
    left:=1; right:=len;
    while left<right do
      begin
      mid:=(left+right)div 2;
      if a[i+k]>f[mid] then left:=mid+1
         else right:=mid-1;
      end;
    if a[i+k]<f[left] then
       begin
       f[left]:=a[i+k];

       num[i+k]:=left;
       for j:=left to len do
           begin
           if j<>left then f[j]:=0;
           exist[now[j]]:=false;
           end;
       now[left]:=i+k;
       len:=left;
       end
    else
       begin
       f[left+1]:=a[i+k];

       num[i+k]:=left+1;
       for j:=left+1 to len do
           begin
           if j<>left+1 then f[j]:=0;
           exist[now[j]]:=false;
           end;
       now[left+1]:=i+k;
       len:=left+1;
       end;
    end;
    writeln(i+1,' min:',f[1]);
    end;
close(input);
close(output);
end.
