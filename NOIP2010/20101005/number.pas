var i,j,m,n,mini,minj,maxi,maxj,t:longint;
    c:char;
    a,suma,sumb:array[0..100,0..100]of longint;
    pd,mark:boolean;
begin
assign(input,'number.in');
reset(input);
assign(output,'number.out');
rewrite(output);
readln(m,n);
mini:=maxlongint; minj:=maxlongint; maxi:=0; maxj:=0;
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        read(c);
        a[i,j]:=ord(c)-ord('0');
        suma[i,j]:=suma[i,j-1]+a[i,j];
        sumb[j,i]:=sumb[j,i-1]+a[i,j];
        if (a[i,j]=1)and(((i=mini)and(j<minj))or(i<mini)) then begin mini:=i; minj:=j; end;
        if (a[i,j]=1)and(((i=maxi)and(j>maxj))or(i>maxi)) then begin maxi:=i; maxj:=j; end;
        end;
    readln;
    end;
if (minj=maxj) then writeln(1)                         // 1 
   else begin
        if (sumb[minj,maxi]-sumb[minj,mini-1]=maxi-mini+1)and
           (sumb[maxj,maxi]-sumb[maxj,mini-1]=maxi-mini+1)and
           (suma[mini,maxj]-suma[mini,minj-1]=maxj-minj+1)and
           (suma[maxi,maxj]-suma[maxi,minj-1]=maxj-minj+1) then
            begin
            pd:=true;
            for i:=mini+1 to maxi-1 do
                if (suma[i,maxj]-suma[i,minj-1]=maxj-minj+1)
                   and(sumb[minj+1,i]-sumb[minj+1,mini-1]<>i-mini+1) then
               begin
                 pd:=false; break;
               end;
            if pd=false then writeln(8) else writeln(0);
            close(input);
            close(output);
            halt;
            end;                                        // 0 8
        if (suma[mini,maxj]-suma[mini,minj-1]=maxj-minj+1)and
           (suma[maxi,maxj]-suma[maxi,minj-1]<>maxj-minj+1) then
          begin
           pd:=true;
           for i:=mini+1 to maxi-1 do
               begin
               if (suma[i,maxj]-suma[i,minj-1]=maxj-minj+1)and
                  (sumb[minj+1,i]-sumb[minj+1,mini-1]<>i-mini+1) then
                    begin
                    pd:=false;break;
                    end;
               end;
           if pd=true then
           begin
             writeln(7);
             close(input);close(output);halt;
           end;                                        // 7
          end;                          
        if (suma[mini,maxj]-suma[mini,minj-1]=maxj-minj+1)and
           (suma[maxi,maxj]-suma[maxi,minj-1]=maxj-minj+1)and
           (sumb[maxj,maxi]-sumb[maxj,mini-1]=maxi-mini+1) then
            begin
            t:=0;
            for i:=mini+1 to maxi-1 do
                if (suma[i,maxj]-suma[i,minj-1]=maxj-minj+1) then
                   begin
                   mark:=false;
                   for j:=minj to maxj do
                        if (sumb[j,i]-sumb[j,mini-1]<>i-mini+1) then
                           begin
                           mark:=true;
                           break;
                           end;
                   if mark=true then
                      begin
                      t:=i; break;
                      end;
                   end;
            if sumb[minj,t]-sumb[minj,mini-1]<>t-mini+1 then
              writeln(3)
            else
              writeln(9);
            close(input);
            close(output);
            halt;           
            end;                                      // 3 9
         if (sumb[minj,maxi]-sumb[minj,mini-1]=maxi-mini+1) then
               begin
               writeln(6);
               close(input);
               close(output);
               halt;
               end;                                   // 6
         if (sumb[maxj,maxi]-sumb[maxj,mini-1]=maxi-mini+1) then
               begin
               writeln(4);
               close(input);
               close(output);
               halt;
               end;                                   // 4
         mark:=true;
         for i:=mini to maxi do
            begin
            if sumb[maxj,i]-sumb[maxj,mini-1]+sumb[minj,maxi]-sumb[minj,i]=
               maxi-mini+1 then
               begin
               mark:=false;break;
               end;
            end;
         if mark=false then writeln(2) else writeln(5);   // 2 5
        end;

close(input);
close(output);
end.
