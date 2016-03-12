var  r,c,i,j,len,left,right,mid,max:longint;
     pd,tt:boolean;
     ts:char;
     a,sumx,sumy:array[0..400,0..400]of longint;
function ok(num:longint):boolean;
var i,j,m,n,p,q,s,t,u,v,k,l:longint;
    mark:boolean;
begin
for i:=1 to r+1-num do
    begin
    for j:=1 to c+1-num do
        begin
        m:=i; n:=j; p:=m; q:=j+num-1;
        s:=i+num-1; t:=j; u:=i+num-1; v:=t+num-1;
        mark:=true;
        for k:=1 to (num+1)div 2 do
            begin
            if (sumy[s,j+k-1]-sumy[m-1,j+k-1])<>(sumy[u,q+1-k]-sumy[p-1,q+1-k]) then
               begin mark:=false;break; end;
            if (sumx[i+k-1,q]-sumx[i+k-1,n-1])<>(sumx[s+1-k,q]-sumx[s+1-k,n-1]) then
               begin mark:=false;break; end;
            end;
        if mark then
           begin
           for k:=i to i+num-1 do
              begin
              for l:=j to j+num-1 do
                  begin
                  if a[k,l]<>a[2*i+num-k-1,2*j+num-l-1] then
                     begin
                     mark:=false;break;
                     end;

                  end;
              if not mark then break;
              end;
           end;
        if mark then break;
        end;
    if mark then break;
    end;
if mark then begin max:=num; exit(true);end else exit(false);
end;
begin
assign(input,'debug.in');
reset(input);
assign(output,'debug.out');
rewrite(output);
readln(r,c);
for i:=1 to r do
    begin
    for j:=1 to c do
        begin
        read(ts);
        if ts='0' then a[i,j]:=0 else a[i,j]:=1;
        sumx[i,j]:=sumx[i,j-1]+a[i,j];
        sumy[i,j]:=sumy[i-1,j]+a[i,j];
        end;
    readln;
    end;
len:=r; if c<len then len:=c;
left:=1; right:=len;
pd:=false;
max:=0;
for mid:=1 to len do
  tt:=ok(mid);
        if max=1 then max:=0;
        if max<>0 then writeln(max)
           else writeln(-1);
close(input);
close(output);
end.