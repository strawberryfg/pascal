var n,i,s,sum,now,num,left,right,mid:longint;
    a:array[1..21000]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
begin

readln(n,s);
for i:=1 to n do
    begin
    readln(a[i]);
    end;
sort(1,n);
sum:=0;
for i:=1 to n do
    begin
    if a[i]>s then break;
    now:=s-a[i];
    left:=i+1; right:=n;
    while left<right-1 do
       begin
       mid:=(left+right) div 2;
       if a[mid]<=now then left:=mid else right:=mid;
       end;
    if left>=right then num:=maxlongint
       else
       begin
       if a[right]<=now then num:=right
                        else begin
                             if a[left]<=now then num:=left
                                else num:=maxlongint;
                             end;
       end;
    if num<>maxlongint then sum:=sum+num-i;
    end;
writeln(sum);

end.

