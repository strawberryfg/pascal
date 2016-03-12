var s1,s2,s:string;
    i,j,t,m,n:longint;
    a,lw:array['A'..'Z'] of byte;
    ch:char;
procedure build;
begin
readln(m,n);
readln(s1);
readln(s2);
readln(t);
end;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);
rewrite(output);
s:='';
build;
for i:=1 to length(s1) do
    a[s1[i]]:=1;
for i:=1 to length(s2) do
    a[s2[i]]:=2;
for i:=1 to length(s1) do
    s:=s1[i]+s;
s:=s+s2;
for i:=1 to t do
    begin
    fillchar(lw,sizeof(lw),0);
    for j:=m+n downto 2 do
        if (a[s[j]]=2) and (a[s[j-1]]=1) and (lw[s[j]]=0) and (lw[s[j-1]]=0) then begin
                                                                                  ch:=s[j];
                                                                                  s[j]:=s[j-1];
                                                                                  s[j-1]:=ch;
                                                                                  lw[s[j]]:=1;
                                                                                  lw[s[j-1]]:=1;
                                                                                  end;
    end;
writeln(s);
close(input);
close(output);
end.
