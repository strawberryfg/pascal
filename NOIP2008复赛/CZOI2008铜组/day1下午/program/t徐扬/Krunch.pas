var str:string;
    b,c,i,l:longint;
    a:array[1..110] of longint;
begin
 assign(input,'krunch.in');
 assign(output,'krunch.out');
 reset(input);
 rewrite(output);
 readln(str);
 l:=length(str);
 b:=1;c:=l;
 if str[1]=' ' then begin str[1]:='_';b:=b+1;end;
 if str[l]=' ' then begin str[l]:='_';c:=l-1;end;
 for i:=1 to 110 do a[i]:=0 ;
 for i:=1 to l do
 begin
   if  (a[ord(str[i])]=1) or (str[i]='A') or (str[i]='E') or (str[i]='O') or (str[i]='I') or (str[i]='U') or (str[i]='_') then str[i]:='_'
   else a[ord(str[i])]:=1;
 end;
 for i:=b to c do
   if str[i]<>'_' then write(str[i]);
close(input);
close(output);
end.
