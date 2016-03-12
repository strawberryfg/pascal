const
     maxn=2500;
var
     n1,n2,top,n,num,t,w,i:longint;
     a:array[1..maxn] of longint;
     x:char;
     p1,p2:boolean;
begin
     assign(input,'bus.in');
     assign(output,'bus.out');
     reset(input);
     rewrite(output);

     readln(n,top);
     for i:=1 to n do
         begin
         read(x);
         if x='H' then a[i]:=1;
         if x='J' then a[i]:=2;
         end;
     t:=1; w:=1; num:=1;
     while t<=n do
           begin
           p1:=false; p2:=false; n1:=0; n2:=0;
           for i:=w to t do
               begin
               if a[i]=1 then begin inc(n1);p1:=true;end;
               if a[i]=2 then begin inc(n2);p2:=true;end;
               end;
           if (p1)and(p2)and(abs(n1-n2)>top) then begin w:=i;inc(num);end;
           inc(t);
           end;
     writeln(num);

     close(input);
     close(output);
end.
