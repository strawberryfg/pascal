var n,i,sum,k,mark,state:longint;
    a,b:array[1..1050]of longint;
    s:char;
    code:integer;
    times,have:array[0..20]of longint;
function pd(num,i:longint):boolean;
begin
if i<a[num] then exit(false);
if (i=a[num]) then exit(true);
if (i>a[num]) then
   begin mark:=1;state:=num; exit(true); end;
end;
procedure print;
var pd:boolean;
begin
pd:=true;
for i:=1 to n do
    if b[i]<a[i] then begin pd:=false;break; end
       else if b[i]>a[i] then break;
if pd=false then exit;
for i:=1 to n do write(b[i]);
writeln;
close(input);
close(output);
halt;
end;
function check:boolean;
var i,sum:longint;
begin
sum:=0;
for i:=0 to 9 do if times[i]=1 then inc(sum);
if sum>1 then exit(true) else exit(false);
end;
procedure try(dep:longint);
var st,en,i:longint;
begin
if dep>k then print;
if dep=1 then st:=a[1] else st:=have[1];
en:=have[have[0]];
for i:=st to en do
    begin
    {if (dep<>k)and(check=true) then
       begin
       writeln(0);
       close(input);
       close(output);
       halt;
       end;}
    if times[i]=0 then continue;
    if (dep<>k)and(times[i]=1) then continue;
    if (mark=1)or((mark=0)and(pd(dep,i)=true)) then
       begin
       dec(times[i],2);
       b[dep]:=i; b[n+1-dep]:=i;
       try(dep+1);
       inc(times[i],2);
       b[dep]:=-1; b[n+1-dep]:=-1;
       {if (i=en)and(mark=1) then
          begin
          writeln(0);
          close(input); close(output);
          halt;
          end;}
       if (dep=state)and(mark=1) then mark:=0;
       end;
    end;
end;
begin
assign(input,'number.in');
reset(input);
assign(output,'number.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    read(s);
    val(s,a[i],code);
    inc(times[a[i]]);
    end;
sum:=0;
for i:=0 to 9 do if (times[i] mod 2=1) then inc(sum);
if sum>1 then begin writeln(0);halt; end;
if n mod 2=0 then k:=n div 2 else k:=(n+1)div 2;
for i:=1 to n do b[i]:=-1;
for i:=0 to 9 do if times[i]<>0 then begin inc(have[0]);have[have[0]]:=i; end;
try(1);
writeln(0);
close(input);
close(output);
end.
