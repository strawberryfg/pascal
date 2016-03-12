var n:byte;
    cow:array[1..1000000000] of byte;
    total:int64;
function try(dep:byte):longint;
         var i:byte;
         begin
         try:=0;
         if dep<=n then begin
                        try:=1;
                        inc(total);
                        cow[total]:=0;
                        end;
         while dep<=n do begin
                           for i:=1 to total do
                             if cow[i]=4 then cow[i]:=5 else
                             if cow[i]<4 then begin
                                                inc(cow[i]);
                                                if cow[i]<4 then inc(dep);
                                                if dep>n then exit;
                                                if(cow[i]=4)and(dep+1>n) then exit;
                                              end;
                             if cow[i]=4 then begin
                                                if dep>n then exit;
                                                try:=try+try(dep+1);
                                                end;
                        end;
         end;
begin
   assign(input,'cow.in');
   assign(output,'cow.out');
   reset(input);
   rewrite(output);
   readln(n);
   writeln(try(0));
   close(output);
   close(input);
end.
