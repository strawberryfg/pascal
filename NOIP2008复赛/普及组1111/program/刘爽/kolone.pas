type node=record
    name:char;
    direct:boolean;
    end;
var n1,n2,t:longint;
    s1,s2:string;
    a,a2:array[1..100]of node;
procedure file1;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);
rewrite(output);
end;
procedure file2;
begin
close(input);
close(output);
end;
procedure dataout;
var oi,oj:longint;
begin
for oi:=1 to n1+n2 do
  write(a[oi].name);
writeln;
end;
procedure work;
var wi,wj:longint;
begin
   for wi:=1 to t do
     begin
       a2:=a;
       for wj:=1 to n1+n2-1 do
         begin
         if (a[wj].direct=true)and(a[wj+1].direct=false)
            then begin
                 a2[wj]:=a[wj+1];
                 a2[wj+1]:=a[wj];
                 end
         end;
         a:=a2;
     end;
end;
procedure datain;
var di,dj:longint;
begin
readln(n1,n2);
readln(s1);
readln(s2);
readln(t);
for di:=1 to n1 do
  begin
  a[n1-di+1].name:=s1[di];
  a[n1-di+1].direct:=true;
  end;
for dj:=n1+1 to n1+n2 do
  begin
  a[dj].name:=s2[dj-n1];
  a[dj].direct:=false;
  end;
end;
begin
file1;
datain;
work;
dataout;
file2;
end.