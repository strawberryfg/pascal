{
ID: xiaweiy1
PROG: lamps
LANG: PASCAL
}
var n,sum,i,j,t,tot,spe:longint;
    p:array[1..100]of string;
    ss:string;
    hash,a,f:array[1..4]of longint;
function check:boolean;
begin
check:=true;
if (hash[1]<>-1)and(a[1] xor a[2] xor a[4]<>hash[1]) then exit(false);
if (hash[2]<>-1)and(a[1] xor a[3] xor a[4]<>hash[2]) then exit(false);
end;
procedure print;
var i:longint;
    s:string;
    pd:boolean;
begin
s:='';
if check=false then exit;
for i:=1 to n do s:=s+'1';
for i:=1 to n do
    begin
    if (i mod 2=0)and(a[3]<>0) then s[i]:=char(97-ord(s[i]));
    if (i mod 2=1)and(a[2]<>0) then s[i]:=char(97-ord(s[i]));
    if (i-1)mod 3=0 then if a[4]<>0 then s[i]:=char(97-ord(s[i]));
    if a[1]<>0 then s[i]:=char(97-ord(s[i]));
    end;
pd:=true;
for i:=1 to tot do if s=p[i] then begin pd:=false;break; end;
if pd=true then begin inc(tot);p[tot]:=s; end;
end;
procedure produce(dep:longint);
var i,j,m:longint;
begin
if a[dep]>-1 then
   if (dep=4)then
      begin
        if ((sum mod 2)=(a[1]xor a[2]xor a[3]xor a[4]))and(sum>=a[1]+a[2]+a[3]+a[4]) then
           begin  print;a[3]:=-1;if spe=0 then a[4]:=-1; exit; end
        else exit;
      end
   else
      produce(dep+1);
for i:=0 to 1 do
    begin
    if f[dep]<>-1 then
       begin
       if (f[dep]=0)and(i=0) then continue;
       if (f[dep]=1)and(i=1) then break;
       end;
    a[dep]:=i;
    if (dep=3)and(hash[4]<>-1)and(a[1]xor i<>hash[4]) then begin  for j:=dep+1 to 3 do a[j]:=-1;if spe=0 then a[4]:=-1;continue;end;
    if (dep=2)and(hash[3]<>-1)and(a[1]xor i<>hash[3]) then begin  for j:=dep+1 to 3 do a[j]:=-1;if spe=0 then a[4]:=-1;continue;end;
    if (hash[3]<>-1)and(dep=1) then
       begin
       m:=-1;
       for j:=0 to 1 do
           if a[1] xor j=hash[3] then m:=j;
       if m=-1 then  begin  for j:=dep+1 to 3 do a[j]:=-1;if spe=0 then a[4]:=-1;continue; end;
       a[2]:=m;
       f[2]:=m;
       end;
    if (hash[4]<>-1)and(dep=1) then
       begin
       m:=-1;
       for j:=0 to 1 do
           if a[1] xor j=hash[4] then m:=j;
       if m=-1 then begin  for j:=dep+1 to 3 do a[j]:=-1;if spe=0 then a[4]:=-1;continue;end;
       a[3]:=m;
       f[3]:=m;
       end;
    if (dep=4)and(hash[1]<>-1) then
       begin
       m:=-1;
       for j:=0 to 1 do if a[1] xor a[2] xor j=hash[1] then m:=j;
       if m=-1 then exit;
       a[4]:=m;
       if ((sum mod 2)=(a[1]xor a[2]xor a[3]xor a[4]))and(sum>=a[1]+a[2]+a[3]+a[4]) then print else continue;
       break;
       end;
    if (dep=4)and(hash[2]<>-1) then
       begin
       m:=-1;
       for j:=0 to 1 do if a[1] xor a[3] xor j=hash[1] then m:=j;
       if m=-1 then exit;
       a[4]:=m;
       if ((sum mod 2)=(a[1]xor a[2]xor a[3]xor a[4]))and(sum>=a[1]+a[2]+a[3]+a[4]) then print else continue;
       break;
       end;
    if dep=4 then
       begin
       if ((sum mod 2)=(a[1]xor a[2]xor a[3]xor a[4]))and(sum>=a[1]+a[2]+a[3]+a[4]) then print else continue;
       break;
       end;
    produce(dep+1);
    for j:=dep+1 to 3 do a[j]:=-1;if spe=0 then a[4]:=-1;
    end;
for j:=dep to 3 do a[j]:=-1;if spe=0 then a[4]:=-1;
end;
begin
assign(input,'lamps.in');
reset(input);
assign(output,'lamps.out');
rewrite(output);
readln(n);
readln(sum);
for i:=1 to 4 do hash[i]:=-1;
for i:=0 to 1 do
begin
  while true do
      begin
      read(t);
      if t=-1 then break;
      for j:=1 to 4 do a[j]:=-1;
      if t mod 2=1 then a[2]:=1 else a[3]:=1;
      if (t-1)mod 3=0 then a[4]:=1;
      if (a[2]=1)and(a[4]=1) then begin if (hash[1]<>-1)and(hash[1]<>i) then
                                        begin writeln('IMPOSSIBLE'); close(input);
                                              close(output);halt;
                                        end
                                        else
                                        hash[1]:=i;
                                  continue;
                                  end;
      if (a[3]=1)and(a[4]=1) then
                                 begin if (hash[2]<>-1)and(hash[2]<>i) then
                                        begin writeln('IMPOSSIBLE'); close(input);
                                              close(output);halt;
                                        end
                                        else
                                        hash[2]:=i;
                                 continue;
                                  end;
      if (a[2]=1)and(a[4]=-1)then begin
                                  if (hash[3]<>-1)and(hash[3]<>i) then
                                        begin writeln('IMPOSSIBLE'); close(input);
                                              close(output);halt;
                                        end
                                        else
                                        hash[3]:=i;continue;
                                  end;
      if (a[3]=1)and(a[4]=-1) then begin if (hash[4]<>-1)and(hash[4]<>i) then
                                        begin writeln('IMPOSSIBLE'); close(input);
                                              close(output);halt;
                                        end
                                        else
                                        hash[4]:=i;continue;
                                   end;
      end;
end;
for i:=1 to 4 do begin a[i]:=-1;f[i]:=-1; end;
if (hash[1]>-1)and(hash[3]>-1) then for i:=0 to 1 do if i xor hash[3]=hash[1]
                                                        then begin a[4]:=i;spe:=1; end;
if (hash[2]>-1)and(hash[4]>-1) then for i:=0 to 1 do if i xor hash[4]=hash[2]
                                                        then begin a[4]:=i;spe:=1; end;
produce(1);
for i:=1 to tot-1 do
    for j:=i+1 to tot do
        if p[i]>p[j] then begin ss:=p[i]; p[i]:=p[j]; p[j]:=ss; end;
for i:=1 to tot do writeln(p[i]);
if tot=0 then writeln('IMPOSSIBLE');
close(input);
close(output);
end.
