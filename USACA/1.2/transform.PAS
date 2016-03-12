{
ID: xiaweiy1
PROG: transform
LANG: PASCAL
}
const maxn=10;
var n,i,j,k,l,m:longint;
    check:boolean;
    s:array[1..maxn]of string;
    b:array[1..maxn]of string;
    t:array[1..maxn,1..maxn]of string;
    e:array[1..maxn]of string;
procedure fanshe(k:longint);
begin
for i:=1 to n do
    s[i]:='';
for i:=1 to n do
    for j:=n downto 1 do
        s[i]:=s[i]+t[k,i][j];
for i:=1 to n do
    t[k,i]:=s[i];
end;
procedure zhuanhuan(k:longint);
begin
for m:=1 to k do
    begin
    for j:=1 to n do
        s[j]:='';
    for i:=1 to n do
        begin
        for j:=n downto 1 do
            s[i]:=s[i]+t[k,j][i];
        end;
    for i:=1 to n do
        t[k,i]:=s[i];
    end;
end;
procedure special;
begin
for m:=1 to 3 do
    begin
    for k:=1 to m do
    begin
    for j:=1 to n do
        s[j]:='';
    for i:=1 to n do
        begin
        for j:=n downto 1 do
            s[i]:=s[i]+t[5,j][i];
        end;
    for i:=1 to n do
        t[5,i]:=s[i];
    end;
    check:=true;
    for i:=1 to n do
        if t[l,i]<>e[i] then begin check:=false;break;end;
    if check=true then begin writeln(l);halt;end
    end;
end;
begin
assign(input,'transform.in');
reset(input);
assign(output,'transform.out');
rewrite(output);
readln(n);
for i:=1 to n do
    readln(b[i]);
for i:=1 to n do
    readln(e[i]);
for i:=1 to 6 do
    for j:=1 to n do
        t[i,j]:=b[j];
for l:=1 to 5 do
    begin
    if l<=3 then  zhuanhuan(l)
            else case l of
                      4:fanshe(l);
                      5:begin fanshe(l);special;end;
                 end;
    check:=true;
    for i:=1 to n do
        if t[l,i]<>e[i] then begin check:=false;break;end;
    if check=true then begin writeln(l);break;end
                  else if l=5 then begin
                                   for i:=1 to n do
                                       if t[l,i]<>e[i] then break
                                                       else if i=n then begin writeln(6);check:=true;end;
                                   if check=false then writeln(7);
                                   end;
    end;
close(input);
close(output);
end.