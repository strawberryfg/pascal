var a,b:array[1..300]of longint;
 t,n,i,j,max:longint;
procedure dep(i,j:longint);
var temp,t1,t2,t22,k,l:longint;
begin
 t1:=0; t2:=0;
 for k:=j to n do
 begin
 t1:=a[i]*b[k];
 if k>i then for l:=i+1 to k do t2:=t2+b[l] else for l:=k+1 to i do t2:=t2+b[l];
 t22:=sqr(t2); t2:=0;
 if i=n then for l:=1 to i-1 do t2:=t2+a[l];
 temp:=t1-t22-sqr(t2);
 if temp>=0 then begin t:=t+temp; dep(i+1,k+1); end
 end;
 if t>max then begin max:=t; t:=0; end;
end;
begin
 assign(input,'concert.in'); reset(input);
 assign(output,'concert.out'); rewrite(output);
 readln(n);
 for i:=1 to n do readln(a[i]); for i:=1 to n do readln(b[i]);
 j:=1; max:=0;
 for i:=1 to n do begin t:=0; dep(i,j); end;
 writeln(max);
 close(input); close(output);
end.