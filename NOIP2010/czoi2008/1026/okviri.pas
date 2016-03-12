const inf:array[1..5,1..5]of char=
  (('.','.','#','.','.'),('.','#','.','#','.'),('#','.','.','.','#'),
    ('.','#','.','#','.'),('.','.','#','.','.'));
    tinf:array[1..5,1..5]of char=
    (('.','.','*','.','.'),('.','*','.','*','.'),('*','.','.','.','*'),
    ('.','*','.','*','.'),('.','.','*','.','.'));
var str:string;
    n,t,i,j,k:longint;
    pd:boolean;
    a:array[1..5,1..1000]of char;
begin
assign(input,'okviri.in');
reset(input);
assign(output,'okviri.out');
rewrite(output);
readln(str);
n:=length(str);
for i:=1 to n do
    begin
    t:=4*i-3;
    if i mod 3=0 then pd:=true else pd:=false;
    for j:=t to t+4 do
        begin
        for k:=1 to 5 do
            begin
            if pd then a[k,j]:=tinf[k,j-t+1]
               else a[k,j]:=inf[k,j-t+1];
            end;
        end;
    a[3,t+2]:=str[i];
    if i mod 3=1 then
       begin
       a[3,t]:='*';
       end;
    end;
a[3,1]:='#';
for i:=1 to 5 do
    begin
    for j:=1 to 4*n-3+4 do
        write(a[i,j]);
    writeln;
    end;
close(input);
close(output);
end.