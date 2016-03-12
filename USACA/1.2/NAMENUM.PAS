{
ID: xiaweiy1
PROG: namenum
LANG: PASCAL
}
const key:array[2..9]of string=('ABC','DEF','GHI','JKL','MNO','PRS','TUV','WXY');
var f:text;
    a:array[0..5000]of string[12];dep:longint;
procedure start;
var i,j,k:longint;
begin
assign(f,'dict.txt');
reset(f);
dep:=1;
while not eof(f) do
      begin
      readln(f,a[dep]);
      inc(dep);
      end;
close(f);
assign(input,'namenum.in');
reset(input);
assign(output,'namenum.out');
rewrite(output);
readln(input,a[0]);
end;
procedure print;
var i,j,k,l,t:longint;
    yes,go:boolean;
    code:integer;
begin
yes:=false;
for j:=1 to dep-1 do
    begin
    go:=true;
    for i:=1 to length(a[0]) do
        begin
        val(a[0][i],t,code);
        if (a[j][i]<>(key[t][1]))and(a[j][i]<>(key[t][2]))and(a[j][i]<>(key[t][3]))then
           begin go:=false;break;end;
        end;
    if (length(a[j])=length(a[0]))and (go=true) then begin writeln(a[j]);yes:=true;end;
    end;
if yes=false then writeln('NONE');
close(input);
close(output);
end;
begin
start;
print;
end.