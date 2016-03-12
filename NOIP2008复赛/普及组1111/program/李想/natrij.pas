var n,a,b,c,i,a11,a12,a13,a22,a21,a23,a31,a32,a33:longint;
    str1,str2:array[1..8]of char;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);  
readln(str1);
readln(str2);
a11:=(ord(str1[1])-64)*10+ord(str1[2])-64;
a12:=(ord(str1[4])-64)*10+ord(str1[5])-64;
a13:=(ord(str1[7])-64)*10+ord(str1[8])-64;
a21:=(ord(str2[1])-64)*10+ord(str2[2])-64;
a22:=(ord(str2[4])-64)*10+ord(str2[5])-64;
a23:=(ord(str2[7])-64)*10+ord(str2[8])-64;
if a21<a11 then a21:=a21+24;
a33:=a23-a13;
if a33<0 then begin a33:=a33+60;dec(a22)end;
a32:=a22-a12;
if a32<0 then begin a32:=a32+60;dec(a21)end;
a31:=a21-a11;
writeln(a31,':',a32,':',a33);
close(input);
close(output);
 end.
