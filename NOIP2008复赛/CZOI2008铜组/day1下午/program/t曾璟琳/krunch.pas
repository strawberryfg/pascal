var i,leng,j,leng1:integer;
    ch:array[1..1000000]of char;
    ch1:string;
function pd(x:integer):boolean;
var i:integer;
begin
pd:=true;
for i:=1 to x-1 do
  if ch[i]=ch[x] then begin pd:=false;exit;end;
end;
begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
readln(ch);
leng:=length(ch);
leng1:=leng;
for i:=1 to leng do
 begin
   if ch[i]='A' then for j:=i to leng1-1 do
                       begin
                        ch[j]:=ch[j+1];
                        ch[leng1]:=' ';
                        leng1:=leng1-1;
                       end;
   if ch[i]='E' then for j:=i to leng1-1 do
                       begin
                        ch[j]:=ch[j+1];
                        ch[leng1]:=' ';
                        leng1:=leng1-1;
                       end;
   if ch[i]='I' then for j:=i to leng1-1 do
                       begin
                        ch[j]:=ch[j+1];
                        ch[leng1]:=' ';
                        leng1:=leng1-1;
                       end;
   if ch[i]='O' then for j:=i to leng1-1 do
                       begin
                        ch[j]:=ch[j+1];
                        ch[leng1]:=' ';
                        leng1:=leng1-1;
                       end;
   if ch[i]='U' then for j:=i to leng1-1 do
                       begin
                        ch[j]:=ch[j+1];
                        ch[leng1]:=' ';
                        leng1:=leng1-1;
                       end;
   if pd(i)=false then for j:=i to leng1-1 do
                                begin
                                        ch[j]:=ch[j+1];
                                        ch[leng1]:=' ';
                                        leng1:=leng1-1;
                                end;
   if (ch[i]=' ')and (ch[i+1]=' ') then  for j:=i to leng1-1 do
                                                begin
                                                        ch[j]:=ch[j+1];
                                                        ch[leng1]:=' ';
                                                        leng1:=leng1-1;
                                                end;
   if (ch[i]=' ')and(ch[i+1]='.')or (ch[i+1]=',')or ((ch[i+1])='?') then for j:=i to leng1-1 do
                                                                        begin
                                                                                ch[j]:=ch[j+1];
                                                                                ch[leng1]:=' ';
                                                                                leng1:=leng1-1;
                                                                        end;
   if (ch[i]=' ')and(i=1)or (i=leng1) then for j:=i to leng1-1 do
                                                begin
                                                        ch[j]:=ch[j+1];
                                                        ch[leng1]:=' ';
                                                        leng1:=leng1-1;
                                                end;
 end;
for i:=1 to leng1 do
    if (ch[i]=' ')and(i=1)or (i=leng1)or(ch[i+1]=' ') then for j:=i to leng1-1 do
                                                begin
                                                        ch[j]:=ch[j+1];
                                                        ch[leng1]:=' ';
                                                        leng1:=leng1-1;
                                                end;
for i:=1 to leng do
 write(ch[i]);
writeln;
close(input);
close(output);
end.
