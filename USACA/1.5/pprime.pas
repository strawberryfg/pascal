{
ID: xiaweiy1
PROG: pprime
LANG: PASCAL
}
const hui:array[1..2]of integer=(5,7);
      shu:array[1..4]of integer=(1,3,7,9);
var a,b,k,t,t2,y,n,tot,i:longint;
    v,ts,tf:array[0..10]of longint;
    c:array[1..1000]of longint;
function pd(x:longint):boolean;
var i:longint;
begin
pd:=true;
for i:=2 to trunc(sqrt(x)) do if x mod i=0 then begin pd:=false;exit; end;
end;
procedure pro(dep:longint);
var i,j,s:longint;
    p:boolean;
begin
if dep>(n+1)div 2 then
   begin
   s:=0;
   for i:=1 to (n+1)div 2 do s:=s*10+v[i];
   if n mod 2=0 then for i:=(n+1)div 2 downto 1 do s:=s*10+v[i]
                else for i:=(n+1)div 2-1 downto 1 do s:=s*10+v[i];
   if (s<=b)and(s>=a)and(pd(s)=true) then begin inc(tot);c[tot]:=s; end;
   end
   else
   begin
   if dep=1 then for i:=1 to 4 do
                     begin
                     v[1]:=shu[i];
                     if n=t then if shu[i]>ts[1] then exit;
                     if (n=t2)and(a>=10)and(shu[i]<tf[1]) then continue;
                     pro(dep+1);
                     v[1]:=0;
                     end
            else for i:=0 to 9 do
                     begin
                     v[dep]:=i;
                     if dep=(n+1)div 2 then
                        begin
                        s:=0;
                        for j:=1 to (n+1)div 2 do s:=s+v[j];
                        if n mod 2=0 then begin if s mod 3=0 then continue end
                           else if (s*2-i) mod 3=0 then continue;
                        end;
                     if n=t then begin p:=true;
                                       for j:=1 to dep-1 do
                                           if v[j]<ts[j] then begin p:=false;break; end;
                                       if p=true then if v[dep]>ts[dep] then exit;
                                 end;
                     if n=t2 then begin p:=true;
                                       for j:=1 to dep-1 do
                                           if v[j]>tf[j] then begin p:=false;break; end;
                                       if p=true then if v[dep]<tf[dep] then continue;
                                 end;
                     pro(dep+1);
                     v[dep]:=0;
                     end;
   end;
end;
begin
assign(input,'pprime.in');
reset(input);
assign(output,'pprime.out');
rewrite(output);
readln(a,b);
if a<=7 then for i:=1 to 2 do if (hui[i]>=a)and(b>=hui[i]) then
                                begin inc(tot); c[tot]:=hui[i]; end;
if b>=10 then
   begin
   k:=b; t:=0;
   while k<>0 do begin inc(t);k:=k div 10; end;
   y:=b; k:=0;
   while y<>0 do begin inc(k);ts[t+1-k]:=y mod 10;y:=y div 10; end;
   k:=a; t2:=0;
   while k<>0 do begin inc(t2);k:=k div 10; end;
   y:=a; k:=0;
   while y<>0 do begin inc(k);tf[t2+1-k]:=y mod 10;y:=y div 10; end;
   if t2=1 then inc(t2);
   for i:=t2 to t do
       begin n:=i; fillchar(v,sizeof(v),0); pro(1); end;
   end;
for i:=1 to tot do writeln(c[i]);
close(input);
close(output);
end.
