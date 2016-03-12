var n,m,i,x,y:longint;
    a:array[0..1000,0..1000]of integer;
    f:array[0..1000]of boolean;
function work(po:longint):longint;
        var i,s:longint;
        begin
         if f[po] or(a[po,0]=0) then exit(a[po,0]);
         f[po]:=true;
         for i:=1 to n do
                begin
                 if a[po,i]=1 then s:=work(po);
                 if s=0 then
                        begin a[po,i]:=0;dec(a[po,0]);
                        if a[po,0]=0 then break;end;
                end;
         work:=a[po,0];
        end;
begin
 assign(input,'message.in');
 reset(input);
 assign(output,'message.out');
 rewrite(output);
 readln(n,m);
 for i:=1 to m do
        begin
         readln(x,y);
         a[x,y]:=1;
         inc(a[y,0]);
        end;
 work(1);
 for i:=1 to n do
        if a[i,0]<>0 then writeln('T') else writeln('F');
 close(input);
 close(output);
end.
