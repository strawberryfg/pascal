{
ID: xiaweiy1
PROG: runround
LANG: PASCAL
}
const ten:array[0..9]of longint=(1,10,100,1000,10000,100000,1000000,10000000,
                                 100000000,1000000000);
var i,j,n,m,k,tot,p:longint;
    pd,spe:boolean;
    s:string;
    code:integer;
    go,a:array[1..9]of integer;
begin
assign(input,'runround.in');
reset(input);
assign(output,'runround.out');
rewrite(output);
readln(n);
i:=n+1;
if i<10 then i:=12;
while  true do
 begin
 str(i,s);
 for j:=1 to length(s) do if s[j]='0' then s[j]:='1';
 pd:=false;
 val(s,i,code);
 repeat
 begin
 str(i,s);
 m:=length(s);
 spe:=true;
 for j:=1 to m-1 do
     begin
     for k:=j+1 to m do
         begin
         if s[j]=s[k] then
            begin
            i:=i+ten[m-k];
            spe:=false;
            break;
            end;
         end;
     if (spe=false)or((j=m-1)and(k=m)) then break;
     end;
 if spe=true then pd:=true;
 end;
 until pd=true;
 k:=1; tot:=0; fillchar(go,sizeof(go),0);
 go[1]:=1;
 for j:=1 to length(s) do a[j]:=ord(s[j])-48;
 while tot<=m do
   begin
   p:=k;
   k:=(k+a[k])mod m;
   if k=0 then k:=m;
   if (p=k)or((go[k]=1)and(k<>1)) then break;
   inc(tot);
   if k=1 then break;
   go[k]:=1;
   end;
 if  (k=1)and(tot=m) then begin writeln(i);break; end;
 inc(i);
 end;
close(input);
close(output);
end.