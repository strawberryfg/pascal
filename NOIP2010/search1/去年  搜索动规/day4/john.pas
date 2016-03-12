var n,i,now:longint;
    pd:boolean;
    need,be,en,t:array[1..30200]of longint;
    procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=t[(l+r) div 2];
         repeat
           while t[i]<x do
            inc(i);
           while x<t[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=t[i];
                t[i]:=t[j];
                t[j]:=y;
                y:=be[i];
                be[i]:=be[j];
                be[j]:=y;
                y:=en[i];
                en[i]:=en[j];
                en[j]:=y;
                y:=need[i];
                need[i]:=need[j];
                need[j]:=y;
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
assign(input,'john.in');
reset(input);
assign(output,'john.out');
rewrite(output);
readln(n);
while n<>0 do
 begin
 fillchar(be,sizeof(t),0);
 fillchar(en,sizeof(en),0);
 fillchar(t,sizeof(t),0);
 fillchar(need,sizeof(need),0);
 for i:=1 to n do
     begin
     readln(be[i],en[i]);
     need[i]:=(en[i]-be[i])div 2+1;
     t[i]:=be[i]+en[i];
     end;
 sort(1,n);
 now:=be[1]+need[1];
 pd:=true;
 for i:=2 to n do
     begin
     if now<be[i] then now:=be[i];
     now:=now+need[i];
     if now>en[i] then begin pd:=false;break; end;
     end;
 if not pd then writeln('NO') else writeln('YES');
 readln(n);
 end;
close(input);
close(output);
end.