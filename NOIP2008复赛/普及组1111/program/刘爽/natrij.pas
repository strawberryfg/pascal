var t1,t2:longint;
procedure file1;
begin
assign(input,'natrij.in');
assign(output,'natrij.out');
reset(input);
rewrite(output);
end;
procedure file2;
begin
close(input);
close(output);
end;
procedure dataout;
var cha,temp:longint;
    s:string;
begin
if t2>=t1 then cha:=t2-t1
   else begin
        cha:=86400-t1+t2
        end;
s:='';
temp:=cha div 3600;
cha:=cha mod 3600;
s:=s+chr(temp div 10+48)+chr(temp mod 10+48);
s:=s+':';
temp:=cha div 60;
cha:=cha mod 60;
s:=s+chr(temp div 10+48)+chr(temp mod 10+48);
s:=s+':';
temp:=cha;
s:=s+chr(temp div 10+48)+chr(temp mod 10+48);
writeln(s);
end;
procedure datain;
var di:longint;
    x,y:char;
begin
t1:=0;
t2:=0;
read(x,y);
t1:=t1+3600*((ord(x)-48)*10+ord(y)-48);
read(x);
read(x,y);
t1:=t1+60*((ord(x)-48)*10+ord(y)-48);
read(x);
read(x,y);
t1:=t1+(ord(x)-48)*10+ord(y)-48;
readln;
read(x,y);
t2:=t2+3600*((ord(x)-48)*10+ord(y)-48);
read(x);
read(x,y);
t2:=t2+60*((ord(x)-48)*10+ord(y)-48);
read(x);
read(x,y);
t2:=t2+(ord(x)-48)*10+ord(y)-48;
end;
begin
file1;
datain;
dataout;
file2;
end.
