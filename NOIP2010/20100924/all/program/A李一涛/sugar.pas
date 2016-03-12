var x,y,total,n,m,a,b:longint;
procedure dep(n,m,x,y,a,b:longint);
begin
 if (n>4)and(a>0) then begin n:=n-5; dep(n,m,x,y,a,b); n:=n+5 end;
 if (n>1)and(b>0) then begin n:=n-2; dep(n,m,x,y,a,b); n:=n+2; end;
 if n>0 then begin
 if m>0 then begin dec(n); dep(n,m,x,y,0,0); inc(n); end;
 if x>0 then begin dec(x); dec(n); dep(n,0,x,y,0,0); inc(x); inc(n);end;
 if y>0 then begin dec(y); dec(n); dep(n,0,0,y,0,0); inc(y); inc(n); end; end;
 if n=0 then inc(total);
end;
begin
 assign(input,'sugar.in'); reset(input);
 assign(output,'sugar.out'); rewrite(output);
 m:=1; x:=1; y:=4; total:=0; a:=1; b:=1;
 readln(n); dep(n,m,x,y,a,b);
 writeln(total);
 close(input); close(output);
end.