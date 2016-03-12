program base;
var j,s,i,l,n,k,n1,k1:longint;
function jinzhi(x,y:longint):longint;
        var c:string;
            i:longint;
	    m:int64;
        begin
        m:=0;c:='';
        while y>0 do
                begin
                c:=char(y mod x+48)+c;
                y:=y div x;
                end;
        for i:=1 to length(c) do
            m:=m*10+ord(c[i])-48;
        jinzhi:=m;
        end;
function hui(a:longint):boolean;
        var t,b:longint;
        begin
        t:=a;b:=0;
        while t>0 do
                begin
                b:=b*10+t mod 10;
                t:=t div 10;
                end;
        if b=a then hui:=true
               else hui:=false;
        end;
begin
assign(input,'base.in');reset(input);
assign(output,'base.out');rewrite(output);
readln(n,k,n1,k1);
for i:=trunc(sqrt(n)) to trunc(sqrt(k)) do
    begin
    l:=s;
    for j:=n1 to k1 do
        if hui(jinzhi(j,i*i)) then inc(s);
    if s-l>1 then s:=l;
    end;
writeln(s);
close(input);
close(output);
end.
