var s,ts:string;
    find1,find2,find3,sum,i,j,k,t,t1,t2:longint;
    f,fu,fum:array[1..51,1..51]of longint;
    a,opt:array[1..51]of longint;
begin
assign(input,'spy.in');
reset(input);
assign(output,'spy.out');
rewrite(output);
readln(s);
repeat
begin
find1:=pos('+',s);
find2:=pos('-',s);
find3:=pos('*',s);
if (find1<>0)and((find1<find2)and(find2<>0)or(find2=0))and((find1<find3)and(find3<>0)or(find3=0)) then
   begin
   inc(sum);
   opt[sum]:=1;
   ts:=copy(s,1,find1-1);
   val(ts,a[sum]);
   if a[sum]>0 then f[sum,sum]:=a[sum] else fu[sum,sum]:=a[sum];
   delete(s,1,find1);
   end
else if (find2<>0)and((find2<find1)and(find1<>0)or(find1=0))and((find2<find3)and(find3<>0)or(find3=0)) then
        begin
        inc(sum);
        opt[sum]:=2;
        ts:=copy(s,1,find2-1);
        val(ts,a[sum]);
        delete(s,1,find2);
        if a[sum]>0 then f[sum,sum]:=a[sum] else fu[sum,sum]:=a[sum];
        end
     else if (find3<>0)and((find1<>0)and(find3<find1)or(find1=0))and((find3<find2)and(find2<>0)or(find2=0)) then
             begin
             inc(sum);
             opt[sum]:=3;
             ts:=copy(s,1,find3-1);
             val(ts,a[sum]);
             delete(s,1,find3);
             if a[sum]>0 then f[sum,sum]:=a[sum] else fu[sum,sum]:=a[sum];
             end;
end;
until (find1=0)and(find2=0)and(find3=0);
if s<>'' then
   begin
   inc(sum);
   val(s,a[sum]);
   f[sum,sum]:=a[sum];
   end;
for i:=2 to sum do
    for j:=1 to sum+1-i do
        begin
        fum[j,j+i-1]:=-maxlongint;
        f[j,j+i-1]:=-maxlongint;
        fu[j,j+i-1]:=0;
        t:=0; t1:=0; t2:=0;
        for k:=j to j+i-2 do
             begin
             {if opt[k]=1 then t:=f[j,k]+f[k+1,j+i-1]
                else if opt[k]=2 then t:=f[j,k]-f[k+1,j+i-1]
                     else t:=f[j,k]*f[k+1,j+i-1];
             if t>f[j,j+i-1] then f[j,j+i-1]:=t;}
             if opt[k]=1 then
                         begin
                         t:=f[j,k]+f[k+1,j+i-1];               {f,f}
                         if fu[j,k]*fu[k+1,j+i-1]<>0 then      {fu,fu}
                            t1:=fu[j,k]+fu[k+1,j+i-1];
                         if fu[j,k]<>0 then t2:=fu[j,k]+f[k+1,j+i-1];    {fu,f}
                         if (t2<0)and(t2<t1) then t1:=t2;
                         if fu[k+1,j+i-1]<>0 then t2:=f[j,k]+fu[k+1,j+i-1];    {f,fu}
                         if (t2<0)and(t2<t1) then t1:=t2;
                         end
                else if opt[k]=2 then
                        begin
                        t:=f[j,k]-f[k+1,j+i-1];                   {f,f}
                        if t<0 then t1:=t;
                        if fu[k+1,j+i-1]<>0 then t:=f[j,k]-fu[k+1,j+i-1];   {f,fu}
                        if fu[j,k]<>0 then t1:=fu[j,k]-f[k+1,j+i-1];        {fu,f}
                        if (fu[k+1,j+i-1]*fu[j,k]<>0) then t1:=fu[j,k]-fu[k+1,j+i-1]; {fu,fu}
                        end
                     else begin
                          if fu[j,k]*fu[k+1,j+i-1]<>0 then t:=fu[j,k]*fu[k+1,j+i-1];  {fu,fu}
                          t1:=f[j,k]*f[k+1,j+i-1];                              {f,f}
                          if t1>t then t:=t1;
                          if fu[j,k]<>0 then t1:=fu[j,k]*f[k+1,j+i-1];  {fu,f}
                          t2:=0;
                          if t1<t2 then t2:=t1;
                          if fu[k+1,j+i-1]<>0 then t1:=f[j,k]*fu[k+1,j+i-1];  {f,fu}
                          if t1<t2 then t2:=t1;
                          t1:=t2;
                          end;
             if t>f[j,j+i-1] then f[j,j+i-1]:=t;
             if t1<fu[j,j+i-1] then fu[j,j+i-1]:=t1;
             if t1>fum[j,j+i-1] then fum[j,j+i-1]:=t1;
             end;
        end;
if f[1,sum]=-maxlongint then writeln(fum[1,sum]) else writeln(f[1,sum]);
close(input);
close(output);
end.
