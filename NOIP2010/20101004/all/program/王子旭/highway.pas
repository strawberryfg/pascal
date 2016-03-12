program sadf;
var
i,j,k,m,n,x,y,s,t,r,d,z,l:longint;
a:array[1..100000] of longint;
f:boolean;
begin
  assign(input,'highway.in');
  assign(output,'highway.out');
  reset(input);
  rewrite(output);
  readln(n,m,l);
  s:=0;
  for i:=1 to n do
    a[i]:=l;
  for i:=1 to m do
     begin
       read(d,x,y,z);
       f:=true;
       if d=1 then begin
          for j:=x to y do
            if a[j]<=0 then f:=false;
            if f then begin
                    inc(s);
               for j:=x to y do
                   dec(a[j],z);
                    end;
                  end;
       if d=2 then begin
           for j:=x to y do
             if a[j]>0 then begin
                inc(a[j],z);
                    end;
                 end;
       if d=3 then begin
          for j:=x to y do
             if a[j]>0 then begin
                 if a[j]<z then
                    a[j]:=z;
                            end;
                 end;
     end;
 writeln(s);
  close(input);
  close(output);
end.


