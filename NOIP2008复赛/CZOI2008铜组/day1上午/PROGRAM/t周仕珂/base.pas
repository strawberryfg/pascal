var num1,num2:int64;
        base1,base2,i,j,total:longint;
        a:array[1..10000] of longint;
function pd(n:longint):boolean;
var s:string;
        i,q,p,temp,t:longint;
begin
pd:=true;
s:='';
temp:=0;
t:=n;
for i:=base1 to base2 do
        begin
        while t<>0 do
                begin
                s:=s+char(t mod i+48);
                t:=t div i;
                end;
        q:=1;p:=length(s);
        while q<=p do
                begin
                if s[q]<>s[p] then break
                                else if q=p then begin inc(temp);break;end
                                        else begin inc(q);dec(p);end;
                end;
        s:='';
        t:=n;
        if q>p then inc(temp);

        end;
        if temp=0 then begin pd:=false;exit;end;
        if temp>1 then begin pd:=false;exit;end;
end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
readln(num1,num2,base1,base2);
j:=1;
total:=0;
for i:=1 to 10000 do
        begin
        if (i*i>=num1)and(i*i<=num2) then begin a[j]:=i*i; inc(j); end;
        if i*i>num2 then break;
        end;
for i:=1 to j-1 do

        if pd(a[i]) then inc(total);


writeln(total);
close(input);
close(output);
end.
