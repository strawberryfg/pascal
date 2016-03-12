var ss,i,b,max,maxn,min:longint;
    s,q,e:array[1..10000] of longint;
    t:boolean;
begin
 assign(input,'hunger.in');
 assign(output,'hunger.out');
 reset(input);
 rewrite(output);
 readln(b);
 maxn:=0;
 for i:=1 to 2000 do
    q[i]:=1;
 for i:=1 to b do
   begin
    readln(s[i],e[i]);
    if ((e[i]-s[i])+1)>maxn then begin maxn:=(e[i]-s[i])+1; q[e[i]]:=0;q[s[i]]:=0;end;
   end;
  ss:=maxn;
  t:=true;
  while t=true do
   begin
     maxn:=0;t:=false;
   for i:=1 to b do
    begin
    if (e[i]-s[i]+1>maxn) and (q[e[i]]<>0) and (q[s[i]]<>0)
     then begin maxn:=e[i]-s[i]+1; q[e[i]]:=0;q[s[i]]:=0;t:=true;end;
    end;
    ss:=ss+maxn;
   end;
  writeln(ss);
  close(input);
  close(output);
end.