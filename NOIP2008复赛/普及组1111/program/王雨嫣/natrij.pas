var a,b:string;
    n,m,i,j,k:longint;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
readln(a);
readln(b);
n:=((ord(a[1])-48)*10+ord(a[2])-48)*3600+((ord(a[4])-48)*10+ord(a[5])-48)*60+(ord(a[7])-48)*10+ord(a[8])-48;
m:=((ord(b[1])-48)*10+ord(b[2])-48)*3600+((ord(b[4])-48)*10+ord(b[5])-48)*60+(ord(b[7])-48)*10+ord(b[8])-48;
if m<=n then m:=m+3600*24;
i:=(m-n) mod 60;
j:=(m-n-i) div 60 mod 60;
k:=(m-n-i-j*60)div 3600;
if k<10 then write('0',k,':')
        else write(k,':');
if j<10 then write('0',j,':')
        else write(j,':');
if i<10 then write('0',i)
        else write(i);
writeln;
close(input);
close(output);
end.