program maxnum;
var ii,i:longint;
    a:array [1..1000]of longint;

function gcd(a,b:longint):longint;
var t,c:longint;
begin
        if b>a then begin t:=a;a:=b;b:=t; end;
        while  a mod b<>0 do
        begin
                c:=a mod b;
                a:=b;
                b:=c;
        end;
        gcd:=b;
end;

begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
        ii:=0;
        while not eof do
        begin
                inc(ii);
                readln(a[ii]);
                if a[ii]=1 then begin writeln('1');close(input);close(output);halt;end
        end;
        while ii>1 do
        begin
                if ii mod 2=0 then
                                begin
                                ii:=ii div 2;
                                for i:=1 to ii do a[i]:=gcd(a[2*i-1],a[2*i]);
                                end
                              else
                                begin
                                ii:=ii div 2;
                                for i:=1 to ii do a[i]:=gcd(a[2*i-1],a[2*i]);
                                a[i]:=gcd(a[i],a[ii*2+1]);
                                end;
        end;
        writeln(a[1]);
close(input);
close(output);
end.
