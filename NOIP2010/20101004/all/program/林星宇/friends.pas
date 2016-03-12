var s1,s2,ss:string;
    flag:boolean;
    i,j,n:longint;
    x:char;

function fr(s1,s2:string):boolean;
 var i:longint;
     a,b:array[0..110]of 0..9 ;
     c,d:array[0..9]of 0..1;
begin
if s1[1]='0' then begin fr:=false;exit;end;
fr:=true;
fillchar(c,sizeof(c),0);
fillchar(d,sizeof(d),0);
for i:=1 to length(s1) do begin a[i]:=ord(s1[i])-48;c[a[i]]:=1;end;
for i:=1 to length(s2) do begin b[i]:=ord(s2[i])-48;d[b[i]]:=1;end;
for i:=0 to 9 do if c[i]<>d[i] then begin fr:=false;exit;end;
end;

begin
assign(input,'friends.in');reset(input);
assign(output,'friedns.out');rewrite(output);
readln(n);
for j:=1 to n do
begin
s1:='';s2:='';ss:='';
 repeat read(x);s1:=s1+x;until x=' ';delete(s1,length(s1),1);
 readln(s2);

if fr(s1,s2) then begin writeln('friends');flag:=true;end

else
begin
 flag:=false;
   for i:=2 to length(s1) do
    begin
     ss:=s1;
     if (ss[i]<>'9')and(ss[i-1]<>'0') then begin ss[i]:=chr(ord(ss[i])+1);ss[i-1]:=chr(ord(ss[i-1])-1);end;
      if fr(ss,s2) then  begin writeln('almost friends');flag:=true;break;end;
     ss:=s1;
     if (ss[i]<>'0')and(ss[i-1]<>'9') then begin ss[i]:=chr(ord(ss[i])-1);ss[i-1]:=chr(ord(ss[i-1])+1);end;
      if fr(ss,s2) then  begin writeln('almost friends');flag:=true;break;end;
    end;
if flag=false then
begin
   for i:=2 to length(s2) do
    begin
     ss:=s2;
     if (ss[i]<>'9')and(ss[i-1]<>'0') then begin ss[i]:=chr(ord(ss[i])+1);ss[i-1]:=chr(ord(ss[i-1])-1);end;
      if fr(ss,s1) then  begin writeln('almost friends');flag:=true;break;end;
     ss:=s2;
     if (ss[i]<>'0')and(ss[i-1]<>'9') then begin ss[i]:=chr(ord(ss[i])-1);ss[i-1]:=chr(ord(ss[i-1])+1);end;
      if fr(ss,s1) then  begin writeln('almost friends');flag:=true;break;end;
    end;
end;
end;
if flag=false then writeln('nothing');
end;
close(input);close(output);
end.

