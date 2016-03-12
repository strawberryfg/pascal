var a:array[1..200]of string;
    n,i,j,k:longint;
function plus(a,b:string):string;
        var t,s:string;
            m,n,la,lb:longint;
        begin
        if length(a)<length(b) then begin t:=a;a:=b;b:=t;end;
        la:=length(a);
        lb:=length(b);
        s:='';m:=0;
        while lb>0 do
          begin
          n:=ord(a[la])+ord(b[lb])-96+m;
          m:=n div 10;n:=n mod 10;
          s:=chr(n+48)+s;
          dec(la);dec(lb);
          end;
        while la>0 do
          begin
          n:=ord(a[la])-48+m;
          m:=n div 10;n:=n mod 10;
          s:=chr(n+48)+s;
          dec(la);
          end;
        if m>0 then s:=chr(m+48)+s;
        plus:=s;
        end;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
a[1]:='1';
a[2]:='1';
a[3]:='1';
for i:=4 to n do
        a[i]:=plus(a[i-1],a[i-3]);
writeln(a[n]);
close(input);
close(output);
end.
