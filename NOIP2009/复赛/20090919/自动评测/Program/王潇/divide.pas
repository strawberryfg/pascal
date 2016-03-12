Var n,k,c,i,j,sum,min:longint;
    a:array[1..10000]of longint;
    b:array[1..10000,1..2]of longint;
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
Begin
  assign(input,'divide.in');reset(input);
  assign(output,'divide.out');rewrite(output);
  readln(n,k,c);
  for i:=1 to n do
    read(a[i]);
  sort(1,n);
  min:=maxlongint;
  for i:=1 to n div k do
    b[i,1]:=a[i];
  for i:=1 to n div k do
    begin
      sum:=i*c;
      for j:=(n div i-1)*i+1 to (n div i-1)*i+i do
        b[j-(n div i-1)*i,2]:=a[j];
      for j:=n div i*i+1 to n do
        b[j-n div i*i+(n div i*i+i-n),2]:=a[j];
      for j:=1 to i do
        sum:=sum+(b[j,2]-b[j,1])*(b[j,2]-b[j,1]);
      if sum<min then min:=sum;
    end;
  writeln(min);
  close(output);
End.
