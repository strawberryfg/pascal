var d:array[1..100000] of longint;
    pd:boolean;
    n,m,i,a,s,t,b,ma,j,k:longint;
begin
assign(input,'highway.in');
reset(input);
readln(n,m,i);
for j:=1 to n do
    d[j]:=i;
ma:=0;
for j:=1 to m do
    begin
    readln(a,s,t,b);
    case a of
         1:begin
           pd:=true;
           for k:=s to t do
               if d[k]<=0
                  then begin
                       pd:=false;
                       break;
                       end;
           if pd
              then begin
                   inc(ma);
                   for k:=s to t do
                       d[k]:=d[k]-b;
                   end;
           end;
         2:for k:=s to t do
               if d[k]>0
                  then d[k]:=d[k]+b;
         3:for k:=s to t do
               if (d[k]>0) and (d[k]<b)
                  then d[k]:=b;
    end;
    end;
close(input);
assign(output,'highway.out');
rewrite(output);
writeln(ma);
close(output);
end.
