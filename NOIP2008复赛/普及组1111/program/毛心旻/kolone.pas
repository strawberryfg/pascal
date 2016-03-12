var n,m,i,t,j,nn,mm,k:longint;
    s:array[1..120]of char;
    hash,hash2:array[1..120]of boolean;
    s1,s2,sw:ansistring;
    ss:char;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n,m);
readln(s1);
readln(s2);
readln(t);
if n>t then sw:=copy(s1,t+1,length(s1)-t);
for i:=length(sw) downto 1 do
    write(sw[i]);
sw:='';
if m>T then sw:=copy(s2,t+1,length(s2)-t);
if n>t then nn:=t
       else nn:=n;
if m>t then mm:=t
       else mm:=m;
for i:=nn downto 1 do
    begin
    s[nn-i+1]:=s1[i];
    hash[i]:=true;
    end;
for i:=1 to mm do
    s[nn+i]:=s2[i];
if t<>0 then
for i:=1 to t do
    begin
    for j:=1 to nn+mm-1 do
        begin
        if hash2[j]=false then
        if (hash[j]=true)and(hash[j+1]=false) then begin
                                                   ss:=s[j];
                                                   s[j]:=s[j+1];
                                                   s[j+1]:=ss;
                                                   if hash[j]=true then begin
                                                                        hash[j]:=false;
                                                                        hash[j+1]:=true;
                                                                        end
                                                                   else begin
                                                                        hash[j]:=true;
                                                                        hash[j+1]:=false;
                                                                        end;
                                                   hash2[j+1]:=true;
                                                   end;
        end;
    for k:=1 to nn+mm do
        hash2[k]:=false;
    end;
for i:=1 to nn+mm do
    write(s[i]);
if sw<>'' then writeln(sw)
          else writeln;
close(input);
close(output);
end.