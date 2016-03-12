var
     i,j,n,a,b:longint;
     min:int64;
     s,h:array[1..200] of longint;

procedure try(md:longint);
var
     m:longint;
begin
     if md=b then m:=0;
     if md+s[md]<=n then
                        begin
                        inc(m);
                        if (md+s[md]=a) and (m<min) then min:=m
                           else if h[md+s[md]]<>1 then begin
                                                       h[md+s[md]]:=1;
                                                       try(md+s[md]);
                                                       end;
                        end;
     if md-s[md]>0 then
                        begin
                        inc(m);
                        if (md-s[md]=a) and (m<min) then min:=m
                           else if h[md-s[md]]<>1 then begin
                                                       h[md-s[md]]:=1;
                                                       try(md-s[md]);
                                                       end;
                        end;
end;

begin
     assign(input,'lift.in');
     assign(output,'lift.out');
     reset(input);
     rewrite(output);

     readln(n,a,b);
     for i:=1 to n do
         read(s[i]);
     min:=10000;
     try(b);
     if min=10000 then writeln(-1)
                   else writeln(min);

     close(input);
     close(output);
end.
