type point=^node;
      node=record
      data:longint;
      next:point;
      end;
var p,q,g,head:point;
    x:longint;
begin
head:=nil;
while not eoln do
      begin
      read(x);
      new(p);
      if head=nil then begin head:=p;p^.data:=x; p^.next:=nil; end
         else
         begin
         g:=head; q:=head;
         while (g^.data<x)and(g^.next<>nil) do
               begin
               q:=g;
               g:=g^.next;
               end;
         if x>g^.data then
            begin
   	    g^.next:=p;p^.data:=x;p^.next:=nil;
            end
   	    else
            begin
            if (head=q)and(q=g) then begin head:=p;p^.data:=x;p^.next:=q; end
                      else begin q^.next:=p;p^.data:=x;p^.next:=g; end;
            end;
         end;
      end;
q:=head;
repeat
begin
 if q=nil then exit;
 write(q^.data:10);
 q:=q^.next;
end;
until q=nil;
end.
