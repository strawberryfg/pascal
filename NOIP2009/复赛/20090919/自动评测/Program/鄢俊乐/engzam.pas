type point=^node;
     node=record
          data:longint;
          next:array['a'..'z'] of point;
          end;
var c:char;
    n,m,a,i,j:longint;
    p,q,r:point;
procedure engzam(p:point);
          var i:longint;
          begin
          if p^.data>=j
             then inc(a);
          for i:=97 to 122 do
              if p^.next[chr(i)]<>nil
                 then engzam(p^.next[chr(i)]);
          end;
begin
new(r);
r^.data:=0;
for i:=97 to 122 do
    r^.next[chr(i)]:=nil;
assign(input,'engzam.in');
reset(input);
readln(n,m);
for i:=1 to n do
    begin
    p:=r;
    read(c);
    while c<>' ' do
          begin
          if p^.next[c]=nil
             then begin
                  new(q);
                  p^.next[c]:=q;
                  q^.data:=0;
                  for j:=97 to 122 do
                      q^.next[chr(j)]:=nil;
                  end;
          p:=p^.next[c];
          read(c);
          end;
    readln(p^.data);
    end;
assign(output,'engzam.out');
rewrite(output);
for i:=1 to m do
    begin
    p:=r;
    read(c);
    while (c<>' ') and (p<>nil) do
          begin
          p:=p^.next[c];
          read(c);
          end;
    readln(j);
    if p=nil
       then writeln(0)
       else begin
            a:=0;
            engzam(p);
            writeln(a);
            end;
    end;
close(input);
close(output);
end.
