var
     h,m,s,hh,mm,ss,hhh,mmm,sss,i,n:longint;
     a,b,c:string;
begin
     assign(input,'natrij.in');
     assign(output,'natrij.out');
     reset(input);
     rewrite(output);

     readln(a);
     n:=1;
     for i:=1 to length(a) do
         if a[i]=':' then inc(n)
                     else begin
                          if n=1 then h:=h*10+ord(a[i])-48;
                          if n=2 then m:=m*10+ord(a[i])-48;
                          if n=3 then s:=s*10+ord(a[i])-48;
                          end;
     readln(a);
     n:=1;
     for i:=1 to length(a) do
         if a[i]=':' then inc(n)
                     else begin
                          if n=1 then hh:=hh*10+ord(a[i])-48;
                          if n=2 then mm:=mm*10+ord(a[i])-48;
                          if n=3 then ss:=ss*10+ord(a[i])-48;
                          end;
     {s}
     if ss>=s then sss:=ss-s
              else if mm>0 then begin
                                dec(mm);
                                ss:=ss+60;
                                sss:=ss-s;
                                end
                           else if hh>0 then begin
                                             dec(hh);
                                             mm:=59;
                                             ss:=ss+60;
                                             sss:=ss-s;
                                             end
                                        else begin
                                             hh:=23;
                                             mm:=59;
                                             ss:=ss+60;
                                             sss:=ss-s;
                                             end;
     {m}
     if mm>=m then mmm:=mm-m
              else if hh>0 then begin
                                dec(hh);
                                mm:=mm+60;
                                mmm:=mm-m;
                                end
                           else begin
                                hh:=23;
                                mm:=mm+60;
                                mmm:=mm-m;
                                end;
     {h}
     if hh>=h then hhh:=hh-h
             else begin
                  hh:=hh+24;
                  hhh:=hh-h;
                  end;
     if (hhh>9)and(mmm>9)and(sss>9) then writeln(hhh,':',mmm,':',sss)
        else begin
             a:='';
             while hhh>0 do
                   begin
                   a:=chr(hhh mod 10+48)+a;
                   hhh:=hhh div 10;
                   end;
             while mmm>0 do
                   begin
                   b:=chr(mmm mod 10+48)+b;
                   mmm:=mmm div 10;
                   end;
             while sss>0 do
                   begin
                   c:=chr(sss mod 10+48)+c;
                   sss:=sss div 10;
                   end;
             while length(a)<2 do
                   a:='0'+a;
             while length(b)<2 do
                   b:='0'+b;
             while length(c)<2 do
                   c:='0'+c;
             writeln(a,':',b,':',c)
             end;

     close(input);
     close(output);
end.
