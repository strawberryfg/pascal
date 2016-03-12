var  a:array[-1..500000,0..26] of integer;
     s:string;
     i,j,m,n,jj,l,qq,ji:longint;
     k:char;
procedure creat(ss:string;dep:longint);
var i,j:longint;
begin
if ss='' then
   begin
   a[dep,0]:=l;
   exit;
   end;
i:=ord(ss[1])-ord('a')+1;
if a[dep,i]=0 then
        begin
        inc(jj);
        a[dep,i]:=jj;
        delete(ss,1,1);
        creat(ss,jj);
        end
   else begin
        delete(ss,1,1);
        creat(ss,a[dep,i]);
        end;
end;
function chazhao(ss:string;dep:longint):longint;
var i,j:longint;
begin
if ss='' then
   begin
   chazhao:=dep;
   exit;
   end;
i:=ord(ss[1])-ord('a')+1;
delete(ss,1,1);
chazhao:=chazhao(ss,a[dep,i]);
end;
procedure doit(dep:longint);
var i:longint;
begin
if a[dep,0]>=l
   then inc(ji);
    for i:=1 to 26 do
            if a[dep,i]<>0 then doit(a[dep,i]);
end;
begin
assign(input,'engzam.in');
assign(output,'engzam.out');
reset(input);
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    s:='';
    read(k);
    for j:=1 to 20 do
    if k<>' ' then begin s:=s+k;read(k);end
              else break;
    readln(l);
    creat(s,-1);
    end;
for i:=1 to m do
    begin
    s:='';
    read(k);
    for j:=1 to 20 do
    if k<>' ' then begin s:=s+k;read(k);end
              else break;
    readln(l);
    qq:=chazhao(s,-1);
    ji:=0;
    doit(qq);
    writeln(ji);
    end;
close(input);
close(output);
end.
