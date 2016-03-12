//21:02; 21:52
var sa,sb,sc:string;
    ttt,n,i,p,q,r:longint;
    f,h:array[0..30,1..3]of longint;
    g,rep,trep,a,b,c:array[0..30]of longint;
    hash:array[0..30]of integer;
    pd:boolean;
procedure print;
var i:longint;
begin
for i:=0 to n-2 do write(rep[i],' ');
write(rep[n-1]);
writeln;
close(input);
close(output);
halt;
end;
function check(now:longint):boolean;
var i,j:longint;
begin
if (f[now,1]<0)or(f[now,2]<0)or(f[now,3]<0) then exit(false);
if (f[now,1]+f[now,2]+g[now+1])mod n<>f[now,3] then exit(false);
for i:=1  to 2 do
    begin
    for j:=i+1 to 3 do
        begin
        if (f[now,i]=f[now,j])and(h[now,i]<>h[now,j]) then exit(false);
        if (h[now,i]=h[now,j])and(f[now,i]<>f[now,j]) then exit(false);
        end;
    end;
g[now]:=(f[now,1]+f[now,2]+g[now+1])div n;
exit(true);
end;
procedure dfs(now:longint);
var i,j,k,num:longint;
begin
if now<=0 then
   begin
   pd:=true;
   print;

   end;
f[now,1]:=rep[a[now]]; f[now,2]:=rep[b[now]]; f[now,3]:=rep[c[now]];
p:=f[now,1]; q:=f[now,2]; r:=f[now,3];
h[now,1]:=a[now]; h[now,2]:=b[now]; h[now,3]:=c[now];
if (p=-1)and(q=-1)and(r=-1) then
   begin
   for i:=0 to n do
       begin
       if hash[i]=1 then continue;
       for j:=0 to n do
           begin
           if hash[j]=1 then continue;
           for k:=0 to n do
               begin
               if (i=4)and(j=2)and(k=1)and(now=5) then
                  ttt:=1;
               if hash[k]=1 then continue;
               f[now,1]:=i; f[now,2]:=j; f[now,3]:=k;
               if not check(now) then continue;
               rep[a[now]]:=i; rep[b[now]]:=j; rep[c[now]]:=k;
               hash[i]:=1; hash[j]:=1; hash[k]:=1;
               dfs(now-1);
               rep[a[now]]:=-1; rep[b[now]]:=-1; rep[c[now]]:=-1;
               hash[i]:=0; hash[j]:=0; hash[k]:=0;
               end;
           end;
       end;
   end
else if(p<>-1)and(q<>-1)and(r<>-1) then
       begin
       if not check(now) then exit
          else
            dfs(now-1);
       end
else if (p=-1)and(q<>-1)and(r<>-1) then     //?+b=c
       begin
       num:=r-(q+g[now+1])mod n;
         if num<0 then num:=n+num;
       f[now,1]:=num;
       if not check(now) then exit;
       hash[num]:=1;
       rep[a[now]]:=num;
       dfs(now-1);
       hash[num]:=0;
       rep[a[now]]:=-1;
       end
else if (p<>-1)and(q=-1)and(r<>-1) then        //a+?=c
        begin
       num:=r-(p+g[now+1])mod n;
       if num<0 then num:=n+num;
       f[now,2]:=num;
       if not check(now) then exit;
       hash[num]:=1;
       rep[b[now]]:=num;
       dfs(now-1);
       hash[num]:=0;
       rep[b[now]]:=-1;
        end
else if (p<>-1)and(q<>-1)and(r=-1) then      //a+b=?;
       begin
       num:=(p+q+g[now+1]);
         if num<0 then num:=n+num;
       f[now,3]:=num mod n;
       if not check(now) then exit;
       rep[c[now]]:=(num) mod n;
       hash[(num) mod n]:=1;
       if num>n then g[now]:=1;
       dfs(now-1);
       rep[c[now]]:=-1;
       hash[num mod n]:=0;
       if num>n then g[now]:=0;
       end
else if (p=-1)and(q=-1)and(r<>-1) then       //?+?=c;
      begin
   for i:=0 to n do
       begin
       if hash[i]=1 then continue;
       for j:=0 to n do
           begin
           if hash[j]=1 then continue;
               f[now,1]:=i; f[now,2]:=j;
               if not check(now) then continue;
               rep[a[now]]:=i; rep[b[now]]:=j;
               hash[i]:=1; hash[j]:=1;
               dfs(now-1);
               rep[a[now]]:=-1; rep[b[now]]:=-1;
               hash[i]:=0; hash[j]:=0;

           end;
       end;
      end
else if(p=-1)and(q<>-1)and(r=-1) then   //?+b=?;
       begin
       for i:=0 to n do
         begin
         if hash[i]=1 then continue;
         for j:=0 to n do
             begin
             if hash[j]=1 then continue;
               f[now,1]:=i; f[now,3]:=j;
               if not check(now) then continue;
               rep[a[now]]:=i; rep[c[now]]:=j;
               hash[i]:=1; hash[j]:=1;
               dfs(now-1);
               rep[a[now]]:=-1; rep[c[now]]:=-1;
               hash[i]:=0; hash[j]:=0;

           end;
         end;
       end
else if (p<>-1)and(q=-1)and(r=-1) then //a+?=?
        begin
       for i:=0 to n do
         begin
         if hash[i]=1 then continue;
         for j:=0 to n do
             begin
             if hash[j]=1 then continue;
               f[now,2]:=i; f[now,3]:=j;
               if not check(now) then continue;
               rep[b[now]]:=i; rep[c[now]]:=j;
               hash[i]:=1; hash[j]:=1;
               dfs(now-1);
               rep[b[now]]:=-1; rep[c[now]]:=-1;
               hash[i]:=0; hash[j]:=0;

              end;
         end;
        end;
end;
begin
assign(input,'alpha.in');
reset(input);
assign(output,'alpha.out');
rewrite(output);
readln(n);
readln(sa); readln(sb); readln(sc);
for i:=1 to n do a[i]:=ord(sa[i])-ord('A');
for i:=1 to n do b[i]:=ord(sb[i])-ord('A');
for i:=1 to n do c[i]:=ord(sc[i])-ord('A');
for i:=0 to n do rep[i]:=-1;
dfs(n);
close(input);
close(output);
end.
