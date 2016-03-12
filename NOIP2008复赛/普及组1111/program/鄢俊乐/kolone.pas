var h:array['A'..'Z'] of boolean;
    c:char;
    n1,n2,t,i,j:longint;
    s:string[26];
begin
assign(input,'kolone.in');
reset(input);
readln(n1,n2);
for i:=1 to n1 do
    begin
    read(c);
    h[c]:=true;
    s:=c+s;
    end;
readln;
for i:=1 to n2 do
    begin
    read(c);
    s:=s+c;
    end;
readln(t);
close(input);
for i:=1 to t do
    begin
    j:=1;
    while j<n1+n2 do
          if (h[s[j]]) and not(h[s[j+1]])
             then begin
                  c:=s[j];
                  s[j]:=s[j+1];
                  s[j+1]:=c;
                  j:=j+2;
                  end
             else inc(j);
    end;
assign(output,'kolone.out');
rewrite(output);
writeln(s);
close(output);
end.
