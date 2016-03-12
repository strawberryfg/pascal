{
ID: xiaweiy1
PROG: packrec
LANG: PASCAL
}
var i,tot,min,p:longint;
    a:array[1..4,1..2]of longint;
    t,y:array[1..4]of longint;
    la,lb:array[1..100]of longint;
procedure work1(dep:longint);
var sum,max,i,j:longint;
    pd:boolean;
begin
if dep>4 then begin
              sum:=0;   max:=0;
              for i:=1 to 4 do
                  begin
                  sum:=sum+a[i,t[i]];
                  if a[i,3-t[i]]>max then max:=a[i,3-t[i]];
                  end;
              if sum>max then begin sum:=sum+max;max:=sum-max;sum:=sum-max;end;
              if sum*max<min then begin min:=sum*max;
                                        fillchar(la,sizeof(la),0);
                                        fillchar(lb,sizeof(lb),0);
                                        tot:=1;
                                        la[1]:=sum; lb[1]:=max;
                                  end
                             else if sum*max=min then
                                     begin
                                     pd:=true;
                                     for j:=1 to tot do if sum=la[j] then begin pd:=false;break;end;
                                     if pd=true then begin inc(tot);la[tot]:=sum;lb[tot]:=max; end;
                                     end;
              end
         else for i:=1 to 2 do
                  begin
                  t[dep]:=i;
                  work1(dep+1);
                  end;
end;


procedure work2(dep:longint);
var max,sum,m,k,i,j:longint;
    pd:boolean;
begin
sum:=0;
max:=0;
if p=dep then work2(dep+1);
if dep>4 then
   begin
   for i:=1 to 4 do if p<>i then
                       begin
                       sum:=sum+a[i,t[i]];
                       if a[i,3-t[i]]>max then max:=a[i,3-t[i]];
                       end;
   m:=sum; k:=max;
   for i:=1 to 2 do
       begin
       max:=max+a[p,3-i];
       if sum<a[p,i] then sum:=a[p,i];
       if sum>max then begin sum:=sum+max;max:=sum-max;sum:=sum-max;end;
       if sum*max<min then begin min:=sum*max;
                           fillchar(la,sizeof(la),0);
                           fillchar(lb,sizeof(lb),0);
                           tot:=1;
                           la[1]:=sum; lb[1]:=max
                           end
                      else if sum*max=min then
                              begin
                              pd:=true;
                              for j:=1 to tot do if sum=la[j] then begin pd:=false;break; end;
                              if pd=true then begin inc(tot);la[tot]:=sum;lb[tot]:=max; end;
                              end;
      sum:=m;max:=k;
      end;
   end
   else
for i:=1 to 2 do
    if p<>dep then begin t[dep]:=i; work2(dep+1); end;
end;


procedure pro(dep:longint);
var i,j,k,sum,max:longint;
    pd:boolean;
begin
if dep>4 then begin
              k:=0; sum:=0; max:=0;
              k:=y[1]; sum:=a[k,t[k]];
              k:=y[2]; sum:=sum+a[k,t[k]];
              k:=y[4]; k:=a[k,t[k]];
              if a[y[3],t[y[3]]]>sum then sum:=a[y[3],t[y[3]]];
              sum:=sum+k;
              k:=y[1]; max:=a[k,3-t[k]];
              k:=y[2]; if a[k,3-t[k]]>max then max:=a[k,3-t[k]];
              k:=y[3]; max:=max+a[k,3-t[k]];
              if a[y[4],3-t[y[4]]]>max then max:=a[y[4],3-t[y[4]]];
              if sum>max then begin sum:=sum+max;max:=sum-max;sum:=sum-max;end;
              if sum*max<min then begin min:=sum*max;
                            {if min=128 then begin
                                          for i:=1 to 4 do write(y[i],' ');
                                          writeln;
                                          for i:=1 to 4 do write(t[i],' ');
                                          end;}
                           fillchar(la,sizeof(la),0);
                           fillchar(lb,sizeof(lb),0);
                           tot:=1;
                           la[1]:=sum; lb[1]:=max
                           end
                      else if sum*max=min then
                              begin
                              pd:=true;
                              for j:=1 to tot do if sum=la[j] then begin pd:=false;break; end;
                              if pd=true then begin inc(tot);la[tot]:=sum;lb[tot]:=max; end;
                              end;
              end
         else for i:=1 to 2 do begin t[dep]:=i;pro(dep+1); end;
end;


procedure work3(dep:longint);
var k,i:longint;
begin
if dep>4 then begin
              pro(1);
              end
         else begin
              for i:=1 to 4 do
                  if y[i]=0 then
                     begin
                     y[i]:=dep;
                     work3(dep+1);
                     y[i]:=0;
                     end;
              end;
end;


procedure pro2(dep:longint);
var i,j,k,sum,max:longint;
    pd:boolean;
begin
if dep>4 then begin
              k:=0; sum:=0; max:=0;
              k:=y[1]; sum:=a[k,t[k]];
              k:=y[2]; if a[k,t[k]]>sum then sum:=a[k,t[k]];
              k:=y[3]; sum:=sum+a[k,t[k]];
              k:=y[4]; sum:=sum+a[k,t[k]];
              k:=y[1]; max:=a[k,3-t[k]];
              k:=y[2]; max:=max+a[k,3-t[k]];
              k:=y[3]; if a[k,3-t[k]]>max then max:=a[k,3-t[k]];
              if a[y[4],3-t[y[4]]]>max then max:=a[y[4],3-t[y[4]]];
              if sum>max then begin sum:=sum+max;max:=sum-max;sum:=sum-max; end;
              if sum*max<min then begin min:=sum*max;
                           fillchar(la,sizeof(la),0);
                           fillchar(lb,sizeof(lb),0);
                           tot:=1;
                           la[1]:=sum; lb[1]:=max
                           end
                      else if sum*max=min then
                              begin
                              pd:=true;
                              for j:=1 to tot do if sum=la[j] then begin pd:=false;break; end;
                              if pd=true then begin inc(tot);la[tot]:=sum;lb[tot]:=max; end;
                              end;
              end
         else for i:=1 to 2 do begin t[dep]:=i;pro2(dep+1); end;
end;


procedure work4(dep:longint);
var i:longint;
begin
if dep>4 then begin
              pro2(1);
              end
         else begin
              for i:=1 to 4 do
                  if y[i]=0 then
                     begin
                     y[i]:=dep;
                     work4(dep+1);
                     y[i]:=0;
                     end;
              end;
end;


procedure pro3(dep:longint);
var i,j,k,sum,max,t1,t2,k1,k2,k3,k4:longint;
    pd:boolean;
begin
if dep>4 then begin
              k:=0; sum:=0; max:=0; t1:=0; t2:=0;
              k1:=y[1]; k2:=y[2]; k3:=y[3]; k4:=y[4];
              if (a[k2,t[k2]]+a[k4,t[k4]]-a[k1,t[k1]]<a[k3,t[k3]]) then exit;
              if (a[k2,3-t[k2]]>a[k4,3-t[k4]])and(a[k3,t[k3]]>a[k4,t[k4]]) then exit;
              if (a[k1,t[k1]]>a[k2,t[k2]])and(a[k4,3-t[k4]]>a[k2,3-t[k2]]) then exit;
              sum:=a[k2,t[k2]]+a[k4,t[k4]];
              max:=a[k1,3-t[k1]]+a[k2,3-t[k2]];
              t2:=a[k3,3-t[k3]]+a[k4,3-t[k4]];
              if t2>max then max:=t2;
              if sum>max then begin sum:=sum+max;max:=sum-max;sum:=sum-max;end;
              if sum*max<min then begin min:=sum*max;
                           fillchar(la,sizeof(la),0);
                           fillchar(lb,sizeof(lb),0);
                           tot:=1;
                           la[1]:=sum; lb[1]:=max
                           end
                      else if sum*max=min then
                              begin
                              pd:=true;
                              for j:=1 to tot do if sum=la[j] then begin pd:=false;break; end;
                              if pd=true then begin inc(tot);la[tot]:=sum;lb[tot]:=max; end;
                              end;
              end
         else for i:=1 to 2 do begin t[dep]:=i;pro3(dep+1); end;
end;


procedure work5(dep:longint);
var i:longint;
begin
if dep>4 then begin
              pro3(1);
              end
         else begin
              for i:=1 to 4 do
                  if y[i]=0 then
                     begin
                     y[i]:=dep;
                     work5(dep+1);
                     y[i]:=0;
                     end;
              end;
end;


procedure sort;
var i,j:longint;
begin
for i:=1 to tot-1 do
    for j:=i+1 to tot do
        begin
        if la[i]>la[j] then
           begin
           la[i]:=la[i]+la[j];la[j]:=la[i]-la[j];la[i]:=la[i]-la[j];
           lb[i]:=lb[i]+lb[j];lb[j]:=lb[i]-lb[j];lb[i]:=lb[i]-lb[j];
           end;
        end;
writeln(min);
for i:=1 to tot do
    writeln(la[i],' ',lb[i]);
end;


begin
assign(input,'packrec.in');
reset(input);
assign(output,'packrec.out');
rewrite(output);
min:=maxlongint;
for i:=1 to 4 do
    begin
    readln(a[i,1],a[i,2]);
    if a[i,1]>a[i,2] then begin a[i,1]:=a[i,1]+a[i,2];
                                a[i,2]:=a[i,1]-a[i,2];
                                a[i,1]:=a[i,1]-a[i,2];
                          end;
    end;
work1(1);
{writeln(min);}
for i:=1 to 4 do
    begin
    fillchar(t,sizeof(t),0);
    p:=i;
    work2(1);
    end;
{writeln(min);}
fillchar(t,sizeof(t),0);
work3(1);
{writeln(min);}
fillchar(t,sizeof(t),0); fillchar(y,sizeof(y),0);
work4(1);
{writeln(min);}
fillchar(t,sizeof(t),0); fillchar(y,sizeof(y),0);
work5(1);
{writeln(min);}
sort;
close(input);
close(output);
end.
