var n,i,r,oo:longint;a,b,o:string;da:array[1..10]of integer;
procedure work(w,e,dep:integer);
begin
if (w=-1) or (e=-1) then begin da[dep]:=-1;exit;end;
if (w=1) and (e=1) then begin da[dep]:=1;exit;end;
if (w=0) or (e=0) then begin da[dep]:=0;exit;end;
end;
function pd(x,y:string):integer;
var g,j,lx,ly:longint;
    s:array[-1..10]of boolean;
begin
g:=1;
for j:=-1 to 10 do
    s[j]:=false;
lx:=length(x);
ly:=length(y);
for j:=1 to lx do
    begin
    s[ord(x[j])-48]:=true;
    end;
for j:=1 to ly do
    begin
    if s[ord(y[j])-48]=false then
       begin
       if g=0 then exit(-1);
       if (s[ord(y[j])-49]=true) then
          begin
          if (s[ord(y[j-1])-47]=true)or(s[ord(y[j+1])-47]=true) then
             g:=0;
          end;
       if (s[ord(y[j])-47]=true) then
          if (s[ord(y[j-1])-49]=true)or(s[ord(y[j+1])-49]=true) then
             g:=0;
       if g=1 then exit(-1);
       end;
    end;
if g=0 then exit(0);
if g=1 then exit(1);
end;
begin
assign(input,'friends.in');
assign(output,'friends.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(o);
    oo:=pos(' ',o);
    for r:=1 to oo-1 do
        a:=a+o[r];
    for r:=oo+1 to length(o) do
        b:=b+o[r];
    work(pd(a,b),pd(b,a),i);
    end;
for i:=1 to n do
    begin
    if da[i]=-1 then writeln('nothing');
    if da[i]=0 then writeln('almost friends');
    if da[i]=1 then writeln('friends');
    end;
close(input);
close(output);
end.
