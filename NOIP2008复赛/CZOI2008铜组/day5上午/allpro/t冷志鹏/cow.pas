program cow;
var i,n:longint;
    a:array [1..200]of string;

function suan(d,e:string):string;
var i,j,lena,lenb:longint;
    a,b,c:array[1..100]of longint;
    s,ss:string;
begin
        lena:=length(d);
        lenb:=length(e);
        for i:=lena downto 1 do val(d[i],a[lena+1-i]);
        for i:=lenb downto 1 do val(e[i],b[lenb+1-i]);
        for i:=1 to lena do c[i]:=a[i]+b[i];
        i:=1;
        while (c[i]>=10)or(i<=lena) do
                begin
                if c[i]>9 then begin c[i+1]:=c[i+1]+c[i] div 10;c[i]:=c[i] mod 10;end;
                inc(i);
                end;
        while c[i]<>0 do
                inc(i);
        dec(i);
        s:='';
        for j:=1 to i do
                begin
                str(c[j],ss);
                s:=ss+s;
                end;
        suan:=s;
end;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
        readln(n);
        if n<=3 then begin writeln('1');close(input);close(output);exit;end;
        for i:=1 to 200 do a[i]:='';
        for i:=1 to 3 do a[i]:='1';
        for i:=4 to n do
                a[i]:=suan(a[i-1],a[i-3]);
        writeln(a[n]);
close(input);
close(output);
end.