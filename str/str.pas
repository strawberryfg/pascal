var s,t,stt,a,b,tmp:string;
    i,j,k,n,p,min,old,ne:longint;
    st,en,res:array[1..7500]of string;
    fr:array[1..7500]of longint;
{procedure print(n:longint);
var i:longint;
begin
for i:=1 to n do writeln(res[i]);
end;}
function pd(n:longint;str:string):boolean;
var i:longint;
begin
pd:=true;
for i:=1 to n do if str=res[i] then exit(false);
end;
begin
assign(input,'str.in');
reset(input);
assign(output,'str.out');
rewrite(output);
readln(s);
i:=pos(' ',s);
a:=copy(s,1,i-1);
delete(s,1,i);
b:=s;
readln(n);
for i:=1 to n do
    begin
    readln(s);
    j:=pos(' ',s);
    st[i]:=copy(s,1,j-1);
    delete(s,1,j);
    en[i]:=s;
    end;
old:=1;
ne:=1;
res[1]:=a;
min:=maxlongint;
while (old<=ne) do
     begin
     for i:=1 to n do
         begin
         if fr[old]>=10 then break;
         j:=pos(st[i],res[old]);     tmp:=res[old];
         while j<>0 do
         begin
            t:=copy(res[old],1,j-1);
            t:=t+en[i];
            p:=j+length(st[i]);
            stt:=copy(res[old],p,length(res[old])+1-p);
            t:=t+stt;
            if pd(ne,t) then
                begin
                inc(ne);
                fr[ne]:=fr[old]+1;
                res[ne]:=t;
                if (res[ne]=b)and(fr[ne]<min) then begin {print(ne);}min:=fr[ne];writeln(min);close(input);close(output);halt; end;
                end;
            tmp[j]:=' ';
            j:=pos(st[i],tmp);
         end;
         end;
     inc(old);
     end;
if min=maxlongint then writeln('NO ANSWER');
close(input);
close(output);
end.
