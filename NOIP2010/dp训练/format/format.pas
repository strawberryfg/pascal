var str:string;
    s:array[1..10000]of string;
   t,tt,width,tot,i,j,k,l,total,left,num,tnum,now,willbe,fmin,down,anodown,another:longint;
   sumlen:array[0..1000]of longint;
   f,final:array[0..1000,0..1000]of longint;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
procedure work;
var i,j,k:longint;
begin
f[1,1]:=0;
for i:=1 to width do
    begin
    f[i,0]:=0;
    f[i,1]:=(i-1)*(i-1);
    end;
for i:=2 to width do
    begin
    for j:=2 to i do
        begin
        for k:=1 to i-1 do //last width
            begin
            if j-1>k then continue;
            f[i,j]:=min(f[i,j],f[k,j-1]+(i-k-1)*(i-k-1));
            end;
        end;
    end;
end;
begin
assign(input,'format.in');
reset(input);
assign(output,'format.out');
rewrite(output);
readln(width);
while not eoln do
  begin
  readln(str);
  t:=pos(' ',str);
  while t<>0 do
    begin
    inc(tot);
    s[tot]:=copy(str,1,t-1);
    sumlen[tot]:=sumlen[tot-1]+length(s[tot]);
    delete(str,1,t);
    t:=pos(' ',str);
    end;
  inc(tot);
  s[tot]:=str;
  sumlen[tot]:=sumlen[tot-1]+length(s[tot]);
  //readln;
  end;
for i:=1 to width do for j:=0 to i do f[i,j]:=maxlongint;
work;
for i:=1 to tot do
    begin
    for j:=1 to tot do
        final[i,j]:=maxlongint;
    end;
now:=0;
fmin:=maxlongint;

num:=0;
while (num+1<=tot)and(sumlen[num+1]+num<=width) do inc(num);
for i:=1 to num do
    begin
    left:=width-sumlen[i];
    final[i,1]:=min(final[i,1],f[left,i-1]);
    if (i=tot) then fmin:=min(final[i,1],fmin);
    end;
final[1,1]:=500;
tt:=num;
for i:=2 to tot do
    begin
    for j:=i downto 1 do
        begin
        if sumlen[i]-sumlen[j-1]+(i-j)>width then break;
        for k:=j-1 downto 1 do
            begin
            willbe:=sumlen[j-1]+j-2;
            if willbe<0 then willbe:=1;
            down:=willbe div width;
            if willbe mod width<>0 then inc(down);
            if k<down then break;
            for l:=i downto 1 do
                begin
                another:=sumlen[i]+(i-1);
                if another<0 then another:=1;
                anodown:=another div width;
                if another mod width<>0 then inc(anodown);
                if l<anodown then break;
                left:=i-j;
                total:=sumlen[i]-sumlen[j-1];
                total:=width-total;
                if left=0 then
                    begin
                    if sumlen[j]-sumlen[j-1]<width then final[i,l]:=min(final[i,l],final[j-1,k]+500)
                       else final[i,l]:=final[j-1,k];
                    end
                   else final[i,l]:=min(final[i,l],final[j-1,k]+f[total,left]);
                if (i=tot)and(final[i,l]<fmin) then
                fmin:=final[i,l];
                end;
            end;
        end;
    end;
writeln('Minimal badness is ',fmin,'.');
close(input);
close(output);
end.
