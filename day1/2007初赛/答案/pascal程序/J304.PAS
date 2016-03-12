program j304;
type str1=string[100];
     str2=string[200];
var s1:str1;
    s2:str2;
function isalpha(c:char):boolean;
var i:integer;
begin
 i:=ord(c);
 if ((i>=65) and (i<=90)) or
      ((i>=97) and (i<=122)) then
   isalpha:=true
 else
   isalpha:=false;
end;
function isdigit(c:char):boolean;
var i:integer;
begin
 i:=ord(c);
 if (i>=48) and (i<=57) then
   isdigit:=true
 else
  isdigit:=false;
end;

procedure  expand(s1:str1;var s2:str2);
var i,j:integer;
    a,b,c:char;
begin
 j:=1; c:=char(1); i:=0;
 while(i<=ord(s1[0])) do
  begin
    inc(i); c:=s1[i];
    if  c='-' then
     begin{1}
       writeln('i=',i);
       a:=s1[i-1]; b:=s1[i+1];
       if (isalpha(a) and isalpha(b))or (isdigit(a) and isdigit(b)) then
         begin
           writeln('*****',a,'&',b);
	   dec(j);
	   while(ord(upcase(a))<ord(upcase(s1[i+1])))do
             begin s2[j]:=a;inc(j);inc(a); end;
         end
        else
         begin  s2[j]:=c;inc(j); end;
        end{1}
     else
      begin s2[j]:=c;inc(j); end;
end;
 s2[0]:=char(j-2);
end;
begin
 writeln('input s1:');
  readln(s1);
  expand(s1,s2);
  writeln(s2);
end.
