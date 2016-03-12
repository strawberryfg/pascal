var t,i,n,a,b,step,s:longint;
    l:array[1..201] of longint;
procedure try(s1:longint);
begin
 if s1=b then begin t:=1;exit; end;
 step:=step+1;if step>n*n*n then exit;
 if s1-l[s1]<=0 then try(s1+l[s1])
 else
   if (s1<b) and (s1+l[s1]<=n) then  try(s1+l[s1])
      else
      if s1-l[s1]>0 then try(s1-l[s1]);
end;
begin
 assign(input,'lift.in');
 assign(output,'lift.out');
 reset(input);
 rewrite(output);
 readln(n,a,b);
 for i:=1 to n do
    read(l[i]);
 s:=a;
 step:=0;t:=0;
 try(s);
 if t=0 then writeln(-1) else writeln(step);
 close(input);
 close(output);
end.