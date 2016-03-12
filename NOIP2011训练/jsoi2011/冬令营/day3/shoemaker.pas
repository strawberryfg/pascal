var i,n,ans,last:longint;
    s,t:array[1..100]of longint;
    v:array[1..100]of extended;
procedure sort(l,r: longint);
      var
         i,j,y: longint;
         x,tmp:extended;
      begin
         i:=l;
         j:=r;
         x:=v[(l+r) div 2];
         repeat
           while v[i]<x do
            inc(i);
           while x<v[j] do
            dec(j);
           if not(i>j) then
             begin
                tmp:=v[i];
                v[i]:=v[j];
                v[j]:=tmp;
                y:=t[i];
                t[i]:=t[j];
                t[j]:=y;
                y:=s[i];
                s[i]:=s[j];
                s[j]:=y;
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
assign(input,'shoemaker.in');
reset(input);
assign(output,'shoemaker.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(t[i],s[i]);
    v[i]:=t[i]/s[i];
    end;
sort(1,n);
last:=t[1];
for i:=2 to n do
    begin
    ans:=ans+s[i]*last;
    inc(last,t[i]);
    end;
writeln(ans);
close(input);
close(output);
end.