var i,n,k,j,t,sum,tot,tt:longint;
    can,a,opt,res,delta,left,height,from:array[1..1010]of longint;
    pd:boolean;
begin
assign(input,'squares.in');
reset(input);
assign(output,'squares.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    read(a[i]);
    can[i]:=1;
    end;
height[1]:=a[1];
for i:=2 to n do
    begin
    from[i]:=i-1;
    t:=2*a[i];
    left[i]:=a[i];
    if t<=a[i-1] then
       begin
       opt[i]:=1;
       left[i]:=a[i]-(a[i-1]-2*a[i]);
       if left[i]<0 then can[i]:=0;
       height[i]:=2*a[i];
       height[i-1]:=a[i-1];
       end                           //opt1;
    else
       begin
       k:=i-1;
       pd:=false;
       while (k>=1)do
       begin
//        if can[k]=0 then begin dec(k);continue; end;
       if t<a[k] then
         begin
         opt[i]:=1;
         left[i]:=left[i]+a[i]-(a[k]-2*a[i]);
         from[i]:=k;
         if left[i]<0 then   for j:=k+1 to i do can[j]:=0;
         height[i]:=2*a[i];
         height[k]:=a[k];
         pd:=true;
         end
       else if a[i]=2*a[k] then
           begin
           opt[i]:=2;
           for j:=k to i-1 do can[j]:=0;      //opt2;
           left[i]:=left[i]+a[i];                //......
           break;
           end
        else if (a[i]>2*a[k])and(opt[k]>2) then      //opt4;
                begin
                sum:=0;
                for j:=k downto 1 do
                    begin
                    //if opt[j]<=2 then break;
                    sum:=sum+a[j]-delta[j+1];
                    if can[j]=0 then continue;
                    left[j]:=left[j]+height[i-1]-height[j];
                    if (a[i]>sum+left[j]) then
                        begin
                        if (opt[j]=1)and(height[i-1]<a[from[j]]) then begin pd:=true;break; end;
                        if opt[j]=1 then can[j]:=0
                           else {if (opt[j]=3)and(delta[j]<>0) then
                                   begin
                                   t:=left[j];
                                   if a[i]-a[j]<t then can[j]:=1 else can[j]:=0;
                                   end
                                else
                                   begin
                                   t:=left[j];
                                   if a[i]-a[j]<t then can[j]:=1 else can[j]:=0;
                                   end; }can[j]:=0;
                        end
                    else
                        begin
                        pd:=false; break;
                        end;
                    end;
                 if pd=false then
                 begin
                   opt[i]:=4;
                   left[i]:=left[i]+a[i];
                   pd:=true;
                 end
                 else pd:=false;
                end
             else
                begin
                if (a[k]<t)and(a[i]<=a[k]) then
                   begin
                   for j:=k+1 to i-1 do can[j]:=0;
                   opt[i]:=3;
                   delta[i]:=a[k]-a[i];
                   left[i]:=left[i]+a[i]-delta[i];
                   height[i]:=height[k]+a[i]-delta[i];
                   if(opt[k]=1) then
                     begin
                     tt:=a[from[k]]-2*a[k]-a[k];
                     tt:=tt-(a[i]-delta[i]);
                     if tt>0 then left[i]:=left[i]-1*tt;
                     end;
                   pd:=true;           //tiezhebian
                   end
                else if (a[k]<a[i])and(a[i]<2*a[k]) then
                        begin
                        for j:=k+1 to i-1 do can[j]:=0;
                        opt[i]:=3;     //opt3;  (shangmian)
                        height[i]:=height[k]+a[i];
                        if (opt[k]=1)and(a[i]-a[k]>left[k]) then can[k]:=0; //......
                        if (opt[k]=1)and(can[k]=0) then
                           begin
                           tt:=a[from[k]]-2*a[k]-a[k];
                           tt:=a[k]-tt;
                           tt:=a[i]-tt;
                           left[i]:=left[i]+left[i]-tt;
                           //a[i]:=left[i];
                           end;
                        pd:=true;
                        end;
                end;
        dec(k);
        if pd=true then break;
       end;
       end;
    end;
for i:=1 to n do
   if can[i]=1 then
     begin
     inc(tot);
     res[tot]:=i;
     end;
for i:=1 to tot-1 do write(res[i],' ');
write(res[tot]);
writeln;
close(input);
close(output);
end.
