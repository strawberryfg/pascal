var i,n,a,b,tt,k:longint;
    aa:array[1..200]of string;
    t:string;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
aa[1]:='1';
aa[2]:='1';
aa[3]:='1';
aa[4]:='';
for i:=4 to n do
    begin
    a:=length(aa[1]);
    b:=length(aa[3]);
    aa[4]:='';
    k:=0;
    while b>0 do
          begin
          if a>0 then tt:=ord(aa[1,a])-48+ord(aa[3,b])-48
                 else tt:=ord(aa[3,b])-48;
          aa[4]:=char((tt mod 10+k)mod 10+48)+aa[4];
          if tt+k>=10 then k:=1
                      else k:=0;
          dec(a);
          dec(b);
          end;
    if k=1 then aa[4]:='1'+aa[4];
    aa[1]:=aa[2];
    aa[2]:=aa[3];
    aa[3]:=aa[4];
    end;
if n<4 then writeln('1')
       else writeln(aa[4]);
close(input);
close(output);
end.
