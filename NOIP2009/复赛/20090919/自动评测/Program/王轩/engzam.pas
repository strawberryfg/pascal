const c:array['a'..'z']of longint=(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
type node=record
     dd:array[1..26]of longint;
     pd:boolean;
     ci:longint;
     end;
var a:array[1..500000]of node;
    i,n,m,t,tp,tk,mubiao,sum:longint;
    s,ts:string;

function zhuan(s:string):longint;
var i,t:longint;
begin
t:=0;
for i:=1 to length(s) do
    t:=t*10+ord(s[i])-48;
zhuan:=t;
end;


procedure insert(s:string;kk:longint);
var i,temp,k:longint;
begin
temp:=c[s[1]];
for i:=2 to length(s) do
    begin
    k:=c[s[i]];
    if a[temp].dd[k]<>0 then
       temp:=a[temp].dd[k]
       else
       begin
       inc(t);
       a[temp].dd[k]:=t;
       temp:=t;
       end;
    end;
a[temp].pd:=true;
a[temp].ci:=kk;
end;

procedure search(temp:longint);
var i:longint;
begin
if a[temp].pd=true then
   if a[temp].ci>=mubiao then inc(sum);
for i:=1 to 26 do
    if a[temp].dd[i]<>0 then
       search(a[temp].dd[i]);
end;


procedure find(s:string;kk:longint);
var i,temp,k:longint;
begin
temp:=c[s[1]];
for i:=2 to length(s) do
    begin
    k:=c[s[i]];
    if a[temp].dd[k]<>0 then
       temp:=a[temp].dd[k]
       else
       exit;
    end;
mubiao:=kk;
search(temp);
end;

begin
assign(input,'engzam.in');
assign(output,'engzam.out');
reset(input);
rewrite(output);
readln(n,m);
t:=26;
for i:=1 to n do
    begin
    readln(s);
    tp:=pos(' ',s);
    ts:=copy(s,1,tp-1);
    delete(s,1,tp);
    tk:=zhuan(s);
    insert(ts,tk);
    end;
for i:=1 to m do
    begin
    sum:=0;
    readln(s);
    tp:=pos(' ',s);
    ts:=copy(s,1,tp-1);
    delete(s,1,tp);
    tk:=zhuan(s);
    find(ts,tk);
    writeln(sum);
    end;
close(input);
close(output);
end.
