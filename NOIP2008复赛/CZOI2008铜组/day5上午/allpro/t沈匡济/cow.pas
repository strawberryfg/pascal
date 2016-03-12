var n,i:longint;
    a:array[0..201]of string;
function jia(a,b:string):string;
        var la,lb,n,k:longint;
            c:string;
        begin
        la:=length(a);
        lb:=length(b);
        k:=0;c:='';
        while (la>0)and(lb>0) do
                begin
                n:=ord(a[la])-48+ord(b[lb])-48+k;
                if n>9 then k:=1
                       else k:=0;
                n:=n mod 10;
                c:=chr(n+48)+c;
                dec(la);
                dec(lb);
                end;
        while la>0 do
                begin
                n:=ord(a[la])-48+k;
                if n>9 then k:=1
                       else k:=0;
                n:=n mod 10;
                c:=chr(n+48)+c;
                dec(la);
                end;
        while lb>0 do
                begin
                n:=ord(b[lb])-48+k;
                if n>9 then k:=1
                       else k:=0;
                n:=n mod 10;
                c:=chr(n+48)+c;
                dec(lb);
                end;
        if k=1 then c:='1'+c;
        jia:=c;
        end;
begin
assign(input,'cow.in');reset(input);
assign(output,'cow.out');rewrite(output);
readln(n);
for i:=1 to 3 do
    a[i]:='1';
for i:=4 to n do
        a[i]:=jia(a[i-1],a[i-3]);
writeln(a[n]);
close(input);
close(output);
end.
