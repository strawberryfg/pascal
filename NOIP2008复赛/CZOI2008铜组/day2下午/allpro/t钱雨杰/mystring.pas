var str:string;
   { word:array[1..250] of string; }
    len:array[1..250,1..2] of shortint;
    l,i,k,j,most,first,last,fewest,answer1,answer2:longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(str);
l:=length(str);
first:=1;
k:=1;
for i:=1 to l do
    if str[i]=' ' then begin
                        last:=i-1;
                       { for j:=first to last do
                            word[k][j]:=str[j];}
                        len[k,1]:=last-first+1;
                        len[k,2]:=last;
                        inc(k);
                        first:=i+1;
                        end;
last:=l;
 len[k,1]:=last-first+1;
 len[k,2]:=last;
 inc(k);
fewest:=500; most:=0;
for i:=1 to k-1 do
    begin
    if len[i,1]<fewest then begin fewest:=len[i,1]; answer2:=i; end;
    if len[i,1]=1 then break;
    end;
for i:=1 to k-1 do
    begin
    if len[i,1]>most then begin most:=len[i,1]; answer1:=i; end;
    end;
{writeln(word[answer1]);
writeln(word[answer2]); }
for i:=1 to len[answer1,1] do
    write(str[len[answer1,2]-len[answer1,1]+i]);
writeln;
for i:=1 to len[answer2,1] do
    write(str[len[answer2,2]-len[answer2,1]+i]);
writeln;
close(input);
close(output);
end.
