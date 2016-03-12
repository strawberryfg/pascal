type rec=record
     l,r,col:longint;
     end;
var m:array[1..100]of rec;
    ch:char;
    x,y,z,i,j,ans,range,t,k:longint;
    hash:array[1..100]of longint;
procedure lazytag(x:longint);
begin
if m[x].col>0 then
   begin
   m[x*2].col:=m[x].col;
   m[x*2+1].col:=m[x].col;
   m[x].col:=-1;
   end;
end;
procedure insert(f,t,knum,x:longint);
var mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   begin
   m[x].col:=knum;
   exit;
   end;
lazytag(x);
mid:=(m[x].l+m[x].r)div 2;
if f<=mid then insert(f,t,knum,x*2);
if t>mid then insert(f,t,knum,x*2+1);
end;
procedure count(f,t,x:longint);
var mid:longint;
begin
if m[x].col>0 then
   begin
   inc(hash[m[x].col]);
   exit;
   end;
mid:=(m[x].l+m[x].r)div 2;
if f<=mid then count(f,t,x*2);
if t>mid then count(f,t,x*2+1);
end;
procedure init(f,t,x:longint);
begin
m[x].l:=f;
m[x].r:=t;
if f=t then exit;
init(f,(f+t)div 2,x*2);
init((f+t) div 2+1,t,x*2+1);
end;
begin
assign(input,'colour.in');
reset(input);
assign(output,'colour.out');
rewrite(output);
readln(range,t,k);
init(1,range,1);
for i:=1 to k do
    begin
    read(ch);
    read(x,y);
    if ch='C' then read(z);
    readln;
    case ch of
    'C':begin
        insert(x,y,z,1);
        end;
    'P':begin
        fillchar(hash,sizeof(hash),0);
        count(x,y,1);
        ans:=0;

        for j:=1 to t do
            begin
            if hash[j]>0 then
               begin
               inc(ans);

               end;
            end;
        writeln(ans);
        end;
    end;
    end;
close(input);
close(output);
end.
