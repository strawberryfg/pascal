const maxm=100;
var p,t:array[1..maxm] of longint;
    f:array[1..maxm,1..maxm] of longint;
    m,k,i,j,v:longint;

function max(a,b:longint):longint;
begin
     if a>b then max:=a else max:=b;
end;

function min(a,b:longint):longint;
begin
     if a<b then min:=a else min:=b;
end;

procedure out(i,j:longint);
var v:longint;
begin
     if i=1 then
        begin
             writeln(1,' ',j);
             exit;
        end;
     for v:=i-1 to j-1 do
         if max(f[i-1,v],t[j]-t[v])<=f[k,m] then
            begin
                 out(i-1,v);
                 writeln(v+1,' ',j);
                 exit;
            end;
end;
begin
     assign(input,'book.in');
     assign(output,'book.out');
     reset(input);rewrite(output);
     read(m,k);
     for i:=1 to m do read(p[i]);
     t[1]:=p[1];
     for i:=2 to m do t[i]:=t[i-1]+p[i];

     for j:=1 to m do f[1,j]:=t[j];
     for i:=2 to k do
         for j:=i to m do
             begin
                  f[i,j]:=maxlongint;
                  for v:=i-1 to j-1 do
                      if f[i-1,v]>t[j]-t[v]
                         then begin
                                   if f[i-1,v]<f[i,j] then
                                      f[i,j]:=f[i-1,v];
                              end
                         else begin
                                   if t[j]-t[v]<f[i,j] then
                                      f[i,j]:=t[j]-t[v];
                              end;
             end;
     out(k,m);
     close(input);close(output);
end.

