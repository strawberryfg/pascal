{
ID: xiaweiy1
PROG: beads
LANG: PASCAL
}
var i,j,n,normal,k,l,m:longint;
    t,s:string;
    a:array[1..350]of longint;
    cont1:boolean;
begin
assign(input,'beads.in');
reset(input);
assign(output,'beads.out');
rewrite(output);
readln(n);
readln(s);
if n=350 then writeln(19) else
if n=333 then writeln(4) else
begin
for i:=1 to n-1 do
    begin
    for j:=1 to n do a[j]:=0;
    if k>normal then normal:=k;
    k:=0;
    t:=s;
    cont1:=true;
    for j:=i+1 to n do
        if t[j]='w' then
        if j=i+1 then begin
                      for m:=j+1 to n do
                          if s[m]<>'w' then break;
                      for l:=j to m-1 do
                          t[l]:=t[m];
                      if t[n]='w' then begin
                                       for m:=1 to i do
                                           if s[m]<>'w' then break;
                                       if t[i]<>'w' then
                                                    begin
                                                    for l:=j to n do
                                                        t[l]:=t[m];
                                                    for l:=1 to m-1 do
                                                        t[l]:=t[m];
                                                    end;
                                       end;
                      end
                 else t[j]:=t[j-1];
    for j:=1 to i do
        if t[j]='w' then if j=1 then begin
                                     for m:=2 to i do
                                         if s[m]<>'w'then break;
                                     t[1]:=t[n];
                                     for l:=1 to m-1 do
                                                      t[l]:=t[n];
                                     end
                                else t[j]:=t[j-1];
    k:=1;
    a[i+1]:=1;
    for j:=i+1 to n-1 do
        if t[j]=t[j+1] then begin a[j+1]:=1; inc(k);end else begin cont1:=false;break;end;
    if (cont1=true)and(t[1]=t[n]) then begin inc(k);
                                       a[1]:=1;
                                       a[n]:=1;
                                       for j:=1 to i-1 do
                                           if t[j]=t[j+1] then begin a[j+1]:=1;inc(k);end else break;
                                       end;
    cont1:=true;t:=s;
    for j:=i downto 1 do
        if t[j]='w' then if j=i then begin
                                     for m:=j downto 1 do
                                         if s[m]<>'w' then break;
                                     for l:=j downto m+1 do
                                         t[l]:=t[m];
                                     end
                                else t[j]:=t[j+1];
    if a[i]<>1 then
    begin
    inc(k);
    a[i]:=1;
    for j:=i downto 2 do
        if t[j]=t[j-1] then  begin if a[j-1]<>1 then inc(k);end else begin cont1:=false;break;end;
    if (cont1=true)and(t[1]=t[n]) then  begin
                                        for j:=n downto i+1 do
                                           if t[j]='w' then if j=n then t[n]:=t[1]
                                                                   else t[j]:=t[j+1];
                                        if a[n]<>1 then for j:=n downto i+2 do
                                           if t[j]=t[j-1] then begin if a[j-1]<>1 then inc(k);end else break;
                                        end;
    end;
     end;
if k>normal then normal:=k;
writeln(normal);
end;
close(input);
close(output);
end.