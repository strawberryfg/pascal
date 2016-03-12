type point=^node;
     node=record
         data:longint;
         next:point;
         end;
var p,q,r,f,head:point;
    n,m,sum:longint;
    pd:boolean;
begin
readln(n,m);
sum:=0;
head:=nil;
while (sum<n) do
      begin
      new(p);
      inc(sum);
      if head=nil then begin q:=p;p^.data:=sum;head:=p;p^.next:=nil; end
         else begin
              q^.next:=p;
              p^.data:=sum;p^.next:=nil;
              new(q);
              q:=p;
              end;
      end;
q^.next:=head;
pd:=true;
p:=head;
q:=head;
r:=head;
while (pd=true) do
      begin
      sum:=0;
      while sum<m do
            begin
            inc(sum);f:=r;
            r:=q;
            q:=q^.next;
            end;
      write(r^.data:10);
      if r=q then pd:=false else pd:=true;
      f^.next:=r^.next; dispose(r);
      if pd=true then  r:=q;
      end;
writeln;
end.
