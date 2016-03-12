var r,d,s,i,x,y,head,tail,t,k,step,cnt:longint;
    num,now,opt:array[1..10000]of longint;
    a:array[1..10000,1..10]of longint;
    app,door,but:array[1..10,0..10]of longint;
    hash:array[0..2000,1..10]of longint;
    pd:boolean;
function gettwo(i,x:longint):longint;
var kk:longint;
begin
kk:=r+1-x;
if a[i,x]=0 then
   gettwo:=num[i]+1 shl (kk-1)
else
   gettwo:=num[i]-1 shl (kk-1);
end;
function check(i:longint):boolean;
begin
if (num[i]=1)and(now[i]=r) then exit(true) else exit(false);
end;
begin
assign(input,'villa.in');
reset(input);
assign(output,'villa.out');
rewrite(output);
readln(r,d,s);
for i:=1 to d do
    begin
    readln(x,y);
    if (app[x,y]=0)and(app[y,x]=0) then
        begin
        app[x,y]:=1; app[y,x]:=1;
        {link[x,y]:=1;
        link[y,x]:=1;   }
        cnt:=door[x,0]+1;
        door[x,cnt]:=y;
        door[x,0]:=cnt;
        cnt:=door[y,0]+1;
        door[y,cnt]:=x;
        door[y,0]:=cnt;
        end;
    end;
fillchar(app,sizeof(app),0);
for i:=1 to s do
    begin
    readln(x,y);
    if (app[x,y]=0) then
        begin
        app[x,y]:=1;
        {control[x,y]:=1;}
        cnt:=but[x,0]+1;
        but[x,cnt]:=y;
        but[x,0]:=cnt;
        end;
    end;
tail:=1; head:=1; num[1]:=1 shl (r-1); hash[num[1],1]:=1; now[1]:=1;
a[1,1]:=1;
pd:=false;
while tail<=head do
  begin
  t:=now[tail];
  for i:=1 to door[t,0] do
      begin
      x:=door[t,i];
      if a[tail,x]=1 then
         begin
         if hash[num[tail],x]=0 then
            begin
            hash[num[tail],x]:=1;
            inc(head);
            num[head]:=num[tail];
            a[head]:=a[tail];
            now[head]:=x;
            opt[head]:=opt[tail]+1;
            if check(head) then
               begin
               pd:=true;
               step:=opt[head];
               break;
               end;
            end;
         end;
      end;
  if pd=true then break;
  for i:=1 to but[t,0] do
      begin
      k:=gettwo(tail,but[t,i]);
      if hash[k,t]=0 then
         begin
         hash[k,t]:=1;
         inc(head);
         num[head]:=k;
         a[head]:=a[tail];
         a[head,but[t,i]]:=1-a[head,but[t,i]];
         now[head]:=now[tail];
         opt[head]:=opt[tail]+1;
         if check(head) then
            begin
            pd:=true;
            step:=opt[head];
            break;
            end;
         end;
      end;
  if pd=true then break;
  inc(tail);
  end;
if pd=false then
   writeln('Poor Mr. Black! No sleep tonight!')
else writeln('Mr. Black needs ',step,' steps.');
close(input);
close(output);
end.
