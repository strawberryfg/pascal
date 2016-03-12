var a,b,c,x:longint;
begin
read(a,b,c);
if b>c then
       begin
        x:=b;
        b:=c;
        c:=x;
       end;
if a>c then
       begin
        x:=a;
        a:=c;
        c:=x;
       end;
if a>b then
       begin
        x:=a;
        a:=b;
        b:=x;
       end;

writeln(a,' ',b,' ', c);
end.
