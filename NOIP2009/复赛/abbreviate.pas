var n,i,j,l:longint;
    ts,add:string;
    str:array[1..51]of string[51];
    len:array[1..51]of longint;
function check(s:string;t:longint):boolean;
var left,mid,right,i:longint;
    pd:boolean;
    tmp:string;
begin
pd:=true;
for i:=1 to n do
    begin
    if i=t then continue;
    if length(s)=length(str[i]) then begin if s=str[i] then begin pd:=false;break; end; end
       else if length(s)<length(str[i]) then
               begin
               tmp:=copy(str[i],1,length(s));
               if tmp=s then begin pd:=false;break; end;
               end;

    end;
if pd=false then exit(true) else exit(false);
end;
begin
assign(input,'abbreviate.in');
reset(input);
assign(output,'abbreviate.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(str[i]);
    len[i]:=length(str[i]);
    end;
for i:=1 to n do
    begin
    ts:=str[i];
    add:=ts[1];
    l:=1;
    while (check(add,i)=true)and(l+1<=len[i]) do begin inc(l);add:=add+ts[l]; end;
    writeln(add);
    end;
close(input);
close(output);
end.
