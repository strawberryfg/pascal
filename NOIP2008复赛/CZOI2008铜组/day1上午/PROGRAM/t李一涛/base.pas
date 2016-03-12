var i,m,n1,n2,j1,j2,v,t,yes,l,x,total:longint;
    ch:char;
    num:string;
    a:array[2..36]of integer;
begin
     assign(input,'base.in');
     reset(input);
     assign(output,'base.out');
     rewrite(output);
     readln(n1,n2,j1,j2);
     total:=0;
     for i:=n1 to trunc(sqrt(n2)) do
     begin
       v:=sqr(i);
       for m:=j1 to j2 do
       begin
         num:='';
         while v<>0 do
           begin
           case v mod m of
           0: ch:='0';
           1: ch:='1';
           2: ch:='2';
           3: ch:='3';
           4: ch:='4';
           5: ch:='5';
           6: ch:='6';
           7: ch:='7';
           8: ch:='8';
           9: ch:='9';
           10: ch:='A';
           11: ch:='B';
           12: ch:='C';
           13: ch:='D';
           14: ch:='E';
           15: ch:='F';
           16: ch:='G';
           17: ch:='H';
           18: ch:='I';
           19: ch:='J';
           20: ch:='K';
           21: ch:='L';
           22: ch:='M';
           23: ch:='N';
           24: ch:='O';
           25: ch:='P';
           26: ch:='Q';
           27: ch:='R';
           28: ch:='S';
           29: ch:='T';
           30: ch:='U';
           31: ch:='V';
           32: ch:='W';
           33: ch:='X';
           34: ch:='Y';
           35: ch:='Z';
           end;
           num:=ch+num;
           v:=v div m
         end;
         l:=length(num); yes:=0;
         for x:=1 to (l+1)div 2 do
         begin
           if num[i]=num[l-i+1] then inc(yes);
         end;
         if yes=(l+1)div 2 then inc(a[m]);
       end;
       yes:=0;
       for x:=j1 to j2 do
       begin
         if a[x]=1 then inc(yes);
       end;
       if yes=1 then inc(total);
     end;
     writeln(total);
     close(input);
     close(output);
end.