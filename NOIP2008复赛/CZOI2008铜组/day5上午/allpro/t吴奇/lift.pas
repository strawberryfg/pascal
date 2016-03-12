program lift;
var n,a,i,b:longint;
    map:array[1..200]of longint;
procedure find(now,dep:longint);
begin
     if now=b then writeln(dep-1)
              else begin if dep>10000 then begin
                                                writeln('-1');
                                                exit;
                                           end;
                        if not(now+map[now]>n) then
                                   find(now+map[now],dep+1);
                        if not(now-map[now]<1) then
                                   find(now-map[now],dep+1);
                   end;
end;
begin
     assign(input,'lift.in');reset(input);
     assign(output,'lift.out');rewrite(output);
     read(n,a,b);
    for i:=1 to n do
     read(map[i]);
     find(a,1);
     close(input);
     close(output);
end.