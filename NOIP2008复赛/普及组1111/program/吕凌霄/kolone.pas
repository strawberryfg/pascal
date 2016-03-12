var t,j1,j2:set of 'A'..'Z';
    s1,s2:string;
    ch:char;
    i,j,l1,l2,n:longint;
begin
assign(input,'kolone.in');reset(input);
assign(output,'kolone.out');rewrite(output);
readln(l1,l2);
j1:=[];j2:=[];
readln(s1);for i:=1 to l1 do j1:=j1+[s1[i]];
readln(s2);for i:=1 to l2 do j2:=j2+[s2[i]];
for i:=1 to l1 do
    s2:=s1[i]+s2;
readln(n);
for i:=1 to n do
    begin
    t:=[];
    for j:=1 to l1+l2-1 do
        if (not(s2[j] in t))and(not(s2[j+1] in t)) then
           if (s2[j] in j1)and(s2[j+1] in j2)
              or (s2[j] in j2)and(s2[j+1] in j1)
                 then begin
                      ch:=s2[j];s2[j]:=s2[j+1];s2[j+1]:=ch;
                      t:=t+[s2[j],s2[j+1]];
                      end;
    end;
writeln(s2);
close(input);close(output);
end.