var i,n,a,b,t:longint;
    k,x:array[-100..2100]of longint;
procedure work(n,dep,s:longint);
        var i,l:longint;p:boolean;
        begin
        if dep=b then begin if s<t then t:=s;end
                 else begin
                      l:=dep;p:=false;
                      dep:=dep+k[dep];
                      if (dep<=n)and(x[dep]=0) then begin x[dep]:=1;p:=true;work(n,dep,s+1);end;
                      if p then x[dep]:=0;dep:=l;
                      dep:=dep-k[dep];
                      if (dep>=1)and(x[dep]=0) then begin x[dep]:=1;p:=true;work(n,dep,s+1);end;
                      if p then x[dep]:=0;dep:=l;
                      end;
        end;
begin
assign(input,'lift.in');reset(input);
assign(output,'lift.out');rewrite(output);
readln(n,a,b);
for i:=1 to n do
        read(k[i]);
readln;
x[a]:=1;t:=maxlongint;
work(n,a,0);
if t=maxlongint then writeln('-1')
       else writeln(t);
close(input);
close(output);
end.