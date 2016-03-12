var n,i,j,k,l:longint;
    pd:boolean;
    ss:array[1..40,1..3]of string;
function isfix(a,b,c,d:longint):boolean;
var x,y:string;
    i:longint;
    pd:boolean;
begin
x:=ss[a,b]; y:=ss[c,d];   //x is the fix of y;
if length(x)>length(y) then exit(false);
pd:=true;
for i:=1 to length(x) do
    begin
    if x[i]<>y[i] then begin pd:=false;break; end;
    end;
if pd then exit(true);
pd:=true;                                              //pd fuchuzhi
for i:=length(y)+1-length(x) to length(y) do
    begin
    if x[i-(length(y)-length(x))]<>y[i] then
       begin
       pd:=false; break;
       end;
    end;
if pd then exit(true);
exit(false);
end;
begin
assign(input,'fix.in');
reset(input);
assign(output,'fix.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to 3 do
        begin
        readln(ss[i,j]);
        end;
    end;
for i:=1 to n do
    begin
    pd:=true;
    for j:=1 to 3 do
        begin

            for l:=1 to 3 do
                begin
                if (j=l) then continue;
                if isfix(i,j,i,l) then
                   begin
                   pd:=false;
                   break;
                   end;
                end;
        if not pd then break;
        end;
    if pd then writeln('Yes') else writeln('No');
    end;
close(input);
close(output);
end.
