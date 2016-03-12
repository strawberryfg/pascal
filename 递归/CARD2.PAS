var i,k:longint;
    card:array[1..52]of longint;
procedure fp(n,s:longint);
   begin
   if s>n then exit else
                    begin
                    if n mod s=0 then card[n]:=-card[n];
                    fp(n,s+1);
                    end;
   end;
begin
for i:=1 to 52 do card[i]:=1;
for i:=2 to 51 do
    fp(i,2);
for i:=1 to 52 do
    if card[i]=1 then begin write(i:4);k:=k+1 end;
writeln;
writeln(k:4);
end.