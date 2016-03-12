var   i:longint;
      n,d:longint;
      a:array[1..2500] of char;
      str:ansistring;
procedure try(i:longint);
var sj,sh,j,t:longint;
   begin
   j:=1;
   sj:=0;
   sh:=0;
   t:=1;
   while j<=n do
      begin
      if a[j]='H' then begin inc(sh);
                             if ((sh-sj)>d)AND(sj<>0) then begin
                                               t:=t+1;
                                               j:=j-1;
                                               if t>i then exit;
                                               sj:=0;
                                               sh:=0;
                                               end;
                             end
                  else begin inc(sj);if ((sj-sh)>d)and(sh<>0) then begin
                                                       t:=t+1;
                                                       j:=j-1;
                                                       if t>i then exit;
                                                       sj:=0;
                                                       sh:=0;
                                                       end;
                       end;

      inc(J);
      end;
   if t=i then begin write(t);close(input);close(output);halt;end;
end;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
readln(str);
for i:=1 to n do
    {read(a[i]); }
a[i]:=str[i];
for i:=2 to n do
    try(i);
end.